//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 04/08/23.
//

import Foundation

final class FeedItemsMapper {
    private static let OK_200 = 200
    
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
