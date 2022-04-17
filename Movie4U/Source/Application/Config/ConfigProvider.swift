//
//  ConfigProvider.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Foundation

class ConfigProvider {
    public var currentBuild: BuildEnvironment!
    
    public var currentApiTarget: ApiTarget!
    
    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "CURRENT_SCHEME_NAME") as? String ?? ""
        currentBuild = BuildEnvironment(rawValue: currentConfiguration)
        currentApiTarget = currentBuild.supportedApiTargets.first
    }
    
    func toggleActiveApiTarget() -> ApiTarget {
        let nextApiTarget = getNextApiTarget()
        currentApiTarget = nextApiTarget
        return nextApiTarget
    }
    
    func getNextApiTarget() -> ApiTarget {
        let supportedApiTargets = currentBuild.supportedApiTargets
        let nextApiTargetIndex = (supportedApiTargets.firstIndex { $0 == currentApiTarget }! + 1) % supportedApiTargets.count
        return supportedApiTargets[nextApiTargetIndex]
    }
}
