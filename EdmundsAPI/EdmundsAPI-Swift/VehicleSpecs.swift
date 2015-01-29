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
    
    func getAllCarMakes(#state: EdmundsAPIManager.STATE, year: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/makes?state=\(state.rawValue)&year=\(year)&view=basic&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: EdmundsAPIManager.STATE, year: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/\(makeNiceName)?state=\(state.rawValue)&year=\(year)&view=basic&fmt=json&api_key=\(manager.kAPIKEY)"
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
    
    func getCarMakesCount(#state: EdmundsAPIManager.STATE, year: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/makes/count?state=\(state.rawValue)&year=\(year)&view=basic&fmt=json&api_key=\(manager.kAPIKEY)"
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