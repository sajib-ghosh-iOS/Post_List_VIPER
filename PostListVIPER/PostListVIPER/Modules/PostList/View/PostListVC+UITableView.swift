//
//  PostListVC+UITableView.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 03/04/24.
//

import Foundation
import UIKit

extension PostListVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCellIdentifiers.postListTVC) as? PostListTVC
        else { return UITableViewCell() }
        cell.cellFillWith(data: posts[indexPath.row])
        return cell
    }
}

extension PostListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            addPostView.isHidden = true
            addPostStkView.removeArrangedSubview(addPostView)
        } else {
            addPostView.isHidden = false
            addPostStkView.addArrangedSubview(addPostView)
        }
        if scrollView.contentOffset.y == 0.0 {
            addPostView.isHidden = false
            addPostStkView.addArrangedSubview(addPostView)
        }
    }
}
