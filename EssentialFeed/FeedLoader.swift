//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 27/07/23.
//

import Foundation

typealias LoadFeedResult = Result<FeedItem, Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
