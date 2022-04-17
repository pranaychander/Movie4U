//
//  AppViewModel.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Foundation

// Enum denoting the available child coordinators of the app.
enum AppChildCoordinator {
    case auth
    case main
}

// Global view model for the application
class AppViewModel {
    var isUserLoggedIn: Bool = false
    
    init() {
        AppLogger.memoryInitLog()
    }
    
    deinit {
        AppLogger.memoryDeinitLog()
    }
    
    // MARK: Methods
    
    /// Determines which flow the app should undergo
    func getFlow() -> AppChildCoordinator {
        let isAuthorized: Bool = isUserLoggedIn
        switch isAuthorized {
        case false:
            return .auth
        case true:
            return .main
        }
    }
}
