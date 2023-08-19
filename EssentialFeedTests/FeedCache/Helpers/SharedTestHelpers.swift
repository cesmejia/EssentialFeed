//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Ces Mejia on 18/08/23.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
