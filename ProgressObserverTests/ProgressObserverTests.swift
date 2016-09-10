//
//  ProgressObserverTests.swift
//  ProgressObserverTests
//
//  Created by Ayush Newatia on 09/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import XCTest
@testable import ProgressObserver

class ProgressObserverTests: XCTestCase {
    
    var progressObserver: ProgressObserver!
    
    override func setUp() {
        super.setUp()
        progressObserver = ProgressObserver(totalUnitCount: 100)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParentChildIniitaliser() {
        let childObserver = ProgressObserver(totalUnitCount: 100, parent: progressObserver, pendingUnitCount: 50)
        
        childObserver.completedUnitCount = 50
        
        XCTAssert(progressObserver.fractionCompleted == 0.25)
    }
    
    func testTotalUnitCountInitialiser() {
        progressObserver.completedUnitCount = 25
        XCTAssert(progressObserver.fractionCompleted == 0.25)
    }
    
    func testSettingDelegate() {
        class MockDelegate: ProgressObserverDelegate {}
        progressObserver.delegate = MockDelegate()
        
        XCTAssert(progressObserver.delegate != nil)
        XCTAssert(progressObserver.isObserving == true)
    }
    
    func testUnsettingDelegate() {
        class MockDelegate: ProgressObserverDelegate {}
        progressObserver.delegate = MockDelegate()
        progressObserver.delegate = nil
        
        XCTAssert(progressObserver.delegate == nil)
        XCTAssert(progressObserver.isObserving == false)
    }
    
    func testSuccessfulDeinit() {
        class MockDelegate: ProgressObserverDelegate {}
        progressObserver.delegate = MockDelegate()
        progressObserver = nil
        
        XCTAssert(progressObserver == nil)
    }
    
    func testFractionCompletedNotification() {
        let expectation = self.expectation(description: "The fractionCompleted notification should be triggered")
        
        class MockDelegate: ProgressObserverDelegate {
            let expectation: XCTestExpectation
            
            init(expectation: XCTestExpectation) {
                self.expectation = expectation
            }
            
            func progressObserver(_ observer: ProgressObserver,
                                          didUpdateFractionCompleted fraction: Double,
                                          withUserInfo userInfo: [AnyHashable: Any]) {
                if fraction == 0.25 { expectation.fulfill() }
            }
        }
        
        progressObserver.delegate = MockDelegate(expectation: expectation)
        progressObserver.completedUnitCount = 25
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "The fractionCompleted notification was not triggered")
        }
    }
    
    func testCompletedUnitNotification() {
        let expectation = self.expectation(description: "The completedUnitCount notification should be triggered")
        
        class MockDelegate: ProgressObserverDelegate {
            let expectation: XCTestExpectation
            
            init(expectation: XCTestExpectation) {
                self.expectation = expectation
            }
            
            func progressObserver(_ observer: ProgressObserver,
                                  didUpdateCompletedUnitCount unitCount: Int64,
                                  withUserInfo userInfo: [AnyHashable: Any]) {
                if unitCount == 25 { expectation.fulfill() }
            }
        }
        
        progressObserver.delegate = MockDelegate(expectation: expectation)
        progressObserver.completedUnitCount = 25
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "The completedUnitCount notification was not triggered")
        }
    }
}
