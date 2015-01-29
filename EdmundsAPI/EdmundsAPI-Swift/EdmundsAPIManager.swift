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
    
    enum CATEGORYOPTIONS: String {
        case kINTERIOR = "Interior"
        case kEXTERIOR = "Exterior"
        case kROOF = "Roof"
        case kINTERIORTRIM = "Interior+Trim"
        case kMECHANICAL = "Mechanical"
        case kPACKAGE = "Package"
        case kADDITIONALFEES = "Additional+Fees"
        case kOTHER = "Other"
    }
    
    enum CATEGORYAVAILABILITY: String {
        case kSTANDARD = "standard"
        case kOPTIONAL = "optional"
    }
    
    enum CATEGORYEQUIPMENTTYPE: String {
        case kAUDIOSYSTEM = "AUDIO_SYSTEM"
        case kCOLOR = "COLOR"
        case kENGINE = "ENGINE"
        case kMANUFACTURER = "MANUFACTURER"
        case kMIRRORS = "MIRRORS"
        case kOPTION = "OPTION"
        case kOTHER = "OTHER"
        case kTELEMATICS = "TELEMATICS"
        case kTIRES = "TIRES"
    }
    
    enum CATEGORYEQUIPMENTNAME: String {
        case k1STROWSEATS = "1ST_ROW_SEATS"
        case k2NDROWSEATS = "2ND_ROW_SEATS"
        case k3RDROWSEATS = "3RD_ROW_SEATS"
        case k4THROWSEATS = "4TH_ROW_SEATS"
        case k5THROWSEATS = "5TH_ROW_SEATS"
        case kAIRCONDITIONING = "AIR_CONDITIONING"
        case kAIRBAGS = "AIRBAGS"
        case kAUDIOSYSTEM = "AUDIO_SYSTEM"
        case kBRAKESYSTEM = "BRAKE_SYSTEM"
        case kCARGODIMENSIONS = "CARGO_DIMENSIONS"
        case kCOLLISIONSAFETYSYSTEM = "COLLISION_SAFETY_SYSTEM"
        case kCOLOR = "COLOR"
        case kCONVERTIBLEROOF = "CONVERTIBLE_ROOF"
        case kDIFFERENTIAL = "DIFFERENTIAL"
        case kDOORS = "DOORS"
        case kDRIVETYPE = "DRIVE_TYPE"
        case kDRIVERSEAT = "DRIVER_SEAT"
        case kENGINE = "ENGINE"
        case kEXTERIORDIMENSIONS = "EXTERIOR_DIMENSIONS"
        case kEXTERIORLIGHTS = "EXTERIOR_LIGHTS"
        case kFRONTPASSENGERSEAT = "FRONT_PASSENGER_SEAT"
        case kINSTRUMENTATION = "INSTRUMENTATION"
        case kINTERIORDIMENSIONS = "INTERIOR_DIMENSIONS"
        case kMANUFACTURER = "MANUFACTURER"
        case kMIRRORS = "MIRRORS"
        case kMOBILECONNECTIVITY = "MOBILE_CONNECTIVITY"
        case kNAVIGATIONSYSTEM = "NAVIGATION_SYSTEM"
        case kPARKINGAID = "PARKING_AID"
        case kPOWEROUTLETS = "POWER_OUTLETS"
        case kSEATBELTS = "SEATBELTS"
        case kSEATINGCONFIGURATION = "SEATING_CONFIGURATION"
        case kSECURITY = "SECURITY"
        case kSPARETIRE = "SPARE_TIRE%2FWHEEL"
        case kSPECIFICATIONS = "SPECIFICATIONS"
        case kSTEERING = "STEERING"
        case kSTEERINGWHEEL = "STEERING_WHEEL"
        case kSTORAGE = "STORAGE"
        case kSUNROOF = "SUNROOF"
        case kSUSPENSION = "SUSPENSION"
        case kTECHNOLOGYFEATURE = "TECHNOLOGY_FEATURE"
        case kTELEMATICS = "TELEMATICS"
        case kTIRES = "TIRES"
        case kTRAILERTOWINGEQUIPMENT = "TRAILER_TOWING_EQUIPMENT"
        case kTRANSMISSION = "TRANSMISSION"
        case kTRUCKBED = "TRUCK_BED"
        case kTRUNK = "TRUNK"
        case kVIDEOSYSTEM = "VIDEO_SYSTEM"
        case kWARRANTY = "WARRANTY"
        case kWHEELS = "WHEELS"
        case kWINDOWS = "WINDOWS"
    }
    
    let kAPIKEY = "7fvw4x2vs5pzcq8qaewbszjt"
    let vehicleSpecs: VehicleSpecs!
    
    init() {
        vehicleSpecs = VehicleSpecs(manager: self)
    }
  
    //MARK: SPEC: VEHICLE MAKE
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
    
    //MARK: SPEC: VEHICLE MODEL
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
    
    //MARK: SPEC: VEHICLE MODEL YEAR
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
    
    //MARK: SPEC: VEHICLE STYLE
    /**
        Get Style Details by ID
        Get vehicle style details by Edmunds vehicle style ID.
        
        :param: id Edmunds vehicle style ID
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStyleDetailsByID(#id: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStyleDetailsByID(id: id, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Details by Vehicle Make/Model/Year
        Get vehicle style details by vehicle make and model niceNames and year.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: state The state of the car make
        :param: category Vehicle category
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesDetailsByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: STATE, category: CATEGORY, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesDetailsByVehicleMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, state: state, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make/Model/Year
        Get vehicle style count by vehicle make and model niceNames and year.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: state The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: STATE, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCountByVehicleMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make and Model
        Get vehicle style count by vehicle make and model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMakeAndModel(#makeNiceName: String, modelNiceName: String, state: STATE, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCountByVehicleMakeAndModel(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make
        Get vehicle style count by vehicle make niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMake(#makeNiceName: String, state: STATE, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCountByVehicleMake(makeNiceName: makeNiceName, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count
        Get vehicle style count.
        
        :param: state The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCount(#state: STATE, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCount(state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Details by Vehicle Chrome ID
        Get vehicle style details by Chrome Data vehicle ID. **this is an endpoint only provided to explicit partners of both Chrome Data and Edmunds.com, please Edmunds to inquire.
        
        :param: chromeId The Chrome ID for a vehicle
        :param: view The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesDetailsByVehicleChromeID(#chromeId: String, view: VIEW, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesDetailsByVehicleChromeID(chromeId: chromeId, view: view, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VEHICLE COLORS AND OPTIONS
    /**
        Get List of Options by Style ID
        Get list of options and their details for a specific style ID.

        :param: id Edmunds vehicle style ID
        :param: categoryoptions Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfOptionsByStyleID(#id: String, categoryoptions: CATEGORYOPTIONS, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfOptionsByStyleID(id: id, categoryoptions: categoryoptions, edmundResponse: edmundResponse)
    }
    
    /**
        Get Options Details by ID
        Get options detail by option ID.
        
        :param: id Edmunds option ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getOptionsDetailsByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getOptionsDetailsByID(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get List of Colors by Style ID
        Get list of colors and their details for a specific Edmunds style ID.
        
        :param: id Edmunds vehicle style ID
        :param: categoryOptions Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfColorsByStyleID(#id: String, categoryOptions: CATEGORYOPTIONS, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfColorsByStyleID(id: id, categoryOptions: categoryOptions, edmundResponse: edmundResponse)
    }
    
    /**
        Get Colors Details by ID
        Get colors detail by color ID.
        
        :param: id Edmunds color ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getColorsDetailsByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getColorsDetailsByID(id: id, edmundResponse: edmundResponse)
    }
    
    //MARK: VEHICLE ENGINE & TRANSMISSION
    /**
        Get List of Engines by Style ID
        Get list of engines and their details for a specific Edmunds style ID.
        
        :param: id Edmunds vehicle style ID
        :param: categoryAvailability Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfEnginesByStyleID(#id: String, categoryAvailability: CATEGORYAVAILABILITY, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfEnginesByStyleID(id: id, categoryAvailability: categoryAvailability, edmundResponse: edmundResponse)
    }
    
    /**
        Get Engine Details by ID
        Get vehicle engine details by engine ID.
        
        :param: id The engine ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getEngineDetailsByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getEngineDetailsByID(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get List of Transmissions by Style ID
        Get list of transmission and their details for a specific Edmunds style ID.
        
        :param: id Edmunds vehicle style ID
        :param: categoryAvailability Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfTransmissionsByStyleID(#id: String, categoryAvailability: CATEGORYAVAILABILITY, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfTransmissionsByStyleID(id: id, categoryAvailability: categoryAvailability, edmundResponse: edmundResponse)
    }
    
    /**
        Get Transmission Details by ID
        Get list of transmission and their details for a specific Edmunds style ID.
        
        :param: id The transmission ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getTransmissionDetailsByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getTransmissionDetailsByID(id: id, edmundResponse: edmundResponse)
    }
    
    //MARK: VEHICLE EQUIPMENT
    /**
        Get Equipment Details by Style ID
        Get list of equipment details for a specific style ID.
        
        :param: id Edmunds vehicle style ID
        :param: categoryAvailability Equipment availability
        :param: equipmentType Equipment category
        :param: name Equipment category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getEquipmentDetailsByStyleID(#id: String, categoryAvailability: CATEGORYAVAILABILITY, equipmentType: CATEGORYEQUIPMENTTYPE, name: CATEGORYEQUIPMENTNAME, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getEquipmentDetailsByStyleID(id: id, categoryAvailability: categoryAvailability, equipmentType: equipmentType, name: name, edmundResponse: edmundResponse)
    }
    
    /**
        Get Equipment Details by ID
        Get equipment details by ID.
        
        :param: id Edmunds vehicle style ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getEquipmentDetailsByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getEquipmentDetailsByID(id: id, edmundResponse: edmundResponse)
    }
    
    //MARK: HELPER METHODS
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