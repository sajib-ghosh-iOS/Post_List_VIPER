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
        let storyboard = UIStoryboard(name: "AddPost", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "AddPostVC") as? AddPostVC else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
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
