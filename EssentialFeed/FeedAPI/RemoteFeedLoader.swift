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
                if response.httpUrlResponse.statusCode == 200, let root = try? JSONDecoder().decode(Root.self, from: response.data) {
                    completion(.success(root.items))
                } else {
                    completion(.failure(.invalidData))
                }
            case let .failure(error):
                completion(.failure(.connectivity))
            }
        }
    }
}

public typealias HTTPClientResult = (Result<(data: Data, httpUrlResponse: HTTPURLResponse), Error>)
public typealias FeedItemResult = (Result<[FeedItem], RemoteFeedLoader.Error>)

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

private struct Root: Decodable {
    let items: [FeedItem]
}
