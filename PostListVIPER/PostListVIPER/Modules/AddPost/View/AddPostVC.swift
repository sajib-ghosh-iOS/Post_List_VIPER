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
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!

    var presenter: AddPostPresenterProtocol?
    var isValid: Bool = false
    var dependency: AddPostDependency?
    weak var delegate: AddPostCompletionProtocol?
    var imageURL: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - SetupUI
    func setupUI() {
        txtDescription.text = AddPostConstants.addPostDescriptionPlaceHolder
        txtDescription.textColor = UIColor.lightGray
        txtDescription.delegate = self
        txtDescription.layer.cornerRadius = 4.0
        txtDescription.layer.borderWidth = 1.0
        txtDescription.layer.borderColor = UIColor.lightGray.cgColor
        btnSubmit.setTitleColor(.gray, for: .normal)
        lblError.isHidden = true
    }
    // MARK: - IBActions
    @IBAction func didTapOnBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func didTapOnSubmitButton(_ sender: UIButton) {
        validateForm()
        if isValid {
            let name = dependency?.user.name ?? ""
            let userName = dependency?.user.userName ?? ""
            let description = txtDescription.text ?? ""
            let post = AddPostModel(name: name, userName: userName, description: description, imageURL: imageURL)
            presenter?.addPost(post: post)
            dismiss(animated: true)
        }
    }
    @IBAction func didTapOnImageButton(_ sender: UIButton) {
        openActionSheet()
    }
    // MARK: - Form Validation
    func validateForm() {
        if txtDescription.text == AddPostConstants.addPostDescriptionPlaceHolder {
            lblError.isHidden = false
        }
        if txtDescription.text.isEmpty {
            lblError.isHidden = false
        }
        isValid = lblError.isHidden
    }
    // MARK: - Image picker options
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

extension AddPostVC: AddPostViewProtocol {

    func onAddPostResponseSuccess(post: PostModel) {
        delegate?.onAddPostSuccess(post: post)
    }

    func onAddPostResponseFailure(error: String) {
        delegate?.onAddPostFailure(error: error)
    }
}
