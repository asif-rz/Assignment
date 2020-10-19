//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {

    private var client: ArticleClient!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        client = ArticleClient()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

        client = nil
    }

    // Test: Is internet connection available?
    func testInternetConnection() {

        NetworkManager.isReachable { (_) in
            XCTAssertTrue(true, "Network is Available")
        }

        NetworkManager.isUnreachable { (_) in
            XCTAssertFalse(true, "Network is not available")
        }
    }

    // MARK: - Validation from Server

    // Test: Valid URL
    func testIsValidAPIKey() {

        let apiKey = ArticleFeed.seven.apiKey
        XCTAssertEqual(apiKey, "api-key=414c3c919d7d401bb264ef2bf0924971", "API Key is correct")
    }

    // Test: Valid URL
    func testIsValidURL() {

        let feedPath = ArticleFeed.seven
        let request = feedPath.request

        if let url = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=414c3c919d7d401bb264ef2bf0924971") {
            XCTAssertEqual(request, URLRequest(url: url), "Feed URL is correct")
        } else {
            XCTAssertFalse(true)
        }
    }

    // Test: Get Feed
    func testGetFeed() {

        client.getFeed(from: .seven) { (result) in

            switch result {
            case .success(let articleFeedResult):
                guard let articleResults = articleFeedResult?.results else { return }
                XCTAssertFalse(articleResults.isEmpty)
                XCTAssertNotNil(articleResults)

            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

    // MARK: - Validation Article View Model
    func testArticleViewModel() {

        let article = Article(id: 100000006140728, title: "Trump Engaged in Suspect Tax Schemes as He Reaped Riches From His Father", byline: "By DAVID BARSTOW, SUSANNE CRAIG and RUSS BUETTNER", source: "The New York Times", published_date: "2018-10-02", abstract: "The president has long sold himself as a self-made billionaire, but a Times investigation found that he received at least $413 million in today’s dollars from his father’s real estate empire, much of it through tax dodges in the 1990s.", media: [Media(mediaMetadata: [MediaMetadata(url: "https://static01.nyt.com/images/2018/10/07/us/fred-trump-inv-promo-image/fred-trump-inv-promo-image-square320.jpg", format: "square320", height: 320, width: 320)])])

        let articleViewModel = ArticleViewModel(article: article)

        XCTAssertEqual(article.id, articleViewModel.id)
        XCTAssertEqual(article.title, articleViewModel.title)
        XCTAssertEqual(article.byline, articleViewModel.byline)
        XCTAssertEqual(article.published_date, articleViewModel.published_date)
        XCTAssertEqual(article.abstract, articleViewModel.abstract)
        XCTAssertEqual(article.media[0].mediaMetadata[0].url, articleViewModel.media[0].mediaMetadata[0].url)
    }
}
