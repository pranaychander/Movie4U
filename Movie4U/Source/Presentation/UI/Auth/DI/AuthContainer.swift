//
//  AuthContainer.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Swinject

class AuthContainer: ChildContainer {
    let container: Container

    required init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        registerDependencies()
    }
    
    func registerDependencies() {
        container.register(LoginCoordinator.self) { res in
            return LoginCoordinator(navigationController: res.resolve(UINavigationController.self)!)
        }.inObjectScope(.unauthorizedCooridnatorScope)
    }
}
