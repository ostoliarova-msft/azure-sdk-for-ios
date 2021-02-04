// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable cyclomatic_complexity

public struct ChatThreadInfo: Codable, Equatable {
    // MARK: Properties

    /// Chat thread id.
    public let id: String?
    /// Chat thread topic.
    public let topic: String?
    /// Flag if a chat thread is soft deleted.
    public let isDeleted: Bool?
    /// The timestamp when the last message arrived at the server. The timestamp is in ISO8601 format: `yyyy-MM-ddTHH:mm:ssZ`.
    public let lastMessageReceivedOn: Iso8601Date?

    // MARK: Initializers

    /// Initialize a `ChatThreadInfo` structure.
    /// - Parameters:
    ///   - id: Chat thread id.
    ///   - topic: Chat thread topic.
    ///   - isDeleted: Flag if a chat thread is soft deleted.
    ///   - lastMessageReceivedOn: The timestamp when the last message arrived at the server. The timestamp is in ISO8601 format: `yyyy-MM-ddTHH:mm:ssZ`.
    public init(
        id: String? = nil, topic: String? = nil, isDeleted: Bool? = nil, lastMessageReceivedOn: Iso8601Date? = nil
    ) {
        self.id = id
        self.topic = topic
        self.isDeleted = isDeleted
        self.lastMessageReceivedOn = lastMessageReceivedOn
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case isDeleted = "isDeleted"
        case lastMessageReceivedOn = "lastMessageReceivedOn"
    }

    /// Initialize a `ChatThreadInfo` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decode(String.self, forKey: .id)
        self.topic = try? container.decode(String.self, forKey: .topic)
        self.isDeleted = try? container.decode(Bool.self, forKey: .isDeleted)
        self.lastMessageReceivedOn = try? container.decode(Iso8601Date.self, forKey: .lastMessageReceivedOn)
    }

    /// Encode a `ChatThreadInfo` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try? container.encode(id, forKey: .id) }
        if topic != nil { try? container.encode(topic, forKey: .topic) }
        if isDeleted != nil { try? container.encode(isDeleted, forKey: .isDeleted) }
        if lastMessageReceivedOn != nil { try? container.encode(lastMessageReceivedOn, forKey: .lastMessageReceivedOn) }
    }
}
