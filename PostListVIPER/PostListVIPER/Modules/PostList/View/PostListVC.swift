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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func didTapOnAddPost(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddPost", bundle: nil)
        guard let vc = storyboard.instantiateViewController(
            withIdentifier: "AddPostVC") as? AddPostVC else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}