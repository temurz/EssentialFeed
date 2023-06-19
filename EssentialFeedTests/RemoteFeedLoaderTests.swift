//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://asd-url.com")!)
    }
}
class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requstURL = url
    }
    var requstURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        //systemUnderTest
        _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        XCTAssertNil(client.requstURL)
    }
    
    func test_load_requestDataFromURL() {
        //systemUnderTest
        let sut = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        sut.load()
        
        XCTAssertNotNil(client.requstURL)
    }

}
