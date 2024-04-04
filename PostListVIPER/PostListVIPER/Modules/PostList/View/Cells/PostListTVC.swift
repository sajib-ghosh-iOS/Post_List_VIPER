//
//  PostListTVC.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 03/04/24.
//

import UIKit

class PostListTVC: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    func cellFillWith(data: PostModel) {
        lblName.text = data.name
        lblUserName.text = data.userName
        lblDescription.text = data.description
    }
}
