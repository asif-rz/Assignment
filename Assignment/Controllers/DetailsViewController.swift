//
//  DetailsViewController.swift
//  Assignment
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import UIKit
//import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var imgDisplay: CachedImageView!
    @IBOutlet weak var lblDescription: UILabel!

    var articleViewModel: ArticleViewPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let articleViewModel = articleViewModel {

            lblSource.text = articleViewModel.source

            let mediaMetadata = articleViewModel.media[0].mediaMetadata.filter({ $0.width == Constants.profileDisplaySize320 })

            if mediaMetadata.count != 0 {
                imgDisplay.image = UIImage(named: "ProfilePlaceholder")
                imgDisplay.loadImage(urlString: mediaMetadata[0].url)
            }

            lblDescription.text = articleViewModel.abstract
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBackTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
