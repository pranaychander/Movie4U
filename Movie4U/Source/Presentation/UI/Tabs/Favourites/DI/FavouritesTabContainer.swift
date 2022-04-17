//
//  FavouritesTabContainer.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Swinject

class FavouritesTabContainer: ChildContainer {
    var container: Container
    
    required init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        registerDependencies()
    }
    
    func registerDependencies() {
        container.register(FavouritesTabCoordinator.self) { res in
            return FavouritesTabCoordinator(navigationController: res.resolve(UINavigationController.self, name: "favTabNav")!)
        }.inObjectScope(.authorizedCoordinatorScope)
        
        container.register(UINavigationController.self, name: "favTabNav") { res in
            UINavigationController()
        }.inObjectScope(.globalScope)
        
        container.register(FavouritesViewModel.self) { res in
            return FavouritesViewModel()
        }.inObjectScope(.flowScope)
        
        container.register(FavouritesViewController.self) { res in
            return FavouritesViewController()
        }.inObjectScope(.flowScope)
    }
}
