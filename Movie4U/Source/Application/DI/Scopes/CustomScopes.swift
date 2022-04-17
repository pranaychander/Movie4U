//
//  CustomScopes.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Swinject

// Object scope extension to define custom scopes.
extension ObjectScope {
    /// Global scope is applicable for globally shared objects. They are not deinitialized throughout the app
    static let globalScope = ObjectScope.container
    
    /// Authorized scope is applicable for objects that require authorization. They are deinitialized once we return to unauthorized scope.
    static let authorizedScope = ObjectScope(storageFactory: PermanentStorage.init,
                                             description: "authorizedScope")
    
    /// Authorized coordinator scope is applicable for coordinator objects that require authorization. These coordinators are deinitialized once we return to unathorized scope
    static let authorizedCoordinatorScope = ObjectScope(storageFactory: PermanentStorage.init, description: "authorizedCoordinatorScope")
    
    /// Flowscope is applicable for objects belonging to a feature flow. They are deinitialized once we exit that flow.
    static let flowScope = ObjectScope.graph
    
    /// Unauthorized scope is applicable for objects that are used before authorization only. They are deinitialized once we exit the authorization scope. 
    static let unauthorizedCooridnatorScope = ObjectScope(storageFactory: PermanentStorage.init, description: "unauthorizedCoordinatorScope")
}
