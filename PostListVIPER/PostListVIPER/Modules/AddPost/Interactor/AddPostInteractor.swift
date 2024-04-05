//
//  AddPostInteractor.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation

class AddPostInteractor: AddPostInteractorProtocol {

    var presenter: AddPostPresenterProtocol?
    func addPostData(post: AddPostModel) {
        let postModel = PostModel(id: Int.random(in: 100..<1000),
                                  name: post.name,
                                  userName: post.userName,
                                  description: post.description,
                                  thumbnail: post.imageURL?.absoluteString ?? "")
        presenter?.view?.onAddPostResponseSuccess(post: postModel)
    }
}
