//
//  ArticleFeedResult.swift
//  Assignment
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

// MARK: - Model Object: Article Results

struct ArticleFeedResult: Codable {
    let results: [Article]?
}
