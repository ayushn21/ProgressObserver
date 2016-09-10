//
//  ProgressObserverDelegate.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

/// Protocol for Progress Observer delegation routed from KVO. Both methods in this protocol are options as an extension provides a default blank implementation.
public protocol ProgressObserverDelegate {
    /**
     Called when the `fractionCompleted` parameter is updated. It is called on the main queue.
     
     - parameter observer: The `ProgressObserver` object where the delegate method was triggered from.
     - parameter fraction: The new value of `fractionCompleted`
     - parameter userIngo: The `userInfo` parameter of the `ProgressObserver`
     */
    func progressObserver(_ observer: ProgressObserver,
                          didUpdateFractionCompleted fraction: Double,
                          withUserInfo userInfo:[AnyHashable: Any])
    
    /**
     Called when the `completedUnitCount` parameter is updated. It is called on the main queue.
     
     - parameter observer: The `ProgressObserver` object where the delegate method was triggered from.
     - parameter fraction: The new value of `completedUnitCount`
     - parameter userIngo: The `userInfo` parameter of the `ProgressObserver`
     */
    func progressObserver(_ observer: ProgressObserver,
                          didUpdateCompletedUnitCount unitCount: Int64,
                          withUserInfo userInfo:[AnyHashable: Any])
}

public extension ProgressObserverDelegate {
    func progressObserver(_ observer: ProgressObserver,
                          didUpdateFractionCompleted fraction: Double,
                          withUserInfo userInfo:[AnyHashable: Any]) {}
    
    func progressObserver(_ observer: ProgressObserver,
                          didUpdateCompletedUnitCount unitCount: Int64,
                          withUserInfo userInfo:[AnyHashable: Any]) {}
}
