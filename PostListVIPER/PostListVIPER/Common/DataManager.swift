//
//  DataManager.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation

final class DataManager {
    static let sharedInstance = DataManager()
    private init() {}
    var user = UserModel(userId: 1, name: "Sajib", userName: "@imSajib")
}
