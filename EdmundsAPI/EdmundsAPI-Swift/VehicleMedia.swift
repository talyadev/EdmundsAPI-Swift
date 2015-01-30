//
//  VehicleMedia.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/30/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class VehicleMedia {
    let manager: EdmundsAPIManager!
    
    init(manager: EdmundsAPIManager) {
        self.manager = manager
    }
    
    //MARK: MEDIA: VEHICLE PHOTO
    func getVehiclePhotoByVehicleStyleID(#styleId: String, edmundResponse: EdmundsAPIManager.EdmundResponseMedia) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/vehiclephoto/service/findphotosbystyleid?styleId=\(styleId)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            if let err = error {
                edmundResponse(nil, err)
            }
            else {
                let array = self.manager.parseJSONArray(data!)
                edmundResponse(array, nil)
            }
        })
    }
}