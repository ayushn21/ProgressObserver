//
//  ProgressObserverDelegate.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

public protocol ProgressObserverDelegate {
    func progressObserver(observer: ProgressObserver,
                          didUpdateFractionCompleted fraction: Double,
                          withUserInfo userInfo:[NSObject : AnyObject])
    
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