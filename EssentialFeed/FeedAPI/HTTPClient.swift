//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 04/08/23.
//

import Foundation

public typealias HTTPClientResult = (Result<(data: Data, httpUrlResponse: HTTPURLResponse), Error>)

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
