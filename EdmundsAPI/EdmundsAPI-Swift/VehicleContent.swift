//
//  VehicleContent.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/31/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class VehicleContent {
    
    let manager: EdmundsAPIManager!
    
    init(manager: EdmundsAPIManager) {
        self.manager = manager
    }
    
    //MARK: CONTENT: EDMUNDS CAR RATINGS
    func getCarRatingsByMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, submodel: EdmundsAPIManager.CATEGORY, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/grade/\(makeNiceName)/\(modelNiceName)/\(year)?submodel=\(submodel.rawValue)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getCarRatingsByVehicleStyleId(#styleid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehicle/v2/grade/\(styleid)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getConsumerRatingsAndReviewsByCarMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, sortby: String, pagenum: String, pagesize: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehiclereviews/v2/\(makeNiceName)/\(modelNiceName)/\(year)?sortby=\(sortby)&pagenum=\(pagenum)&pagesize=\(pagesize)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getConsumerRatingsAndReviewsByCarStyleId(#styleid: String, sortby: String, pagenum: String, pagesize: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/api/vehiclereviews/v2/styles/\(styleid)?sortby=\(sortby)&pagenum=\(pagenum)&pagesize=\(pagesize)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
}