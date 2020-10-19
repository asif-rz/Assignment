//
//  Article.swift
//  Assignment
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

extension Constants {

    static let profileDisplaySize75 = 75
    static let profileDisplaySize320 = 320
}

// MARK: - Model Object: Article

protocol ArticleViewPresentable {

    var id: Int64 { get }
    var title: String { get }
    var byline: String { get }
    var source: String { get }
    var published_date: String { get }
    var abstract: String { get }
    var media: [Media] { get }
}

struct Article: ArticleViewPresentable, Codable {

    var id: Int64
    var title: String
    var byline: String
    var source: String
    var published_date: String
    var abstract: String
    var media: [Media]
}

struct Media: Codable {
    var mediaMetadata: [MediaMetadata]

    private enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    var url: String
    var format: String
    var height: Int
    var width: Int
}
