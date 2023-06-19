//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requstURL = URL(string: "https://asd-url.com")
    }
}
class HTTPClient {
    static let shared = HTTPClient()
    private init() {}
    var requstURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        let systemUnderTest = RemoteFeedLoader()
        let client = HTTPClient.shared
        
        XCTAssertNil(client.requstURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        sut.load()
        
        XCTAssertNotNil(client.requstURL)
    }

}
