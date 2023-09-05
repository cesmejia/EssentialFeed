//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 04/08/23.
//

import Foundation

public typealias HTTPClientResult = (Result<(data: Data, httpUrlResponse: HTTPURLResponse), Error>)

public protocol HTTPClient {
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
