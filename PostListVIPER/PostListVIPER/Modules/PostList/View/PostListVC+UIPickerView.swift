//
//  PostListVC+UIPickerView.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation
import UIKit

extension PostListVC: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userNameArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userNameArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtUser.text = userNameArray[row]
        selectedUser = userNameArray[row]
        filteredPosts = presenter?.getPostOf(userName: selectedUser, posts: posts) ?? []
        if selectedUser != "All" {
            DataManager.sharedInstance.user = users.filter {$0.userName == selectedUser}.first!
        }
        reloadTableView()
    }
}
