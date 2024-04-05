//
//  PostListVC.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 03/04/24.
//

import UIKit

class PostListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPostStkView: UIStackView!
    @IBOutlet weak var addPostView: UIView!
    var presenter: PostListPresenterProtocol?
    var posts = [PostModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.fetchPostList()
    }

    @IBAction func didTapOnAddPost(_ sender: Any) {
        presenter?.showCreatePostScreen(from: self, to: navigationController!)
    }
}

extension PostListVC: PostListViewProtocol {

    func onPostListResponseSuccess(posts: [PostModel]) {
        self.posts = posts
        tableView.reloadData()
    }

    func onPostListResponseFailure(error: String) {
        // Show Error
        print(error)
    }
}

extension PostListVC: AddPostCompletionProtocol {
    func onAddPostSuccess(post: PostModel) {
        posts.insert(post, at: 0)
        // Update table view with animation
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .top)
    }

    func onAddPostFailure(error: String) {
        // Show Error
        print(error)
    }
}
