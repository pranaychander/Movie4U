//
//  SettingsTabContainer.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Swinject

class SettingsTabContainer: ChildContainer {
    var container: Container
    
    required init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        registerDependencies()
    }

    func registerDependencies() {
        container.register(SettingsTabCoordinator.self) { res in
            return SettingsTabCoordinator(navigationController: res.resolve(UINavigationController.self, name: "settingsTabNav")!)
        }.inObjectScope(.authorizedCoordinatorScope)
        
        container.register(UINavigationController.self, name: "settingsTabNav") { res in
            UINavigationController()
        }.inObjectScope(.globalScope)
        
        container.register(SettingsViewModel.self) { res in
            return SettingsViewModel()
        }.inObjectScope(.flowScope)
        
        container.register(SettingsViewController.self) { res in
            return SettingsViewController()
        }.inObjectScope(.flowScope)
    }
}
