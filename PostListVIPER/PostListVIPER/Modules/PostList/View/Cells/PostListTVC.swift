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
        if let url = URL(string: data.thumbnail) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                if let imageData = data {
                    if let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.imgPost.image = image
                        }
                    }
                }
            }
        } else {
            imgPost.image = UIImage(systemName: "photo.fill")
        }
    }
}
