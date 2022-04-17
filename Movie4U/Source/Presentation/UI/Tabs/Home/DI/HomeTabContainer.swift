//
//  HomeTabContainer.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Swinject

class HomeTabContainer: ChildContainer {
    var container: Container
    
    required init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        registerDependencies()
    }
    
    func registerDependencies() {
        container.register(HomeTabCoordinator.self) { res in
            return HomeTabCoordinator(navigationController: res.resolve(UINavigationController.self, name: "homeTabNav")!)
        }.inObjectScope(.authorizedCoordinatorScope)
        
        container.register(UINavigationController.self, name: "homeTabNav") { res in
            UINavigationController()
        }.inObjectScope(.globalScope)
        
        container.register(HomeViewModel.self) { res in
            return HomeViewModel()
        }.inObjectScope(.flowScope)
        
        container.register(HomeViewController.self) { res in
            HomeViewController()
        }.inObjectScope(.flowScope)
    }
}
