//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest

class RemoteFeedLoader {
    private let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://asd-url.com")!)
    }
}
protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requstURL = url
    }
    var requstURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        //systemUnderTest
        
        let client = HTTPClientSpy()
        
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requstURL)
    }
    
    func test_load_requestDataFromURL() {
        //systemUnderTest
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        sut.load()
        
        XCTAssertNotNil(client.requstURL)
    }

}
