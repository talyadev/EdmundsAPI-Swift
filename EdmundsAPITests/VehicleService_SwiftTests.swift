//
//  VehicleService_SwiftTests.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/31/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

import UIKit
import XCTest
import EdmundsAPI

class VehicleService_SwiftTests: XCTestCase {
    
    let manager = EdmundsAPIManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: SERVICE: VEHICLE MAINTENANCE
    func testGetMaintenanceScheduleById() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getMaintenanceScheduleById(id: "1924943") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetMaintenanceScheduleByModelYearId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getMaintenanceScheduleByModelYearId(modelyearid: "100537293") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetVehicleModelYearsWithMaintenanceSchedules() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehicleModelYearsWithMaintenanceSchedules { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SERVICE: VEHICLE RECALLS
    func testGetRecallById() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getRecallById(id: "359563") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetRecallByVehicleModelYearId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getRecallByVehicleModelYearId(modelyearid: "100537293") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SERVICE: VEHICLE SERVICE BULLETIN
    func testGetServiceBulletinById() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getServiceBulletinById(id: "271056") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetServiceBulletinByVehicleModelYearId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getServiceBulletinByVehicleModelYearId(modelyearid: "100537293") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SERVICE: VEHICLE NOTES
    func testGetNotesByVehicleStyleId() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getNotesByVehicleStyleId(styleid: "3869") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SERVICE: LOCAL LABOR RATES
    func testGetLocalLaborRatesByZipcode() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getLocalLaborRatesByZipcode(zipcode: "90019") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
}