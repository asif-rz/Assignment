//
//  ArticleViewModel.swift
//  Assignment
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

protocol ArticleViewDelegate: class {

    func onArticleSelected()
}

class ArticleViewModel: ArticleViewPresentable {

    var id: Int64
    var title: String
    var byline: String
    var source: String
    var published_date: String
    var abstract: String
    var media: [Media]

    weak var parent: ArticlesViewDelegate?

    init(id: Int64, title: String, byline: String, source: String, published_date: String, abstract: String, media: [Media], parentViewModel: ArticlesViewDelegate) {

        self.id = id
        self.title = title
        self.byline = byline
        self.source = source
        self.published_date = published_date
        self.abstract = abstract
        self.media = media

        self.parent = parentViewModel
    }

    init(article: Article) {

        self.id = article.id
        self.title = article.title
        self.byline = article.byline
        self.source = article.source
        self.published_date = article.published_date
        self.abstract = article.abstract
        self.media = article.media
    }
}

extension ArticleViewModel: ArticleViewDelegate {

    /*!
     * @discussion On Article selected received in view model on didSelectRowAt
     * @param Void
     * @return Void
     */

    func onArticleSelected() {
        //print("Did select row at received article with id: \(id)")
    }
}
