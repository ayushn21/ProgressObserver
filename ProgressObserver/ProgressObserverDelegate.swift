//
//  ProgressObserverDelegate.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

public protocol ProgressObserverDelegate {
    func fractionCompletedUpdated(forObserver observer: ProgressObserver,
                                              newValue: Double,
                                              userInfo:[NSObject : AnyObject])
    
    func completedUnitCountUpdated(forObserver observer: ProgressObserver,
                                              newValue: Double,
                                              userInfo:[NSObject : AnyObject])
}

public extension ProgressObserverDelegate {
    func fractionCompletedUpdated(forObserver observer: ProgressObserver,
                                              newValue: Double,
                                              userInfo:[NSObject : AnyObject]) {}
    
    func completedUnitCountUpdated(forObserver observer: ProgressObserver,
                                               newValue: Double,
                                               userInfo:[NSObject : AnyObject]) {}
}