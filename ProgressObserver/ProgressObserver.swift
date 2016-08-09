//
//  ProgressObserver.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

/// A simple `NSProgress` subclass that provides a clean delegate based interface to observing progress values.
public class ProgressObserver: NSProgress {
    
    /**
     The delegate for the progress observer. It should conform to the `ProgressObserverDelegate` protocol
     */
    public var delegate: ProgressObserverDelegate? {
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
    
    public override func observeValueForKeyPath(keyPath: String?,
                                                ofObject object: AnyObject?,
                                                change: [String : AnyObject]?,
                                                context: UnsafeMutablePointer<Void>) {
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

func mainQueue (closure: () -> ()) {
    NSOperationQueue.mainQueue().addOperationWithBlock(closure)
}