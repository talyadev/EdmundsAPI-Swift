//
//  EdmundsAPIManager.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/28/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class EdmundsAPIManager {
    
    typealias EdmundResponse = (NSDictionary?, NSError?) -> Void
    typealias DataResponse = (NSData?, NSError?) -> Void
    
    enum STATE: String {
        case kNEW = "new"
        case kFUTURE = "future"
        case kUSED = "used"
    }
    
    let kAPIKEY = "7fvw4x2vs5pzcq8qaewbszjt"
    let vehicleSpecs: VehicleSpecs!
    
    init() {
        vehicleSpecs = VehicleSpecs(manager: self)
    }
    
    /**
        Get All Car Makes
        Get a list of all vehicle makes (new, used and future) and their models.
    
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: edmundResponse The response from Edmund API on completion
    */
    func getAllCarMakes(#state: STATE, year: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getAllCarMakes(state: state, year: year, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Make Details by Make Nicename
        Get the car make details by its URL-friendly name, or niceName.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint)
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: STATE, year: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakeDetailsByMakeNicename(makeNiceName: makeNiceName, state: state, year: year, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Makes Count
        Get the car makes count in total and per criteria.
        
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakesCount(#state: STATE, year: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakesCount(state: state, year: year, edmundResponse: edmundResponse)
    }
    
    /**
        Get JSON data
    
        :param: URLString The URL in string
        :param: dataResponse The response from Edmund API on completion
    */
    func getJSON(URLString: String, dataResponse: DataResponse) {
        let url = NSURL(string: URLString)
        let request = NSURLRequest(URL: url!)
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response: NSURLResponse!, data: NSData!, err: NSError!) -> Void in
            if let error = err {
                dataResponse(nil, error)
            }
            else {
                dataResponse(data, nil)
            }
        }
    }
    
    /**

    */
    func parseJSON(data: NSData) -> NSDictionary {
        //var err: NSError
        let dictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        return dictionary
    }
}