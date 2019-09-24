//
//  UrlSessionTransport.swift
//  AzureCore
//
//  Created by Travis Prescott on 8/30/19.
//  Copyright © 2019 Azure SDK Team. All rights reserved.
//

import os
import Foundation

public enum UrlSessionTransportError: Error {
    case invalidSession
}

public class UrlSessionTransport: HttpTransport {

    public var next: PipelineSendable?

    private var session: URLSession?
    private var config: URLSessionConfiguration

    public init() {
        self.config = URLSessionConfiguration.default
    }

    public func open() {
        guard self.session == nil else { return }
        self.session = URLSession(configuration: self.config, delegate: nil, delegateQueue: nil)
    }

    public func close() {
        self.session = nil
    }

    public func sleep(duration: Int) {
        Foundation.sleep(UInt32(duration))
    }

    public func send(request: PipelineRequest, onResult handler: @escaping CompletionHandler) throws {
        self.open()
        guard let session = self.session else {
            throw UrlSessionTransportError.invalidSession
        }

        var urlRequest = URLRequest(url: URL(string: request.httpRequest.url)!)
        urlRequest.httpMethod = request.httpRequest.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = request.httpRequest.headers
        session.dataTask(with: urlRequest) { (data, response, error) in
            var httpResponse: UrlHttpResponse?
            if let data = data, let rawResponse = response as? HTTPURLResponse {
                httpResponse = UrlHttpResponse(request: request.httpRequest, response: rawResponse)
                httpResponse?.data = data
            }
            request.completion(httpResponse, error)
        }.resume()
    }
}
