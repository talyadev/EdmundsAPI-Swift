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
    
    //MARK: SPEC: VEHICLE MAKE
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
    
    func testGetAllCarMakes_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getAllCarMakes(state: nil, year: nil, view: nil) { (dictionary: NSDictionary?, err: NSError?) -> Void in
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
    
    func testGetCarMakeDetailsByMakeNicename_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarMakeDetailsByMakeNicename(makeNiceName: "Audi", state: nil, year: nil, view: nil) { (dictionary: NSDictionary?, err: NSError?) -> Void in
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
    
    func testGetCarMakesCount_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarMakesCount(state: nil, year: nil, view: nil) { (dictionary: NSDictionary?, err: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE MODEL
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
    
    func testGetCarModelDetailsByCarMakeAndModelNicenames_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelDetailsByCarMakeAndModelNicenames(makeNiceName: "honda", modelNiceName: "accord", state: nil, year: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
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
    
    func testGetAllCarModelsByACarMakeNicename_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getAllCarModelsByACarMakeNicename(makeNiceName: "bmw", state: nil, year: nil, category: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
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
    
    func testGetCarModelsCount_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelsCount(makeNiceName: "honda", state: nil, year: nil, category: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE MODEL YEAR
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
    
    func testGetCarModelYearByCarMakeAndModelNicenames_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearByCarMakeAndModelNicenames(makeNiceName: "honda", modelNiceName: "accord", state: nil, category: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
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
    
    func testGetCarModelYearByCarMakeAndModelNicenamesAndTheCarYear_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(makeNiceName: "honda", modelNiceName: "civic", year: "2013", category: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
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
    
    func testGetCarModelYearsCountByVehicleMakeAndModelNicenames_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getCarModelYearsCountByVehicleMakeAndModelNicenames(makeNiceName: "audi", modelNiceName: "a6", state: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE STYLE
    func testGetStyleDetailsByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStyleDetailsByID(id: "200487199", view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStyleDetailsByID_ViewNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStyleDetailsByID(id: "200487199", view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesDetailsByVehicleMakeModelYear() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesDetailsByVehicleMakeModelYear(makeNiceName: "honda", modelNiceName: "pilot", year: "2010", state: EdmundsAPIManager.STATE.kUSED, category: EdmundsAPIManager.CATEGORY.kSEDAN, view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesDetailsByVehicleMakeModelYear_OptionalValues() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesDetailsByVehicleMakeModelYear(makeNiceName: "honda", modelNiceName: "pilot", year: "2010", state: nil, category: nil, view: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMakeModelYear() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMakeModelYear(makeNiceName: "honda", modelNiceName: "pilot", year: "2010", state: EdmundsAPIManager.STATE.kUSED) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMakeModelYear_StateNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMakeModelYear(makeNiceName: "honda", modelNiceName: "pilot", year: "2010", state: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMakeAndModel() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMakeAndModel(makeNiceName: "honda", modelNiceName: "pilot", state: EdmundsAPIManager.STATE.kUSED) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMakeAndModel_StateNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMakeAndModel(makeNiceName: "honda", modelNiceName: "pilot", state: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMake() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMake(makeNiceName: "honda", state: EdmundsAPIManager.STATE.kUSED) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCountByVehicleMake_StateNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCountByVehicleMake(makeNiceName: "honda", state: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesCount() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesCount(state: EdmundsAPIManager.STATE.kUSED) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetStylesDetailsByVehicleChromeID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getStylesDetailsByVehicleChromeID(chromeId: "11916", view: EdmundsAPIManager.VIEW.kFULL) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE COLORS AND OPTIONS
    func testGetListOfOptionsByStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfOptionsByStyleID(id: "200477465", category: EdmundsAPIManager.OPTIONS.kEXTERIOR) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfOptionsByStyleID_CategoryNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfOptionsByStyleID(id: "200477465", category: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetOptionsDetailsByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getOptionsDetailsByID(id: "200477465") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfColorsByStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfColorsByStyleID(id: "200477465", category: EdmundsAPIManager.OPTIONS.kEXTERIOR) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfColorsByStyleID_CategoryNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfColorsByStyleID(id: "200477465", category: EdmundsAPIManager.OPTIONS.kEXTERIOR) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetColorsDetailsByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getColorsDetailsByID(id: "200477486") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfEnginesByStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfEnginesByStyleID(id: "200477465", availability: EdmundsAPIManager.AVAILABILITY.kSTANDARD) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfEnginesByStyleID_AvailabilityNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfEnginesByStyleID(id: "200477465", availability: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetEngineDetailsByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getEngineDetailsByID(id: "200477467") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfTransmissionsByStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfTransmissionsByStyleID(id: "200477465", availability: EdmundsAPIManager.AVAILABILITY.kSTANDARD) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetListOfTransmissionsByStyleID_AvailabilityNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getListOfTransmissionsByStyleID(id: "200477465", availability: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetTransmissionDetailsByID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getTransmissionDetailsByID(id: "200477468") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE EQUIPMENT
    func testGetEquipmentDetailsByStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getEquipmentDetailsByStyleID(id: "200477465", availability: EdmundsAPIManager.AVAILABILITY.kSTANDARD, equipmentType: EdmundsAPIManager.EQUIPMENTTYPE.kOTHER, name: EdmundsAPIManager.EQUIPMENTNAME.k1STROWSEATS) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetEquipmentDetailsByStyleID_NameNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getEquipmentDetailsByStyleID(id: "200477465", availability: EdmundsAPIManager.AVAILABILITY.kSTANDARD, equipmentType: EdmundsAPIManager.EQUIPMENTTYPE.kOTHER, name: nil) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetEquipmentDetailsByID_NameNil() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getEquipmentDetailsByID(id: "200477520") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE SQUISHVINS
    func testGetVehicleDetailsBySquishVIN() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getVehicleDetailsBySquishVIN(id: "1GTGG29W11") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VEHICLE CONFIGURATION
    func testGetDefaultConfiguredVehicleByZipcodeAndStyleID() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getDefaultConfiguredVehicleByZipcodeAndStyleID(zip: "90019", styleid: "200477465") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetConfiguredVehicleWithOptions() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getConfiguredVehicleWithOptions(zip: "90019", styleid: "200477465", selected: "200477503") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    //MARK: SPEC: VIN DECODING
    func testGetBasicVehicleInformationByVIN() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getBasicVehicleInformationByVIN(vin: "2G1FC3D33C9165616") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
    
    func testGetFullVehicleDetailsByVIN() {
        let readyExpectation = self.expectationWithDescription("ready")
        manager.getBasicVehicleInformationByVIN(vin: "2G1FC3D33C9165616") { (dictionary: NSDictionary?, error: NSError?) -> Void in
            XCTAssertNotNil(dictionary, "dictionary is nil")
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: { (error: NSError!) -> Void in
            XCTAssertNil(error, "error")
        })
    }
}