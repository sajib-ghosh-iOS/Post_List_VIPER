//
//  AddPostRouter.swift
//  AddPostVIPER
//
//  Created by Sajib Ghosh on 05/04/24.
//

import Foundation
import UIKit
class AddPostRouter: AddPostRouterProtocol {

    static func createModule(dependency: AddPostDependency) -> AddPostVC? {
        let storyboard = UIStoryboard(name: StoryboardNames.addPost, bundle: nil)
        guard let view = storyboard.instantiateViewController(
            withIdentifier: StoryboardIdentifiers.addPost) as? AddPostVC else {
            return nil
        }
        let presenter: AddPostPresenterProtocol = AddPostPresenter()
        let interactor: AddPostInteractorProtocol = AddPostInteractor()
        let router: AddPostRouterProtocol = AddPostRouter()

        view.dependency = dependency
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
