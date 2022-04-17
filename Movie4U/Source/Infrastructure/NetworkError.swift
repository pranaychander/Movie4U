//
//  NetworkError.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Foundation

public enum NetworkError: Error {
    case parametersNil
    case parameterEncodingFailed
    case malformedURL
    case authenticationError
    case badRequest
    case failed
    case noResponseData
    case unableToDecodeResponseData(errorDescription: String)
    case other(message: String?)
    
    var localizedDescription: String{
        var message: String = ""
        
        switch self{
        case .parametersNil:
            message = "Empty parameteres"
        case .parameterEncodingFailed:
            message = "Failed to encode request parameters"
        case .malformedURL:
            message = "Malformed URL"
        case .authenticationError:
            message = "Authenticatioon failed"
        case .badRequest:
            message = "Bad request"
        case .failed:
            message = "API request failed"
        case .noResponseData:
            message = "Empty response data"
        case .unableToDecodeResponseData:
            message = "Unable to decode response object"
        case let .other(errorMessage):
            message = errorMessage ?? ""
        }
        return message
    }
    
    func getFormattedError(message: String) -> String{
        let trimmedMessage: String = "Error: \(message.trimmingCharacters(in: .whitespacesAndNewlines))"
        return trimmedMessage
    }
}

extension NetworkError {
    func toAppError() -> AppErrors {
        switch self {
        case .parametersNil, .parameterEncodingFailed, .malformedURL, .badRequest, .failed:
            return .clientError
        case .authenticationError:
            return .authenticationError
        case .noResponseData:
            return .serviceDown
        case .unableToDecodeResponseData(let errorDescription):
            return .invalidData
        case .other(let message):
            return .unknownError
        }
    }
}
