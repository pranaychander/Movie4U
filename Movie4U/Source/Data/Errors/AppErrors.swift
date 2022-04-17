//
//  AppErrors.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Foundation

enum AppErrors: Error {
    case invalidData
    case authenticationError
    case clientError
    case serviceDown
    case unknownError
}

