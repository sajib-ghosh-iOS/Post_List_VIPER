//
//  PostListPresenter.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation
import UIKit

class PostListPresenter: PostListPresenterProtocol {

    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorProtocol?
    var router: PostListRouterProtocol?

    func fetchPostList() {
        interactor?.getPostListData()
    }

    func postListFetchSuccess(posts: [PostModel]) {
        view?.onPostListResponseSuccess(posts: posts)
    }

    func postListFetchFailure(error: Error) {
        view?.onPostListResponseFailure(error: error.localizedDescription)
    }

    func fetchUserList() {
        interactor?.getUserListData()
    }

    func getUserNamesFrom(users: [UserModel]) -> [String] {
        return interactor?.getUserNamesFrom(users: users) ?? []
    }

    func userListFetchSuccess(users: [UserModel]) {
        view?.onUserListResponseSuccess(users: users)
    }

    func getPostOf(userName: String, posts: [PostModel]) -> [PostModel] {
        interactor?.filterPostWith(userName: userName, posts: posts) ?? []
    }
    func userListFetchFailure(error: Error) {
        view?.onUserListResponseFailure(error: error.localizedDescription)
    }

    func showCreatePostScreen(from: PostListVC, to navigationController: UINavigationController) {
        router?.showCreatePostScreen(from: from, to: navigationController)
    }
}
