//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 27/07/23.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let decription: String?
    let location: String?
    let imageURL: URL
}
