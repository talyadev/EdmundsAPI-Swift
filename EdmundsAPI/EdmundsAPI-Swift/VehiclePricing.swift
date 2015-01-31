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
    func calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(#makeNiceName: String, year: String, msrp: String, zip: String, color: String?, model: String?, vehicleStyle: EdmundsAPIManager.CATEGORY?, drivenWheels: EdmundsAPIManager.DRIVENWHEELS?, fuelType: EdmundsAPIManager.FUELTYPE?, cylinders: String?, compressorType: EdmundsAPIManager.COMPRESSORTYPE?, trim: String?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
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
    
    func calculateForNewVehicleWithCarVINMSRPAndZipcode(#vin: String, zip: String, msrp: String, color: EdmundsAPIManager.COLOR, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/v1/vehicle/vin/\(vin)/price?zip=\(zip)&msrp=\(msrp)&color=\(color.rawValue)&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateForNewVehicleWithCarStyleIdAndZipcode(#styleId: String, zip: String, colorId: String?, optionId: String?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/v1/api/tmv/tmvservice/calculatenewtmv?styleid=\(styleId)&zip=\(zip)"
        if colorId != nil && !colorId!.isEmpty {
            URLString += "&colorid=\(colorId!)"
        }
        if optionId != nil && !optionId!.isEmpty {
            URLString += "&optionid=\(optionId)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateForNewVehicleWithCarStyleIdConditionMileageAndZipcode(#styleId: String, condition: EdmundsAPIManager.CONDITION, mileage: String, zip: String, colorId: String?, optionId: String?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/v1/api/tmv/tmvservice/calculateusedtmv?styleid=\(styleId)&condition=\(condition.rawValue)&mileage=\(mileage)&zip=\(zip)"
        if colorId != nil && !colorId!.isEmpty {
            URLString += "&colorid=\(colorId!)"
        }
        if optionId != nil && !optionId!.isEmpty {
            URLString += "&optionid=\(optionId)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateForTheTypicallyEquippedVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tmv/tmvservice/calculatetypicallyequippedusedtmv?styleid=\(styleId)&zip=\(zip)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func calculateForTheCertifiedVehicle(#styleId: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponseString) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/tmv/tmvservice/findcertifiedpriceforstyle?styleid=\(styleId)&zip=\(zip)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: PRICING: INCENTIVES AND REBATES
    func getIncentivesAndRebatesByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findbyid?id=\(id)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleMakeID(#makeid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbymakeid?makeid=\(makeid)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleStyleID(#styleid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbystyleid?styleid=\(styleid)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleCategoryAndZipcode(#category: EdmundsAPIManager.CATEGORY, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbycategoryandzipcode?category=\(category.rawValue)&zipcode=\(zip)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleMakeIdAndZipcode(#makeid: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbymakeidandzipcode?makeid=\(makeid)&zipcode=\(zip)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleModelYearIdAndZipcode(#modelyearid: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbymodelyearidandzipcode?modelyearid=\(modelyearid)&zipcode=\(zip)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getIncentivesAndRebatesByVehicleStyleIdAndZipcode(#styleid: String, zip: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/incentive/incentiverepository/findincentivesbystyleidandzipcode?styleid=200477465&zipcode=90404&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
}