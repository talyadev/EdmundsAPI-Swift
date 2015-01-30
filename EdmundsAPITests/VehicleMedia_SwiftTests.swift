//
//  VehicleMedia_SwiftTests.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/30/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

import UIKit
import XCTest
import EdmundsAPI

class VehicleMedia_SwiftTests: XCTestCase {
    
    let manager = EdmundsAPIManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: MEDIA: VEHICLE PHOTO
    func testGetVehiclePhotoByVehicleStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehiclePhotoByVehicleStyleID(styleId: "200477465") { (array: NSArray?, error: NSError?) -> Void in
            XCTAssertNotNil(array, "array is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
}