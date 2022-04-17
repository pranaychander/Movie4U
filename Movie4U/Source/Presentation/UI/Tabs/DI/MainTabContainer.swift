//
//  MainTabContainer.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Swinject

class MainTabContainer: ChildContainer {
    var container: Container
    
    // MARK: Child containers
    
    let homeTabContainer: HomeTabContainer
    let favouritesTabContainer: FavouritesTabContainer
    let settingsTabContainer: SettingsTabContainer
    
    required init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        
        homeTabContainer = HomeTabContainer(parentContainer: container)
        favouritesTabContainer = FavouritesTabContainer(parentContainer: container)
        settingsTabContainer = SettingsTabContainer(parentContainer: container)
        
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(MainTabViewModel.self) { res in
            MainTabViewModel()
        }.inObjectScope(.authorizedScope)
        
        container.register(CustomTabBarController.self) { _ in
            CustomTabBarController()
        }.inObjectScope(.authorizedScope)
        
        container.register(MainTabBarCoordinator.self) { res in
            return MainTabBarCoordinator(mainTabViewModel: res.resolve(MainTabViewModel.self)!,
                                         navigationController: res.resolve(UINavigationController.self)!,
                                         tabBarController: res.resolve(CustomTabBarController.self)!,
                                         homeNavigationController: self.homeTabContainer.container.resolve(UINavigationController.self, name: "homeTabNav")!,
                                         favouritesNavigationController: self.favouritesTabContainer.container.resolve(UINavigationController.self, name: "favTabNav")!,
                                         settingsNavigationController: self.settingsTabContainer.container.resolve(UINavigationController.self, name: "settingsTabNav")!,
                                         homeTabCoordinator: self.homeTabContainer.container.resolve(HomeTabCoordinator.self)!,
                                         favouritesTabCoordinator: self.favouritesTabContainer.container.resolve(FavouritesTabCoordinator.self)!,
                                         settingsTabCoordinator: self.settingsTabContainer.container.resolve(SettingsTabCoordinator.self)!)
        }
    }
}
