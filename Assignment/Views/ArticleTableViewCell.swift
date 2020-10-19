//
//  ArticleTableViewCell.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import UIKit
//import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    static let identifier = "Article"

    @IBOutlet weak var imgDisplay: CachedImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblByLine: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /*!
     * @discussion This fuunc is to configure your cell using view model
     * @param viewModel
     * @return Void
     */
    func configure(withViewModel viewModel: ArticleViewPresentable) -> Void {

        lblTitle.text = viewModel.title
        lblByLine.text = viewModel.byline
        lblSource.text = viewModel.source
        lblPublishedDate.text = viewModel.published_date

        imgDisplay.image = UIImage(named: "ProfilePlaceholder")

        let mediaMetadata = viewModel.media[0].mediaMetadata.filter({ $0.width == Constants.profileDisplaySize75 })

        imgDisplay.loadImage(urlString: mediaMetadata[0].url)
    }
}
