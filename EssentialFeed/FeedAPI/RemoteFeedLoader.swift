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
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success(response):
                completion(.invalidData)
            case let .failure(error):
                completion(.connectivity)
            }
        }
    }
}

public typealias HTTPCLientResult = (Result<(Data, HTTPURLResponse), Error>)

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPCLientResult) -> Void)
}
