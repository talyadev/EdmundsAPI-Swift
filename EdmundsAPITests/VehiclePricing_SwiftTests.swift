//
//  VehiclePricing_SwiftTests.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/30/15.
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
    
    func testCalculateForNewVehicleWithCarMakeYearMSRPAndZipcode_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(makeNiceName: "honda", year: "2013", msrp: "32000", zip: "90404", color: "black", model: "accord", vehicleStyle: EdmundsAPIManager.CATEGORY.kSEDAN, drivenWheels: EdmundsAPIManager.CATEGORYDRIVENWHEELS.kFRONTWHEELDRIVE, fuelType: EdmundsAPIManager.CATEGORYFUELTYPE.kGAS, cylinders: "4", compressorType: nil, trim: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForNewVehicleWithCarVINMSRPAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarVINMSRPAndZipcode(vin: "WAUCFAFH2DN018228", zip: "90404", msrp: "47000", color: EdmundsAPIManager.CATEGORYCOLOR.kWHITE) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForNewVehicleWithCarStyleIdAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarStyleIdAndZipcode(styleId: "200477465", zip: "90019", colorId: nil, optionId: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForNewVehicleWithCarStyleIdConditionMileageAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForNewVehicleWithCarStyleIdConditionMileageAndZipcode(styleId: "101172637", condition: EdmundsAPIManager.CONDITION.kOUTSTANDING, mileage: "10000", zip: "90404", colorId: nil, optionId: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForTheTypicallyEquippedVehicle() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForTheTypicallyEquippedVehicle(styleId: "101172637", zip: "90404") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testCalculateForTheCertifiedVehicle() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.calculateForTheCertifiedVehicle(styleId: "101172637", zip: "90019") { (str: String?, error: NSError?) -> Void in
            XCTAssertNotNil(str, "string is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByID(id: "3083078") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleMakeID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleMakeID(makeid: "200000001") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleStyleID(styleid: "200477465") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleCategoryAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleCategoryAndZipcode(category: EdmundsAPIManager.CATEGORY.k2DRSUV, zip: "90404") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleMakeIdAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleMakeIdAndZipcode(makeid: "200000001", zip: "90019") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleModelYearIdAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleModelYearIdAndZipcode(modelyearid: "100537293", zip: "90019") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetByVehicleStyleIdAndZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getByVehicleStyleIdAndZipcode(styleid: "200477465", zip: "90404") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
}