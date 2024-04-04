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

    func showCreatePostScreen(navigationConroller: UINavigationController) {
        router?.pushToCreatePostScreen(navigationConroller: navigationConroller)
    }
}
