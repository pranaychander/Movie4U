//
//  SettingsTabCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import UIKit

protocol SettingsTabCoordinatorDelegate: AnyObject {
    func goTo(selectedTab: AppTabs)
    func finishSettingsFlow()
}

class SettingsTabCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController!
    
    weak var parentingCoordinator: SettingsTabCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        runFlow()
    }
    
    func runFlow() {
        let settingsViewController = SettingsViewController()
        navigationController.show(settingsViewController, sender: nil)
    }
}
