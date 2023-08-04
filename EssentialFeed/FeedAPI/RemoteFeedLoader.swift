//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 02/08/23.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {

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
    
    public func load(completion: @escaping (LoadFeedResult) -> Void) {
        client.get(from: url) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                completion(FeedItemsMapper.map(data: response.data, from: response.httpUrlResponse))
            case .failure(_):
                completion(.failure(.connectivity))
            }
        }
    }
}
