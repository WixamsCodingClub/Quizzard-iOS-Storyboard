//
//  Logger.swift
//  Quizzard-Storyboard
//

import Foundation

class Logger {
    
    static func log(data: Data) {
        guard let dataString = String(data: data, encoding: .utf8) else {
            Self.log(any: data)
            return
        }
        Self.log(string: "(Data) \(dataString)")
    }
    
    static func log(error: QError) {
        Self.log(string: "(Error) \(error.localizedDescription)")
    }
    
    static func log(any: Any) {
        Self.log(string: "(Any) \(String(describing: any))")
    }
    
    static func log(string: String) {
        if RunUtilities.isDebug {
            print("Logger: \(string)")
        }
    }
    
}
