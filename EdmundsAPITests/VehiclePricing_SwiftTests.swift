//
//  VehiclePricing_SwiftTests.swift
//  EdmundsAPI
//
//  Created by KusEvi on 1/30/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

import UIKit
import XCTest
import EdmundsAPI

class VehiclePricing_SwiftTests: XCTestCase {
    
    let manager = EdmundsAPIManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: PRICING: TRUE COST TO OWN (TCO)
    func testCalculateForNewVehicles() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicles(styleId: "200477465", zip: "90019") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForUsedVehicles() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForUsedVehicles(styleId: "101172637", zip: "90019") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateTotalCashPriceForNewVehicle() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateTotalCashPriceForNewVehicle(styleId: "200477465", zip: "90404") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateTotalCashPriceForUsedVehicle() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateTotalCashPriceForUsedVehicle(styleId: "101172637", zip: "90069") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetVehicleMakesWithTCOData() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehicleMakesWithTCOData { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetVehicleModelsWithTCOData() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehicleModelsWithTCOData(makeId: "200005143") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetVehicleStylesWithTCOData() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehicleStylesWithTCOData(make: "honda", model: "accord", year: "2013", submodel: EdmundsAPIManager.CATEGORY.kSEDAN) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetTCODetailsForANewCar() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getTCODetailsForANewCar(styleId: "200477465", zip: "90019", state: "CA") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetTCODetailsForAUsedCar() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getTCODetailsForAUsedCar(styleId: "101172637", zip: "90019", state: "CA") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    
    func testCalculateForNewVehicleWithCarMakeYearMSRPAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(makeNiceName: "honda", year: "2013", msrp: "32000", zip: "90404", color: nil, model: nil, vehicleStyle: nil, drivenWheels: nil, fuelType: nil, cylinders: nil, compressorType: nil, trim: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    // Color, model, vehicleStyle, drivenWheels, fuelType, cylinders, compressorType, and trim can be nil or given a value. Mix and match to test.
    func testCalculateForNewVehicleWithCarMakeYearMSRPAndZipcode_Etc() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(makeNiceName: "honda", year: "2013", msrp: "32000", zip: "90404", color: "black", model: "accord", vehicleStyle: EdmundsAPIManager.CATEGORY.kSEDAN, drivenWheels: EdmundsAPIManager.CATEGORYDRIVENWHEELS.kFRONTWHEELDRIVE, fuelType: EdmundsAPIManager.CATEGORYFUELTYPE.kGAS, cylinders: "4", compressorType: nil, trim: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
}