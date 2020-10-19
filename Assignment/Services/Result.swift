//
//  Result.swift
//  Assignment
//
//  Created by Asif Raza on 06/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
