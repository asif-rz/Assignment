//
//  Endpoint.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

protocol Endpoint {

    var base: String { get }
    var path: String { get }
}

extension Endpoint {

    var apiKey: String {
        return "api-key=414c3c919d7d401bb264ef2bf0924971"
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum ArticleFeed {

    case one
    case seven
    case thirty
}

extension ArticleFeed: Endpoint {

    var base: String {
        return "http://api.nytimes.com"
    }

    var path: String {
        switch self {
        case .one: return "/svc/mostpopular/v2/mostviewed/all-sections/1.json"
        case .seven: return "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        case .thirty: return "/svc/mostpopular/v2/mostviewed/all-sections30.json"
        }
    }
}
