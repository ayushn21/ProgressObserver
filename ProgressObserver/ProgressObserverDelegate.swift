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
    func progressObserver(observer: ProgressObserver,
                          didUpdateFractionCompleted fraction: Double,
                          withUserInfo userInfo:[NSObject : AnyObject])
    
    /**
     Called when the `completedUnitCount` parameter is updated. It is called on the main queue.
     
     - parameter observer: The `ProgressObserver` object where the delegate method was triggered from.
     - parameter fraction: The new value of `completedUnitCount`
     - parameter userIngo: The `userInfo` parameter of the `ProgressObserver`
     */
    func progressObserver(observer: ProgressObserver,
                          didUpdateCompletedUnitCount unitCount: Int64,
                          withUserInfo userInfo:[NSObject : AnyObject])
}

public extension ProgressObserverDelegate {
    func progressObserver(observer: ProgressObserver,
                          didUpdateFractionCompleted fraction: Double,
                          withUserInfo userInfo:[NSObject : AnyObject]) {}
    
    func progressObserver(observer: ProgressObserver,
                          didUpdateCompletedUnitCount unitCount: Int64,
                          withUserInfo userInfo:[NSObject : AnyObject]) {}
}