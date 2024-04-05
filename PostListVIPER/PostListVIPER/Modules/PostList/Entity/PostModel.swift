//
//  PostModel.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation

struct PostModel: Decodable {
    let id: Int
    let name: String
    let userName: String
    let description: String
    let thumbnail: String
}
