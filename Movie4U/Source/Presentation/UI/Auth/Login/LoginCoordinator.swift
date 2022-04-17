//
//  LoginCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 14/03/22.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func finishLoginFlow()
}

class LoginCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController!
    
    weak var parentingCoordinator: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.parentingCoordinator = self
        navigationController.show(loginViewController, sender: nil)
    }
    
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func onLogin() {
        parentingCoordinator?.finishLoginFlow()
    }
}

func getLoginTearDown() -> LoginTearDown {
    return {
        DependencyManager.getContainer(.auth).resetObjectScope(.flowScope)
    }
}

typealias LoginTearDown = () -> Void
