//
//  PostListRouter.swift
//  PostListVIPER
//
//  Created by Sajib Ghosh on 04/04/24.
//

import Foundation
import UIKit

class PostListRouter: PostListRouterProtocol {

    static func createModule() -> PostListVC? {
        let storyboard = UIStoryboard(name: StoryboardNames.postList, bundle: nil)
        guard let view = storyboard.instantiateViewController(
            withIdentifier: StoryboardIdentifiers.postList) as? PostListVC else {
            return nil
        }
        let presenter: PostListPresenterProtocol = PostListPresenter()
        let interactor: PostListInteractorProtocol = PostListInteractor()
        let router: PostListRouterProtocol = PostListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }

    func pushToCreatePostScreen(navigationConroller: UINavigationController) {
//        let addPostVC = AddPostRouter.createAddPostModule()
//        navigationController.pushViewController(addPostVC, animated: true)
    }
}
