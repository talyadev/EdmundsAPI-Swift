//
//  VehicleSpecs.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/28/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

/**
    All related vehicle data from make, model, years specs to VIN decoding.
*/
class VehicleSpecs {
    
    let manager: EdmundsAPIManager!
    
    init(manager: EdmundsAPIManager) {
        self.manager = manager
    }
    
    //MARK: SPEC: VEHICLE MAKE
    func getAllCarMakes(#state: EdmundsAPIManager.STATE, year: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/makes?state=\(state.rawValue)&year=\(year)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: EdmundsAPIManager.STATE, year: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)?state=\(state.rawValue)&year=\(year)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarMakesCount(#state: EdmundsAPIManager.STATE, year: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/makes/count?state=\(state.rawValue)&year=\(year)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE MODEL
    func getCarModelDetailsByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE, year: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)?state=\(state.rawValue)&year=\(year)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getAllCarModelsByACarMakeNicename(#makeNiceName: String, state: EdmundsAPIManager.STATE, year: String, category: EdmundsAPIManager.CATEGORY, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/models?state=\(state.rawValue)&year=\(year)&category=\(category.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarModelsCount(#makeNiceName: String, state: EdmundsAPIManager.STATE, year: String, category: EdmundsAPIManager.CATEGORY, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/models?state=\(state.rawValue)&year=\(year)&category=\(category.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE MODEL YEAR
    func getCarModelYearByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE, category: EdmundsAPIManager.CATEGORY, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/years?state=\(state.rawValue)&category=\(category.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(#makeNiceName: String, modelNiceName: String, year: String, category: EdmundsAPIManager.CATEGORY, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)?category=\(category.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarModelYearsCountByVehicleMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/years/count?state=\(state.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE STYLE
    func getStyleDetailsByID(#id: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)?view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesDetailsByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: EdmundsAPIManager.STATE, category: EdmundsAPIManager.CATEGORY, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)/styles?state=\(state.rawValue)&category=\(category.rawValue)&view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesCountByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: EdmundsAPIManager.STATE, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)/styles/count?state=\(state.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesCountByVehicleMakeAndModel(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/styles/count?state=\(state.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesCountByVehicleMake(#makeNiceName: String, state: EdmundsAPIManager.STATE, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/styles/count?state=\(state.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesCount(#state: EdmundsAPIManager.STATE, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/count?state=\(state.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getStylesDetailsByVehicleChromeID(#chromeId: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/partners/chrome/styles/\(chromeId)?view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE COLORS AND OPTIONS
    func getListOfOptionsByStyleID(#id: String, categoryoptions: EdmundsAPIManager.CATEGORYOPTIONS, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/options?category=\(categoryoptions.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getOptionsDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/options/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getListOfColorsByStyleID(#id: String, categoryOptions: EdmundsAPIManager.CATEGORYOPTIONS, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/colors?category=\(categoryOptions.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getColorsDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/colors/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE ENGINE & TRANSMISSION
    func getListOfEnginesByStyleID(#id: String, categoryAvailability: EdmundsAPIManager.CATEGORYAVAILABILITY, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/engines?availability=\(categoryAvailability.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getEngineDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/engines/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
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

    func getListOfTransmissionsByStyleID(#id: String, categoryAvailability: EdmundsAPIManager.CATEGORYAVAILABILITY, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/transmissions?availability=\(categoryAvailability.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getTransmissionDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/transmissions/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    //MARK: SPEC: VEHICLE EQUIPMENT
    func getEquipmentDetailsByStyleID(#id: String, categoryAvailability: EdmundsAPIManager.CATEGORYAVAILABILITY, equipmentType: EdmundsAPIManager.CATEGORYEQUIPMENTTYPE, name: EdmundsAPIManager.CATEGORYEQUIPMENTNAME, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = ""
        if !name.rawValue.isEmpty {
            URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/equipment?availability=\(categoryAvailability.rawValue)&equipmentType=\(equipmentType.rawValue)&name=\(name.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        }
        else {
            URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/equipment?availability=\(categoryAvailability.rawValue)&equipmentType=\(equipmentType.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        }
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
    
    func getEquipmentDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/equipment/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
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