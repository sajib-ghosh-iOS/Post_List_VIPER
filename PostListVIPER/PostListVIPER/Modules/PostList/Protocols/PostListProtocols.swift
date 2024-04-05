//
//  PostListProtocols.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation
import UIKit

protocol PostListViewProtocol: AnyObject {
    func onPostListResponseSuccess(posts: [PostModel])
    func onPostListResponseFailure(error: String)
}
protocol PostListPresenterProtocol: AnyObject {
    var view: PostListViewProtocol? {get set}
    var interactor: PostListInteractorProtocol? {get set}
    var router: PostListRouterProtocol? {get set}
    func fetchPostList()
    func showCreatePostScreen(from: PostListVC, to navigationController: UINavigationController)
    func postListFetchSuccess(posts: [PostModel])
    func postListFetchFailure(error: Error)
}
protocol PostListInteractorProtocol: AnyObject {
    var presenter: PostListPresenterProtocol? {get set}
    func getPostListData()
}
protocol PostListRouterProtocol: AnyObject {
    static func createModule() -> PostListVC?
    func showCreatePostScreen(from: PostListVC, to navigationController: UINavigationController)
}
