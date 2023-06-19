//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Temur on 19/06/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: (LoadFeedResult) -> Void)
}
