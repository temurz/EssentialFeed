//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Temur on 19/06/2023.
//

import XCTest
import EssentialFeed



final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        //systemUnderTest
        
        let (_, client) = makeSUT()
        XCTAssertNil(client.requstURL)
    }
    
    func test_load_requestsDataFromURL() {
        //systemUnderTest
        let url = URL(string: "https://a-url.com")!
        let (sut, client) = makeSUT(url: URL(string: "https://a-url.com")!)
        sut.load()
        
        XCTAssertEqual(client.requstURL, url)
    }
    
    //MARK: - Headers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {
        func get(from url: URL) {
            requstURL = url
        }
        var requstURL: URL?
    }
}
