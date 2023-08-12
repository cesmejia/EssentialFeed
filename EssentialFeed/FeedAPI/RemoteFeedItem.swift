//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 12/08/23.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
