//
//  PostListInteractor.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation

class PostListInteractor: PostListInteractorProtocol {

    var presenter: PostListPresenterProtocol?

    func getPostListData() {
        if let postsRawData = PostListInteractor.loadJsonData() {
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

    private static func loadJsonData() -> Data? {
        let path = Bundle(for: self).path(forResource: "Posts", ofType: "json")
        guard let jsonString = try? String(contentsOfFile: path!, encoding: .utf8) else {
            return nil
        }
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
