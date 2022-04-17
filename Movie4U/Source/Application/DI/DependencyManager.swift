//
//  DependencyManager.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Swinject

class DependencyManager {
    private static let sharedInstance = DependencyManager()
    
    private let appContainer: AppContainer
    
    private init() {
        appContainer = AppContainer()
    }
    
    class func resolve<T>(_ service: T.Type) -> T! {
        return DependencyManager.getContainer(.app).resolve(service.self)
    }
    
    class func resolve<T>(_ service: T.Type, name: String) -> T! {
        return DependencyManager.getContainer(.app).resolve(service, name: name)
    }
    
    class func resolve<T>(_ service: T.Type, argument: [String: Any]) -> T! {
        return DependencyManager.getContainer(.app).resolve(service, argument: argument)
    }
    
    class func getContainer(_ type: ContainerType) -> Container {
        switch type {
        case .app:
            return sharedInstance.appContainer.rootContainer
        case .auth:
            return sharedInstance.appContainer.authContainer.container
        case .main:
            return sharedInstance.appContainer.mainTabContainer.container
        }
    }
}

enum ContainerType: CaseIterable {
    case app
    case auth
    case main
}
