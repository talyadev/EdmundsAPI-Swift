//
//  VehiclePricing.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/30/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class VehiclePricing {
    let manager: EdmundsAPIManager!
    
    init(manager: EdmundsAPIManager) {
        self.manager = manager
    }
    
    //MARK: PRICING: TRUE COST TO OWN (TCO)
    func calculateForNewVehicles(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/newtruecosttoownbystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func calculateForUsedVehicles(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/usedtruecosttoownbystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func calculateTotalCashPriceForNewVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/newtotalcashpricebystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func calculateTotalCashPriceForUsedVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/usedtotalcashpricebystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func getVehicleMakesWithTCOData(#edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getmakeswithtcodata?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func getVehicleModelsWithTCOData(#makeId: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getmodelswithtcodata?makeid=\(makeId)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func getVehicleStylesWithTCOData(#make: String, model: String, year: String, submodel: EdmundsAPIManager.CATEGORY, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getstyleswithtcodatabysubmodel?make=\(make)&model=\(model)&year=\(year)&submodel=\(submodel.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func getTCODetailsForANewCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/tco/v1/details/allnewtcobystyleidzipandstate/\(styleId)/\(zip)/\(state)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
    func getTCODetailsForAUsedCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/tco/v1/details/allusedtcobystyleidzipandstate/\(styleId)/\(zip)/\(state)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let dictionary = self.manager.parseJSON(data!)
                edmundResponse(dictionary, nil)
            }
        })
    }
    
}