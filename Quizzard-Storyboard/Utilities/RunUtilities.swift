//
//  RunUtilities.swift
//  Quizzard-Storyboard
//

import Foundation

class RunUtilities {
    
    class var isDebug: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }
    
    class func runOnMain(_ block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }
    
    class func runAfterDelay(_ delay: Double, queue: DispatchQueue = .main, action: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + delay, execute: action)
    }
    
}
