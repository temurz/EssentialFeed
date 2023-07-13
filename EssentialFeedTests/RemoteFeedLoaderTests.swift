//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest

class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        
        XCTAssertEqual(client.requstURL, url)
    }

}
