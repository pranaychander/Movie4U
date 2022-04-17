//
//  FavouritesTabCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import UIKit

protocol FavouritesTabCoordinatorDelegate: AnyObject {
    func goTo(selectedTab: AppTabs)
    func finishFavouritesFlow()
}

class FavouritesTabCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController!
    
    weak var parentingCoordinator: FavouritesTabCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        runFlow()
    }
    
    func runFlow() {
        let favouritesViewController = FavouritesViewController()
        navigationController.show(favouritesViewController, sender: nil)
    }
}
