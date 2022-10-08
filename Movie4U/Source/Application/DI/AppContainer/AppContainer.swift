//
//  AppCoordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Foundation
import Swinject

// App Container contains all app level dependencies
class AppContainer {
    // MARK: Root Container
    
    let rootContainer: Container
    
    // MARK: Child containers
    
    let authContainer: AuthContainer
    let mainTabContainer: MainTabContainer
    
    // MARK: Initializer
    
    init() {
        rootContainer = Container()
        authContainer = AuthContainer(parentContainer: rootContainer)
        mainTabContainer = MainTabContainer(parentContainer: rootContainer)
        registerDependencies()
    }
    
    func registerDependencies() {
        rootContainer.register(UINavigationController.self) { _ in
            UINavigationController()
        }.inObjectScope(.globalScope)
        
        rootContainer.register(ConfigProvider.self) { _ in
            ConfigProvider()
        }.inObjectScope(.globalScope)
        
        rootContainer.register(AppViewModel.self) { _ in
            AppViewModel()
        }.inObjectScope(.globalScope)
        
        rootContainer.register(AppCoordinator.self) { res in
            return AppCoordinator(navigationController: res.resolve(UINavigationController.self)!,
                                  appViewModel: res.resolve(AppViewModel.self)!,
                                  loginCoordinator:
                                    self.authContainer.container.resolve(LoginCoordinator.self)!,
                                  mainTabCoordinator: self.mainTabContainer.container.resolve(MainTabBarCoordinator.self)!,
                                  loginTearDown: getLoginTearDown(),
                                  mainTabTearDown: getMainTabTearDown())
        }.inObjectScope(.globalScope)
        
        rootContainer.register(APIClient.self) { res in
            APIClient()
        }.inObjectScope(.globalScope)
    }
}

protocol ChildContainer {
    var container: Container { get }
    init(parentContainer: Container)
}
