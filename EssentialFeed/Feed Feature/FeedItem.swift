//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Temur on 19/06/2023.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
