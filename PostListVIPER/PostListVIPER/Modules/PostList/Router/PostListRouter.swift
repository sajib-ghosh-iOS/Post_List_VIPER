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

    func showCreatePostScreen(from: PostListVC, to navigationController: UINavigationController) {
        if let addPostVC = AddPostRouter.createModule(dependency:
                                                        AddPostDependency(user: DataManager.sharedInstance.user)) {
            addPostVC.delegate = from
            navigationController.present(addPostVC, animated: true)
        }
    }
}
