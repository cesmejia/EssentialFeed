//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 02/08/23.
//

import Foundation

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (FeedItemResult) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success(response):
                do {
                    let items = try FeedItemsMapper.map(response.data, response.httpUrlResponse)
                    completion(.success(items))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(_):
                completion(.failure(.connectivity))
            }
        }
    }
}

public typealias FeedItemResult = (Result<[FeedItem], RemoteFeedLoader.Error>)
