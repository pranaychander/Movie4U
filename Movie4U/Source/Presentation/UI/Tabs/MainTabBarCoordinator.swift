//
//  MainTabBarCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 14/03/22.
//

import Foundation
import UIKit

// MARK: Delegate for MainTabBarCoordinatorDelegate

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func finishMainTabsFlow()
    func runLogoutFlow()
}

class MainTabBarCoordinator: NavigationCoordinator {
    // MARK: Navigation properties
    
    weak var parentingCoordinator: MainTabBarCoordinatorDelegate?
    let tabBarController: CustomTabBarController
    let mainTabViewModel: MainTabViewModel
    
    let navigationController: UINavigationController!
    let homeNavigationController: UINavigationController
    let favouritesNavigationController: UINavigationController
    let settingsNavigationController: UINavigationController
    
    let homeTabCoordinator: HomeTabCoordinator?
    let favouritesTabCoordinator: FavouritesTabCoordinator?
    let settingsTabCoordinator: SettingsTabCoordinator?
    
    // MARK: Initializer
    
    init(mainTabViewModel: MainTabViewModel,
         navigationController: UINavigationController,
         tabBarController: CustomTabBarController,
         homeNavigationController: UINavigationController,
         favouritesNavigationController: UINavigationController,
         settingsNavigationController: UINavigationController,
         homeTabCoordinator: HomeTabCoordinator,
         favouritesTabCoordinator: FavouritesTabCoordinator,
         settingsTabCoordinator: SettingsTabCoordinator) {
        self.mainTabViewModel = mainTabViewModel
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.homeNavigationController = homeNavigationController
        self.favouritesNavigationController = favouritesNavigationController
        self.settingsNavigationController = settingsNavigationController
        self.homeTabCoordinator = homeTabCoordinator
        self.favouritesTabCoordinator = favouritesTabCoordinator
        self.settingsTabCoordinator = settingsTabCoordinator
        AppLogger.memoryInitLog()
    }
    
    func start() {
        runFlow()
    }
    
    // MARK: Navigation Methods
    
    func runFlow() {
        configureTabBarView()
        showMainTabBarController()
    }
    
    // MARK: UI Helpers
    
    func configureTabBarView() {
        tabBarController.tabBar.isTranslucent = false
        navigationController.navigationBar.isHidden = true
        tabBarController.tabBar.tintColor = .black
        
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .white
            tabBarController.tabBar.standardAppearance = tabBarAppearance
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBarController.tabBar.barTintColor = .white
        }
        
        homeNavigationController.tabBarItem.title = "Home"
//        homeNavigationController.tabBarItem.image = UIImage(named: "home_unselected")
//        homeNavigationController.tabBarItem.selectedImage = UIImage(named: "home_selected")
//
        favouritesNavigationController.tabBarItem.title = "Favourites"
//        favouritesNavigationController.tabBarItem.image = UIImage(named: "favourites_unselected")
//        favouritesNavigationController.tabBarItem.selectedImage = UIImage(named: "favourites_selected")
        
        settingsNavigationController.tabBarItem.title = "Settings"
//        settingsNavigationController.tabBarItem.image = UIImage(named: "home_unselected")
//        settingsNavigationController.tabBarItem.selectedImage = UIImage(named: "home_selected")
    }
    
    func showMainTabBarController() {
        homeTabCoordinator?.parentingCoordinator = self
        homeTabCoordinator?.start()
        
        favouritesTabCoordinator?.parentingCoordinator = self
        favouritesTabCoordinator?.start()
        
        settingsTabCoordinator?.parentingCoordinator = self
        settingsTabCoordinator?.start()
        
        tabBarController.viewControllers = [
            homeNavigationController,
            favouritesNavigationController,
            settingsNavigationController
        ]
        navigationController.pushViewController(tabBarController, animated: true)
        tabBarController.goTo(selectedTab: .Home)
    }
}

extension MainTabBarCoordinator: HomeTabCoordinatorDelegate,
                                 FavouritesTabCoordinatorDelegate,
                                 SettingsTabCoordinatorDelegate {
    func goTo(selectedTab: AppTabs) {
        tabBarController.goTo(selectedTab: selectedTab)
    }
    
    func finishHomeFlow() {
        
    }
    
    func finishSettingsFlow() {
        
    }
    
    func finishFavouritesFlow() {
        
    }
}

func getMainTabTearDown() -> MainTabTearDown {
    return {
        DependencyManager.getContainer(.main).resetObjectScope(.flowScope)
    }
}

typealias MainTabTearDown = () -> Void
