//
//  BuildEnvironement.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import Foundation

struct BuildEnvironment {
    let name: String
    let isLoggable: Bool
    let isApiSwitcherAvailable: Bool
    let showMemoryLogs: Bool
    let supportedApiTargets: [ApiTarget]
}

extension BuildEnvironment: RawRepresentable, CaseIterable, Equatable {
    typealias RawValue = String
    
    public init?(rawValue: RawValue) {
        guard let environment = Self.allCases.first(where: { $0.name == rawValue }) else { return nil }
        self = environment
    }
    
    public var rawValue: RawValue {
        return name
    }
    
    static var allCases: [BuildEnvironment] {
        [.unstable, .review, .prod]
    }
    
    static func == (lhs: BuildEnvironment, rhs: BuildEnvironment) -> Bool {
        return lhs.name == rhs.name
    }
    
    static var unstable: BuildEnvironment {
        BuildEnvironment(name: "Unstable",
                         isLoggable: true,
                         isApiSwitcherAvailable: true,
                         showMemoryLogs: true,
                         supportedApiTargets: [.mock, .dev, .test])
    }
    
    static var review: BuildEnvironment {
        BuildEnvironment(name: "Review",
                         isLoggable: true,
                         isApiSwitcherAvailable: true,
                         showMemoryLogs: false,
                         supportedApiTargets: [.test])
    }
    
    static var prod: BuildEnvironment {
        BuildEnvironment(name: "Prod",
                         isLoggable: false,
                         isApiSwitcherAvailable: false,
                         showMemoryLogs: true,
                         supportedApiTargets: [.prod])
    }
}

struct ApiTarget {
    let name: String
    let tmdbBaseUrl: String
    let tmdbApiKey: String
}

extension ApiTarget: RawRepresentable, CaseIterable {
    typealias RawValue = String
    
    public init?(rawValue: RawValue) {
        guard let config = Self.allCases.first(where: { $0.name == rawValue }) else { return nil }
        self = config
    }
    
    static var allCases: [ApiTarget] {
        return [.mock, .dev, .test, .prod]
    }
    
    public var rawValue: RawValue {
        return name
    }
    
    static var mock: ApiTarget {
        return ApiTarget(name: "Mock",
                         tmdbBaseUrl: "http://localhost:8080",
                         tmdbApiKey: "xyzadbfjhsbq2323ms")
    }
    
    static var dev: ApiTarget {
        return ApiTarget(name: "Dev",
                         tmdbBaseUrl: "http://localhost:8080",
                         tmdbApiKey: "xyzadbfjhsbq2323ms")
    }
    
    static var test: ApiTarget {
        return ApiTarget(name: "Test",
                         tmdbBaseUrl: "http://localhost:8080",
                         tmdbApiKey: "xyzadbfjhsbq2323ms")
    }
    
    static var prod: ApiTarget {
        return ApiTarget(name: "Prod",
                         tmdbBaseUrl: "http://localhost:8080",
                         tmdbApiKey: "xyzadbfjhsbq2323ms")
    }
    
}
