//
//  ProgressObserver.swift
//  ProgressObserver
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

public class ProgressObserver: NSProgress {
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
            self.delegate?.fractionCompletedUpdated(forObserver: self,
                                                    newValue: self.fractionCompleted, userInfo: self.userInfo)
            break
        case "completedUnitCount":
            self.delegate?.fractionCompletedUpdated(forObserver: self,
                                                    newValue: self.fractionCompleted, userInfo: self.userInfo)
            break
        default:
            break
        }
    }
    
    deinit {
        stopObservingProgress()
    }
}