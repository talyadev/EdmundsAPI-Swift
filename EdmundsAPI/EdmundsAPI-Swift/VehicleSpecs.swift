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
    func getAllCarMakes(#state: EdmundsAPIManager.STATE?, year: String?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/makes?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: EdmundsAPIManager.STATE?, year: String?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarMakesCount(#state: EdmundsAPIManager.STATE?, year: String?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/makes/count?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE MODEL
    func getCarModelDetailsByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE?, year: String?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getAllCarModelsByACarMakeNicename(#makeNiceName: String, state: EdmundsAPIManager.STATE?, year: String?, category: EdmundsAPIManager.CATEGORY?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/models?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if category != nil {
            URLString += "&category=\(category!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarModelsCount(#makeNiceName: String, state: EdmundsAPIManager.STATE?, year: String?, category: EdmundsAPIManager.CATEGORY?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/models?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if year != nil && !year!.isEmpty {
            URLString += "&year=\(year!)"
        }
        if category != nil {
            URLString += "&category=\(category!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE MODEL YEAR
    func getCarModelYearByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE?, category: EdmundsAPIManager.CATEGORY?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/years?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if category != nil {
            URLString += "&category=\(category!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(#makeNiceName: String, modelNiceName: String, year: String, category: EdmundsAPIManager.CATEGORY?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)?"
        if category != nil {
            URLString += "category=\(category!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarModelYearsCountByVehicleMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/years/count?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE STYLE
    func getStyleDetailsByID(#id: String, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)?"
        if view != nil {
            URLString += "view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesDetailsByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: EdmundsAPIManager.STATE?, category: EdmundsAPIManager.CATEGORY?, view: EdmundsAPIManager.VIEW?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)/styles?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        if category != nil {
            URLString += "&category=\(category!.rawValue)"
        }
        if view != nil {
            URLString += "&view=\(view!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesCountByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: EdmundsAPIManager.STATE?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/\(year)/styles/count?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesCountByVehicleMakeAndModel(#makeNiceName: String, modelNiceName: String, state: EdmundsAPIManager.STATE?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/\(modelNiceName)/styles/count?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesCountByVehicleMake(#makeNiceName: String, state: EdmundsAPIManager.STATE?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)/styles/count?"
        if state != nil {
            URLString += "state=\(state!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesCount(#state: EdmundsAPIManager.STATE, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/styles/count?state=\(state.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getStylesDetailsByVehicleChromeID(#chromeId: String, view: EdmundsAPIManager.VIEW, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/partners/chrome/styles/\(chromeId)?view=\(view.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE COLORS AND OPTIONS
    func getListOfOptionsByStyleID(#id: String, category: EdmundsAPIManager.OPTIONS?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/options?"
        if category != nil {
            URLString += "category=\(category!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getOptionsDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/options/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getListOfColorsByStyleID(#id: String, category: EdmundsAPIManager.OPTIONS?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/colors?"
        if category != nil {
            URLString += "category=\(category!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getColorsDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/colors/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE ENGINE & TRANSMISSION
    func getListOfEnginesByStyleID(#id: String, availability: EdmundsAPIManager.AVAILABILITY?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/engines?"
        if availability != nil {
            URLString += "availability=\(availability!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getEngineDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/engines/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }

    func getListOfTransmissionsByStyleID(#id: String, availability: EdmundsAPIManager.AVAILABILITY?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/transmissions?"
        if availability != nil {
            URLString += "availability=\(availability!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getTransmissionDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/transmissions/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE EQUIPMENT
    func getEquipmentDetailsByStyleID(#id: String, availability: EdmundsAPIManager.AVAILABILITY, equipmentType: EdmundsAPIManager.EQUIPMENTTYPE, name: EdmundsAPIManager.EQUIPMENTNAME?, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        var URLString = "https://api.edmunds.com/api/vehicle/v2/styles/\(id)/equipment?availability=\(availability.rawValue)&equipmentType=\(equipmentType.rawValue)"
        if name != nil {
            URLString += "&name=\(name!.rawValue)"
        }
        URLString += "&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getEquipmentDetailsByID(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/equipment/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE SQUISHVINS
    func getVehicleDetailsBySquishVIN(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/squishvins/\(id)/?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VEHICLE CONFIGURATION
    func getDefaultConfiguredVehicleByZipcodeAndStyleID(#zip: String, styleid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/configurator/default?zip=\(zip)&styleid=\(styleid)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getConfiguredVehicleWithOptions(#zip: String, styleid: String, selected: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/configurator/withOptions?zip=\(zip)&styleid=\(styleid)&selected=\(selected)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SPEC: VIN DECODING
    func getBasicVehicleInformationByVIN(#vin: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/v1/vehicle/vin/\(vin)/configuration?api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getFullVehicleDetailsByVIN(#vin: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/vins/\(vin)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
}