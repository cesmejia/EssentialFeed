//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Ces Mejia on 20/08/23.
//

import Foundation

final class FeedCachePolicy {
    private static  let calendar = Calendar(identifier: .gregorian)
    
    private static  var maxCacheAgeInDays: Int {
        7
    }
    
    private init() {}
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
