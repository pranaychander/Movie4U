//
//  AppCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import UIKit

class AppCoordinator: NavigationCoordinator {
    var navigationController: UINavigationController!
    let appViewModel: AppViewModel
    
    let loginTearDown: LoginTearDown
    let mainTabTearDown: MainTabTearDown
    
    var loginCoordinator: LoginCoordinator?
    var mainTabCoordinator: MainTabBarCoordinator?
    
    init(navigationController: UINavigationController,
         appViewModel: AppViewModel,
         loginCoordinator: LoginCoordinator,
         mainTabCoordinator: MainTabBarCoordinator,
         loginTearDown: @escaping LoginTearDown,
         mainTabTearDown: @escaping MainTabTearDown
) {
        self.navigationController = navigationController
        self.loginCoordinator = loginCoordinator
        self.mainTabCoordinator = mainTabCoordinator
        self.appViewModel = appViewModel
        self.loginTearDown = loginTearDown
        self.mainTabTearDown = mainTabTearDown
        AppLogger.memoryInitLog()
    }
    
    deinit {
        AppLogger.memoryDeinitLog()
    }
    
    func start() {
        switch appViewModel.getFlow() {
        case .auth: runAuthFlow()
        case .main: runMainFlow()
        }
    }
    
    private func runAuthFlow() {
        loginCoordinator?.parentingCoordinator = self
        loginCoordinator?.start()
    }
    
    private func runMainFlow() {
        if let mainTabCoordinator = mainTabCoordinator {
            print("main tab coordinator is not nil")
        } else {
            print("main tab coordinator is nil")
        }
        mainTabCoordinator?.parentingCoordinator = self
        mainTabCoordinator?.start()
    }
    
    func runLogoutFlow() {
        mainTabTearDown()
    }
}

// MARK: AuthCoordinatorDelegate

extension AppCoordinator: LoginCoordinatorDelegate {
    func finishLoginFlow() {
        loginTearDown()
        appViewModel.isUserLoggedIn = true
        navigationController.viewControllers.removeAll()
        start()
    }
}

// MARK: MainTabBarDelegate

extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func finishMainTabsFlow() {
        mainTabTearDown()
        appViewModel.isUserLoggedIn = false
        navigationController.viewControllers.removeAll()
        start()
    }
}
