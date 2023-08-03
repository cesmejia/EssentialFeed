//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 27/07/23.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID, decription: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = decription
        self.location = location
        self.imageURL = imageURL
    }
}

extension FeedItem: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case description
        case location
        case imageURL = "image"
    }
}
