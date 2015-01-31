//
//  VehicleContent_SwiftTests.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/31/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

import UIKit
import XCTest
import EdmundsAPI

class VehicleContent_SwiftTests: XCTestCase {
    
    let manager = EdmundsAPIManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: CONTENT: EDMUNDS CAR RATINGS
    func testGetCarRatingsByMakeModelYear() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarRatingsByMakeModelYear(makeNiceName: "honda", modelNiceName: "accord", year: "2013", submodel: EdmundsAPIManager.CATEGORY.kSEDAN) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarRatingsByVehicleStyleId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarRatingsByVehicleStyleId(styleid: "200434856") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetConsumerRatingsAndReviewsByCarMakeModelYear() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getConsumerRatingsAndReviewsByCarMakeModelYear(makeNiceName: "audi", modelNiceName: "a4", year: "2013", sortby: "thumbsUp:ASC", pagenum: "1", pagesize: "10") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetConsumerRatingsAndReviewsByCarStyleId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getConsumerRatingsAndReviewsByCarStyleId(styleid: "200421519", sortby: "created:DESC", pagenum: "1", pagesize: "5") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }

}