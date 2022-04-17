//
//  PGELogger.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Foundation
import os.log

public enum LogLevel: String {
    case error = "Error"
    case info = "Info"
    case debug = "Debug"
    case verbose = "Verbose"
    case warn = "Warn"
    case assert = "Assert"
    case severe = "Severe"
}

public enum AppLogger {
    private static let logFormat: StaticString = "[%@] %@: Line %d --> %@: %@"
    private static let osLogMap: [LogLevel: OSLogType] = [.error: .error, .info: .info, .debug: .debug, .verbose: .info, .warn: .info, .severe: .fault]
    
    private static var logger: Logger {
        return Logger()
    }
    
    private static var configProvider: ConfigProvider! {
        DependencyManager.getContainer(.app).resolve(ConfigProvider.self)
    }
}

extension AppLogger {
    private static func format(args loggingArgs: [Any]) -> String {
        let formattedArgs: String = loggingArgs.map { value in
            String(describing: value)
        }.joined(separator: ", ")
        return formattedArgs
    }
    
    static func log(level: LogLevel, args logArgs: [Any] = [], file: String = #file, function: String = #function, line: Int = #line) {
        let logMessage: String = "\(level.rawValue) [\(file)] --> \(function) Line: \(line) --> \(self.format(args: logArgs))"
        switch level {
        case .error:
            logger.error("\(logMessage)")
        case .info:
            logger.info("\(logMessage)")
        case .debug:
            logger.debug("\(logMessage)")
        case .verbose:
            logger.log("\(logMessage)")
        case .warn, .assert:
            logger.notice("\(logMessage)")
        case .severe:
            logger.fault("\(logMessage)")
        }
    }
}
