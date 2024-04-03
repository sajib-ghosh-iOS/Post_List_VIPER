//
//  AddPostVC.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 03/04/24.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var txtDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDescription.text = AddPostConstants.addPostDescriptionPlaceHolder
        txtDescription.textColor = UIColor.lightGray
        txtDescription.delegate = self
    }
    // MARK: - IBActions
    @IBAction func didTapOnBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapOnSubmitButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapOnImageButton(_ sender: UIButton) {
        openActionSheet()
    }
    func openActionSheet() {
        // create the alert action sheet
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: AddPostConstants.ImagePickerActionSheetConstant.takePhoto,
                                      style: UIAlertAction.Style.default, handler: { _ in
            self.openCameraFor()
        }))
        alert.addAction(UIAlertAction(title: AddPostConstants.ImagePickerActionSheetConstant.choseFromLibrary,
                                      style: UIAlertAction.Style.default, handler: { _ in
            self.openPhotoLibraryFor()
        }))
        alert.addAction(UIAlertAction(title: AddPostConstants.ImagePickerActionSheetConstant.cancel,
                                      style: UIAlertAction.Style.cancel, handler: { _ in
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    func openCameraFor() {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.allowsEditing = false
        controller.delegate = self
        present(controller, animated: true)
    }
    func openPhotoLibraryFor() {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.allowsEditing = false
        controller.delegate = self
        present(controller, animated: true)
    }
}
