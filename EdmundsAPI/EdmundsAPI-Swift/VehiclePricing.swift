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
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateForUsedVehicles(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/usedtruecosttoownbystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateTotalCashPriceForNewVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/newtotalcashpricebystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateTotalCashPriceForUsedVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/usedtotalcashpricebystyleidandzip/\(styleId)/\(zip)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getVehicleMakesWithTCOData(#edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getmakeswithtcodata?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getVehicleModelsWithTCOData(#makeId: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getmodelswithtcodata?makeid=\(makeId)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getVehicleStylesWithTCOData(#make: String, model: String, year: String, submodel: EdmundsAPIManager.CATEGORY, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tco/getstyleswithtcodatabysubmodel?make=\(make)&model=\(model)&year=\(year)&submodel=\(submodel.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getTCODetailsForANewCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/tco/v1/details/allnewtcobystyleidzipandstate/\(styleId)/\(zip)/\(state)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getTCODetailsForAUsedCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/tco/v1/details/allusedtcobystyleidzipandstate/\(styleId)/\(zip)/\(state)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: PRICING: TRUE MARKET VALUE (TMV)
    func calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(#makeNiceName: String, year: String, msrp: String, zip: String, color: String?, model: String?, vehicleStyle: EdmundsAPIManager.CATEGORY?, drivenWheels: EdmundsAPIManager.CATEGORYDRIVENWHEELS?, fuelType: EdmundsAPIManager.CATEGORYFUELTYPE?, cylinders: String?, compressorType: EdmundsAPIManager.CATEGORYCOMPRESSORTYPE?, trim: String?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/v1/vehicle/\(makeNiceName)/\(year)/price?msrp=\(msrp)&zip=\(zip)"
        if color != nil && !color!.isEmpty {
            URLString = URLString+"&color=\(color!)"
        }
        if model != nil && !model!.isEmpty {
            URLString = URLString+"&model=\(model!)"
        }
        if vehicleStyle != nil && !vehicleStyle!.rawValue.isEmpty {
            URLString = URLString+"&vehicleStyle=\(vehicleStyle!.rawValue)"
        }
        if drivenWheels != nil && !drivenWheels!.rawValue.isEmpty {
            URLString = URLString+"&drivenWheels=\(drivenWheels!.rawValue)"
        }
        if fuelType != nil && !fuelType!.rawValue.isEmpty {
            URLString = URLString+"&fuelType=\(fuelType!.rawValue)"
        }
        if cylinders != nil && !cylinders!.isEmpty {
            URLString = URLString+"&cylinders=\(cylinders!)"
        }
        if compressorType != nil && !compressorType!.rawValue.isEmpty {
            URLString = URLString+"&compressorType=\(compressorType!.rawValue)"
        }
        if trim != nil && !trim!.isEmpty {
            URLString = URLString+"&trim=\(trim!)"
        }
        URLString = URLString+"&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    
}