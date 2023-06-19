//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest

class RemoteFeedLoader {
    
}
class HTTPClient {
    var requstURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        let systemUnderTest = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requstURL)
    }

}
