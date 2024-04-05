//
//  AddPostProtocols.swift
//  AddPostVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation
import UIKit

protocol AddPostViewProtocol: AnyObject {
    func onAddPostResponseSuccess(post: PostModel)
    func onAddPostResponseFailure(error: String)
}
protocol AddPostPresenterProtocol: AnyObject {
    var view: AddPostViewProtocol? {get set}
    var interactor: AddPostInteractorProtocol? {get set}
    var router: AddPostRouterProtocol? {get set}
    func addPost(post: AddPostModel)
    func addPostFetchSuccess(post: PostModel)
    func addPostFetchFailure(error: Error)
}
protocol AddPostInteractorProtocol: AnyObject {
    var presenter: AddPostPresenterProtocol? {get set}
    func addPostData(post: AddPostModel)
}
protocol AddPostRouterProtocol: AnyObject {
    static func createModule(dependency: AddPostDependency) -> AddPostVC?
}

protocol AddPostCompletionProtocol: AnyObject {
    func onAddPostSuccess(post: PostModel)
    func onAddPostFailure(error: String)
}
