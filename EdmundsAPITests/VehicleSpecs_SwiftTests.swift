//
//  VehicleSpecs_SwiftTests.swift
//  EdmundsAPITests
//
//  Created by Talia DeVault on 1/28/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import UIKit
import XCTest
import EdmundsAPI

class VehicleSpecs_SwiftTests: XCTestCase {
    
    let manager = EdmundsAPIManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetAllCarMakes() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getAllCarMakes(state: EdmundsAPIManager.STATE.kNEW, year: "2014", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, err: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarMakeDetailsByMakeNicename() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarMakeDetailsByMakeNicename(makeNiceName: "Audi", state: EdmundsAPIManager.STATE.kNEW, year: "2014", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, err: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarMakesCount() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarMakesCount(state: EdmundsAPIManager.STATE.kNEW, year: "2014", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, err: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarModelDetailsByCarMakeAndModelNicenames() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelDetailsByCarMakeAndModelNicenames(makeNiceName: "honda", modelNiceName: "accord", state: EdmundsAPIManager.STATE.kNEW, year: "2014", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetAllCarModelsByACarMakeNicename() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getAllCarModelsByACarMakeNicename(makeNiceName: "bmw", state: EdmundsAPIManager.STATE.kNEW, year: "2013", category: EdmundsAPIManager.CATEGORY.kSEDAN, view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarModelsCount() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelsCount(makeNiceName: "honda", state: EdmundsAPIManager.STATE.kUSED, year: "2011", category: EdmundsAPIManager.CATEGORY.kCOUPE, view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarModelYearByCarMakeAndModelNicenames() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearByCarMakeAndModelNicenames(makeNiceName: "honda", modelNiceName: "accord", state: EdmundsAPIManager.STATE.kNEW, category: EdmundsAPIManager.CATEGORY.kCOUPE, view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarModelYearByCarMakeAndModelNicenamesAndTheCarYear() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(makeNiceName: "honda", modelNiceName: "civic", year: "2013", category: EdmundsAPIManager.CATEGORY.kSEDAN, view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetCarModelYearsCountByVehicleMakeAndModelNicenames() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearsCountByVehicleMakeAndModelNicenames(makeNiceName: "audi", modelNiceName: "a6", state: EdmundsAPIManager.STATE.kNEW, view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
}