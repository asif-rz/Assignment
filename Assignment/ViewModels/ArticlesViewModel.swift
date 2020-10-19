//
//  ArticlesViewModel.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import UIKit

// MARK: - Article ViewModel

protocol ArticlesViewDelegate: class {
    func reloadArticles()
}

class ArticlesViewModel {

    private let client = ArticleClient()

    weak var articlesView: ArticlesView?

    var articles: [ArticleViewPresentable] = []

    init(articlesView: ArticlesView) {

        self.articlesView = articlesView
        loadData()
    }
}

extension ArticlesViewModel: ArticlesViewDelegate {

    func reloadArticles() {

        self.articlesView?.reloadArticles()
    }
}

extension ArticlesViewModel {

    func loadData() {

        /**
         * First check internet connection, if no internet, show Alert
         */
        NetworkManager.isUnreachable { _ in

            UIAlertController.shared().showAlert(withTitle: Constants.AlertMessages.alert, message: Constants.AlertMessages.checkInternetConnection, autoHideDuration: 3)
            self.articlesView?.stopActivityLoader()
        }

        /**
         * First check internet connection, Show activity indicator and start loading data from server
         */
        NetworkManager.isReachable { _ in

            // Start activity indicator and load data
            self.articlesView?.startActivityLoader()
            self.fetchArticles()
        }
    }

    func fetchArticles() {

        client.getFeed(from: .seven) { [weak self] (result) in

            switch result {
            case .success(let articleFeedResult):
                guard let articleResults = articleFeedResult?.results else { return }

                let articleViewModels = articleResults.map({ ArticleViewModel(id: $0.id, title: $0.title, byline: $0.byline, source: $0.source, published_date: $0.published_date, abstract: $0.abstract, media: $0.media, parentViewModel: self!) })

                self?.articles = articleViewModels
                self?.reloadArticles()
                self?.articlesView?.stopActivityLoader()

            case .failure:
                self?.articlesView?.stopActivityLoader()
            }
        }
    }
}
