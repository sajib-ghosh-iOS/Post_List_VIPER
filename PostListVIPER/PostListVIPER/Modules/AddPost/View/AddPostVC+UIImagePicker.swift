//
//  AddPostVC+UIImagePicker.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 03/04/24.
//

import Foundation
import UIKit

// MARK: - ImagePicker delegate
extension AddPostVC: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        imgPost.image = image
    }
}

extension AddPostVC: UINavigationControllerDelegate {
}
