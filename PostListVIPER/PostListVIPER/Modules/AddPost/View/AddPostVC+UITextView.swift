//
//  AddPostVC+UITextView.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation
import UIKit
extension AddPostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        lblError.isHidden = true
        if textView.text.isEmpty {
            btnSubmit.setTitleColor(.gray, for: .normal)
        } else {
            btnSubmit.setTitleColor(.systemBlue, for: .normal)
        }
        isValid = lblError.isHidden
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = AddPostConstants.addPostDescriptionPlaceHolder
            textView.textColor = UIColor.lightGray
            btnSubmit.setTitleColor(.gray, for: .normal)
        }
    }
}
