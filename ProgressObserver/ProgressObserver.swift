//
//  ProgressObserver.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

/// A simple `NSProgress` subclass that provides a clean delegate based interface to observing progress values.
open class ProgressObserver: Progress {
    
    /**
     The delegate for the progress observer. It should conform to the `ProgressObserverDelegate` protocol
     */
    open var delegate: ProgressObserverDelegate? {
        didSet {
            if delegate == nil {
                stopObservingProgress()
            }
            else {
                startObservingProgress()
            }
        }
    }
    var isObserving = false
    
    /**
     Please refer to the `NSProgress` docs for this initialiser
     */
    convenience init(totalUnitCount unitCount: Int64) {
        self.init(parent: nil, userInfo: nil)
        totalUnitCount = unitCount
    }
    
    /**
     Please refer to the `NSProgress` docs for this initialiser
     */
    convenience init(totalUnitCount unitCount: Int64,
                        parent: Progress,
                        pendingUnitCount portionOfParentTotalUnitCount: Int64) {
        self.init(parent: nil, userInfo: nil)
        parent.addChild(self, withPendingUnitCount: portionOfParentTotalUnitCount)
        totalUnitCount = unitCount
    }
        
    func startObservingProgress() {
        guard isObserving == false else {
            return
        }
        
        self.addObserver(self,
                         forKeyPath: "fractionCompleted",
                         options: [],
                         context: nil)
        self.addObserver(self,
                         forKeyPath: "completedUnitCount",
                         options: [],
                         context: nil)
        isObserving = true
    }
    
    func stopObservingProgress() {
        guard isObserving == true else {
            return
        }
        
        self.removeObserver(self, forKeyPath: "fractionCompleted")
        self.removeObserver(self, forKeyPath: "completedUnitCount")
        isObserving = false
    }
    
    open override func observeValue(forKeyPath keyPath: String?,
                                                of object: Any?,
                                                change: [NSKeyValueChangeKey : Any]?,
                                                context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else {
            return
        }
        
        switch keyPath {
        case "fractionCompleted":
            mainQueue {
                self.delegate?.progressObserver(self,
                    didUpdateFractionCompleted: self.fractionCompleted,
                    withUserInfo: self.userInfo)
            }
            break
        case "completedUnitCount":
            mainQueue {
                self.delegate?.progressObserver(self,
                    didUpdateCompletedUnitCount: self.completedUnitCount,
                    withUserInfo: self.userInfo)
            }
            break
        default:
            break
        }
    }
    
    deinit {
        stopObservingProgress()
    }
}

func mainQueue (_ closure: @escaping () -> ()) {
    OperationQueue.main.addOperation(closure)
}
