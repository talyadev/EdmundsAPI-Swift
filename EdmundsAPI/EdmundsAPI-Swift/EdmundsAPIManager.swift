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
    
    enum VIEW: String {
        case kBASIC = "basic"
        case kFULL = "full"
    }
    
    enum CATEGORY: String {
        case k4DRHATCHBACK = "4dr+Hatchback"
        case kCOUPE = "Coupe"
        case kCONVERTIBLE = "Convertible"
        case kSEDAN = "Sedan"
        case k2DRHATCHBACK = "2dr+Hatchback"
        case kWAGON = "Wagon"
        case kREGULARCABPICKUP = "Regular+Cab+Pickup"
        case kEXTENDEDCABPICKUP = "Extended+Cab+Pickup"
        case kCREWCABPICKUP = "Crew+Cab+Pickup"
        case k2DRSUV = "2dr+SUV"
        case k4DRSUV = "4dr+SUV"
        case kCONVERTIBLESUV = "Convertible+SUV"
        case kCARGOVAN = "Cargo+Van"
        case kPASSENGERVAN = "Passenger+Van"
        case kCARGOMINIVAN = "Cargo+Minivan"
        case kPASSENGERMINIVAN = "Passenger+Minivan"
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
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getAllCarMakes(#state: STATE, year: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getAllCarMakes(state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Make Details by Make Nicename
        Get the car make details by its URL-friendly name, or niceName.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint)
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: STATE, year: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakeDetailsByMakeNicename(makeNiceName: makeNiceName, state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Makes Count
        Get the car makes count in total and per criteria.
        
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakesCount(#state: STATE, year: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakesCount(state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Model Details by Car Make and Model Nicenames
        Get a vehicle model by its Edmunds Vehicle Make and Model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelDetailsByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE, year: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelDetailsByCarMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get All Car Models by a Car Make Nicename
        Get a list of car models for a specific car make by the make's niceName.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: category Vehicle category
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getAllCarModelsByACarMakeNicename(#makeNiceName: String, state: STATE, year: String, category: CATEGORY, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getAllCarModelsByACarMakeNicename(makeNiceName: makeNiceName, state: state, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Models Count
        Get car models count for a specific car make.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state The state of the car make
        :param: year The four-digit year of interest
        :param: category Vehicle category
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelsCount(#makeNiceName: String, state: STATE, year: String, category: CATEGORY, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelsCount(makeNiceName: makeNiceName, state: state, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Model Year by Car Make and Model Nicenames
        Get a vehicle's model year details by providing its vehicle Make and Model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state The state of the car make
        :param: category Vehicle category
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE, category: CATEGORY, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearByCarMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state,category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Model Year by Car Make and Model Nicenames and the Car Year
        Get a list of all Model Years and Styles for a specific vehicle by its Make/Model/Year details.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: category Vehicle category
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(#makeNiceName: String, modelNiceName: String, year: String, category: CATEGORY, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
    Get Car Model Years Count by Vehicle Make and Model Nicenames
    Get the total count of car make years for a specific car make and model.
    
    :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
    :param: modelNiceName Car model niceName
    :param: state The state of the car make
    :param: view The response payload
    :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearsCountByVehicleMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearsCountByVehicleMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, view: view, edmundResponse: edmundResponse)
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
        Parse JSON data
    
        :param: data The NSData to be parsed
        :return: dictionary The JSON dictionary
    */
    func parseJSON(data: NSData) -> NSDictionary {
        //var err: NSError
        let dictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        return dictionary
    }
}