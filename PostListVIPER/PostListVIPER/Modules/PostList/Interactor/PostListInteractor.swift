//
//  PostListInteractor.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation

class PostListInteractor: PostListInteractorProtocol {

    var presenter: PostListPresenterProtocol?

    /// Get postData from JSON and decodes to PostModel
    /// If decoding succeedes it sends the post array to presenter
    /// In case of error it sends the respective error to presenter
    func getPostListData() {
        if let postsRawData = PostListInteractor.loadJsonData(fileName: "Posts") {
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: postsRawData)
                presenter?.postListFetchSuccess(posts: posts)
            } catch {
                presenter?.postListFetchFailure(error: CustomError.unableToParseData)
            }
        } else {
            presenter?.postListFetchFailure(error: CustomError.dataNotFound)
        }
    }

    /// Get userData from JSON and decodes to UserModel
    /// If decoding succeedes it sends the user array to presenter
    /// In case of error it sends the respective error to presenter
    func getUserListData() {
        if let usersRawData = PostListInteractor.loadJsonData(fileName: "Users") {
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: usersRawData)
                presenter?.userListFetchSuccess(users: users)
            } catch {
                presenter?.userListFetchFailure(error: CustomError.unableToParseData)
            }
        } else {
            presenter?.userListFetchFailure(error: CustomError.dataNotFound)
        }
    }

    /// It returns array of UserNames from array of UserModel
    /// - Parameter users: Array of UserModel
    /// - Returns: array of UserNames
    func getUserNamesFrom(users: [UserModel]) -> [String] {
        var userNames = [String]()
        userNames.append("All")
        let usrNamesArray = users.map {$0.userName}
        userNames.append(contentsOf: usrNamesArray)
        return userNames
    }

    /// This function filters the posts for a particular user
    /// - Parameters:
    ///   - userName: Username of the User
    ///   - posts: Array of all Post
    /// - Returns: Array of Post after filter
    func filterPostWith(userName: String, posts: [PostModel]) -> [PostModel] {
        if userName == "All" {
            return posts
        } else {
            return posts.filter {$0.userName == userName}
        }
    }

    /// This function fetches the JSON file and converts it to jsonString and jsonString to data
    /// - Parameter fileName: name of the JSON file
    /// - Returns: JSON Data
    private static func loadJsonData(fileName: String) -> Data? {
        let path = Bundle(for: self).path(forResource: fileName, ofType: "json")
        guard let jsonString = try? String(contentsOfFile: path!, encoding: .utf8) else {
            return nil
        }
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
