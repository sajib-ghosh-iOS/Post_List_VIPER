//
//  AddPostPresenter.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation

class AddPostPresenter: AddPostPresenterProtocol {

    var view: AddPostViewProtocol?
    var interactor: AddPostInteractorProtocol?
    var router: AddPostRouterProtocol?

    func addPost(post: AddPostModel) {
        interactor?.addPostData(post: post)
    }

    func addPostFetchSuccess(post: PostModel) {
    }

    func addPostFetchFailure(error: Error) {
    }
}
