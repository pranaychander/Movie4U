//
//  HomeTabCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import UIKit

protocol HomeTabCoordinatorDelegate: AnyObject {
    func goTo(selectedTab: AppTabs)
    func finishHomeFlow()
}

class HomeTabCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController!
    
    weak var parentingCoordinator: HomeTabCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        runFlow()
    }
    
    func runFlow() {
        let homeViewController = HomeViewController()
        navigationController.show(homeViewController, sender: nil)
    }
}

