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
    @IBOutlet weak var txtUser: UITextField!
    var userPickerView = UIPickerView()
    var presenter: PostListPresenterProtocol?
    var posts = [PostModel]()
    var filteredPosts = [PostModel]()
    var users = [UserModel]()
    var userNameArray = [String]()
    var selectedUser: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        userPickerView.delegate = self
        txtUser.inputView = userPickerView
    }

    func fetchData() {
        presenter?.fetchUserList()
        presenter?.fetchPostList()
    }

    @IBAction func didTapOnAddPost(_ sender: Any) {
        presenter?.showCreatePostScreen(from: self, to: navigationController!)
    }

    func reloadTableView() {
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        tableView.endUpdates()
    }
}

extension PostListVC: PostListViewProtocol {

    func onPostListResponseSuccess(posts: [PostModel]) {
        self.posts = posts
        self.filteredPosts = posts
        reloadTableView()
    }

    func onPostListResponseFailure(error: String) {
        // Show Error
        print(error)
    }

    func onUserListResponseSuccess(users: [UserModel]) {
        self.users = users
        self.userNameArray = presenter?.getUserNamesFrom(users: users) ?? []
        txtUser.text = (userNameArray.count > 0) ? userNameArray.first : ""
    }

    func onUserListResponseFailure(error: String) {
        // Show Error
        print(error)
    }
}

extension PostListVC: AddPostCompletionProtocol {
    func onAddPostSuccess(post: PostModel) {
        posts.insert(post, at: 0)
        filteredPosts.insert(post, at: 0)
        // Update table view with animation
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .top)
    }

    func onAddPostFailure(error: String) {
        // Show Error
        print(error)
    }
}
