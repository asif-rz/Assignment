//
//  ArticlesViewController.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import UIKit

protocol ArticlesView: class {
    func reloadArticles()
    func startActivityLoader()
    func stopActivityLoader()
}

class ArticlesViewController: UIViewController {

    @IBOutlet weak var tableViewArticles: UITableView!

    /**
     * Activity Indicator
     */
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    /**
     * Created instance of View Model
     */
    var viewModel: ArticlesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ArticlesViewModel(articlesView: self)

        self.tableViewArticles.dataSource = self
        self.tableViewArticles.delegate = self
        self.tableViewArticles.estimatedRowHeight = 44
        self.tableViewArticles.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if segue.identifier == Constants.Segue.details {

            if let detailsVC = segue.destination as? DetailsViewController {
                detailsVC.articleViewModel = sender as? ArticleViewPresentable
            }
        }
    }
}

// MARK: - Tableview Datasource
extension ArticlesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.articles.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell

        let articleViewModel = viewModel?.articles[indexPath.row]

        cell?.configure(withViewModel: articleViewModel!)
        cell?.isAccessibilityElement = true

        return cell!
    }
}

// MARK: - Tableview Delegate

extension ArticlesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let articleViewModel = viewModel?.articles[indexPath.row]
//        (articleViewModel as? ArticleViewDelegate)?.onArticleSelected()

        performSegue(withIdentifier: Constants.Segue.details, sender: articleViewModel)
    }
}

// MARK: - Start and stop methods to start and stop activity indicator
extension ArticlesViewController {

    fileprivate func startloading() {

        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    fileprivate func stopLoading() {

        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}

extension ArticlesViewController: ArticlesView {

    func reloadArticles() {

        DispatchQueue.main.async {

            self.tableViewArticles.reloadData()
        }
    }

    func startActivityLoader() {

        startloading()
    }

    func stopActivityLoader() {

        stopLoading()
    }
}
