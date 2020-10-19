//
//  ArticleClient.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

class ArticleClient: APIClient {

    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getFeed(from articleFeedType: ArticleFeed, completion: @escaping (Result<ArticleFeedResult?, APIError>) -> Void) {

        let endpoint = articleFeedType
        let request = endpoint.request

        fetch(with: request, decode: { json -> ArticleFeedResult? in
            guard let articleFeedResult = json as? ArticleFeedResult else { return  nil }
            return articleFeedResult
        }, completion: completion)
    }
}
