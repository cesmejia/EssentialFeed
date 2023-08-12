//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 27/07/23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedItem], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
