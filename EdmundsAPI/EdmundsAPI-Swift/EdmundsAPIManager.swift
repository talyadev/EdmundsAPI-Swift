//
//  EdmundsAPIManager.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/28/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class EdmundsAPIManager {
    
    //Edumnds API Key
    let kAPIKEY = "7fvw4x2vs5pzcq8qaewbszjt"
    
    typealias EdmundResponse = (NSDictionary?, NSError?) -> Void
    typealias EdmundResponseMedia = (NSArray?, NSError?) -> Void
    typealias EdmundResponseString = (String?, NSError?) -> Void
    typealias DataResponse = (NSData?, NSError?) -> Void
    let vehicleSpecs: VehicleSpecs!
    let vehicleMedia: VehicleMedia!
    let vehiclePricing: VehiclePricing!
    let vehicleContent: VehicleContent!
    let vehicleService: VehicleService!
    
    init() {
        vehicleSpecs = VehicleSpecs(manager: self)
        vehicleMedia = VehicleMedia(manager: self)
        vehiclePricing = VehiclePricing(manager: self)
        vehicleContent = VehicleContent(manager: self)
        vehicleService = VehicleService(manager: self)
    }
  
    //MARK: SPEC: VEHICLE MAKE
    /**
        Get All Car Makes
        Get a list of all vehicle makes (new, used and future) and their models.
    
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getAllCarMakes(#state: STATE?, year: String?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getAllCarMakes(state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Make Details by Make Nicename
        Get the car make details by its URL-friendly name, or niceName.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint)
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakeDetailsByMakeNicename(#makeNiceName: String, state: STATE?, year: String?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakeDetailsByMakeNicename(makeNiceName: makeNiceName, state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Makes Count
        Get the car makes count in total and per criteria.
        
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarMakesCount(#state: STATE?, year: String?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarMakesCount(state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VEHICLE MODEL
    /**
        Get Car Model Details by Car Make and Model Nicenames
        Get a vehicle model by its Edmunds Vehicle Make and Model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelDetailsByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE?, year: String?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelDetailsByCarMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, year: year, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get All Car Models by a Car Make Nicename
        Get a list of car models for a specific car make by the make's niceName.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: category (optional) Vehicle category
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getAllCarModelsByACarMakeNicename(#makeNiceName: String, state: STATE?, year: String?, category: CATEGORY?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getAllCarModelsByACarMakeNicename(makeNiceName: makeNiceName, state: state, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Models Count
        Get car models count for a specific car make.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state (optional) The state of the car make
        :param: year (optional) The four-digit year of interest
        :param: category (optional) Vehicle category
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelsCount(#makeNiceName: String, state: STATE?, year: String?, category: CATEGORY?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelsCount(makeNiceName: makeNiceName, state: state, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VEHICLE MODEL YEAR
    /**
        Get Car Model Year by Car Make and Model Nicenames
        Get a vehicle's model year details by providing its vehicle Make and Model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state (optional) The state of the car make
        :param: category (optional) Vehicle category
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearByCarMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE?, category: CATEGORY?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearByCarMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state,category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Model Year by Car Make and Model Nicenames and the Car Year
        Get a list of all Model Years and Styles for a specific vehicle by its Make/Model/Year details.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: category (optional) Vehicle category
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(#makeNiceName: String, modelNiceName: String, year: String, category: CATEGORY?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearByCarMakeAndModelNicenamesAndTheCarYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Model Years Count by Vehicle Make and Model Nicenames
        Get the total count of car make years for a specific car make and model.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state (optional) The state of the car make
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarModelYearsCountByVehicleMakeAndModelNicenames(#makeNiceName: String, modelNiceName: String, state: STATE?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getCarModelYearsCountByVehicleMakeAndModelNicenames(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, view: view, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VEHICLE STYLE
    /**
        Get Style Details by ID
        Get vehicle style details by Edmunds vehicle style ID.
        
        :param: id Edmunds vehicle style ID
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStyleDetailsByID(#id: String, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStyleDetailsByID(id: id, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Details by Vehicle Make/Model/Year
        Get vehicle style details by vehicle make and model niceNames and year.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: state (optional) The state of the car make
        :param: category (optional) Vehicle category
        :param: view (optional) The response payload
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesDetailsByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: STATE?, category: CATEGORY?, view: VIEW?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesDetailsByVehicleMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, state: state, category: category, view: view, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make/Model/Year
        Get vehicle style count by vehicle make and model niceNames and year.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: year The four-digit year of interest
        :param: state (optional) The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, state: STATE?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCountByVehicleMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make and Model
        Get vehicle style count by vehicle make and model niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: modelNiceName Car model niceName
        :param: state (optional) The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMakeAndModel(#makeNiceName: String, modelNiceName: String, state: STATE?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getStylesCountByVehicleMakeAndModel(makeNiceName: makeNiceName, modelNiceName: modelNiceName, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get Styles Count by Vehicle Make
        Get vehicle style count by vehicle make niceNames.
        
        :param: makeNiceName Car make niceName (you get the niceName from the Get All Car Makes endpoint in the Vehicle Makes resource)
        :param: state (optional) The state of the car make
        :param: edmundResponse The response from Edmund API on completion
    */
    func getStylesCountByVehicleMake(#makeNiceName: String, state: STATE?, edmundResponse: EdmundResponse) -> Void {
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
        :param: category (optional) Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfOptionsByStyleID(#id: String, category: OPTIONS?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfOptionsByStyleID(id: id, category: category, edmundResponse: edmundResponse)
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
        :param: category (optional) Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfColorsByStyleID(#id: String, category: OPTIONS?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfColorsByStyleID(id: id, category: category, edmundResponse: edmundResponse)
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
    
    //MARK: SPEC: VEHICLE ENGINE & TRANSMISSION
    /**
        Get List of Engines by Style ID
        Get list of engines and their details for a specific Edmunds style ID.
        
        :param: id Edmunds vehicle style ID
        :param: availability (optional) Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfEnginesByStyleID(#id: String, availability: AVAILABILITY?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfEnginesByStyleID(id: id, availability: availability, edmundResponse: edmundResponse)
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
        :param: availability (optional) Option category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getListOfTransmissionsByStyleID(#id: String, availability: AVAILABILITY?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getListOfTransmissionsByStyleID(id: id, availability: availability, edmundResponse: edmundResponse)
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
    
    //MARK: SPEC: VEHICLE EQUIPMENT
    /**
        Get Equipment Details by Style ID
        Get list of equipment details for a specific style ID.
        
        :param: id Edmunds vehicle style ID
        :param: availability Equipment availability
        :param: equipmentType Equipment category
        :param: name (optional) Equipment category
        :param: edmundResponse The response from Edmund API on completion
    */
    func getEquipmentDetailsByStyleID(#id: String, availability: AVAILABILITY, equipmentType: EQUIPMENTTYPE, name: EQUIPMENTNAME?, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getEquipmentDetailsByStyleID(id: id, availability: availability, equipmentType: equipmentType, name: name, edmundResponse: edmundResponse)
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
    
    //MARK: SPEC: VEHICLE SQUISHVINS
    /**
        Get Vehicle Details by SquishVIN
        Get vehicle details for a squishVIN (basically the first 11 digits of the VIN minus the 9th digit which is a check digit).
        
        :param: id SquishVIN
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehicleDetailsBySquishVIN(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getVehicleDetailsBySquishVIN(id: id, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VEHICLE CONFIGURATION
    /**
        Get the default configured vehicle by zipcode and style ID
        Get vehicle style details by VIN
        
        :param: zip Zipcode
        :param: styleid Vehicle style id
        :param: edmundResponse The response from Edmund API on completion
    */
    func getDefaultConfiguredVehicleByZipcodeAndStyleID(#zip: String, styleid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getDefaultConfiguredVehicleByZipcodeAndStyleID(zip: zip, styleid: styleid, edmundResponse: edmundResponse)
    }
    
    /**
        Get the configured vehicle with options
        Get vehicle style details by VIN
        
        :param: zip Zipcode
        :param: styleid Vehicle style id
        :param: selected Vehicle Option ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getConfiguredVehicleWithOptions(#zip: String, styleid: String, selected: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getConfiguredVehicleWithOptions(zip: zip, styleid: styleid, selected: selected, edmundResponse: edmundResponse)
    }
    
    //MARK: SPEC: VIN DECODING
    /**
        Get Basic Vehicle Information by VIN (NEW CARS ONLY)
        Get vehicle make, model, year, type, fuel type, number of cylinders and list of styles by decoding the vehicle's VIN. Limited to: Non-Commercial vehicles for sale in the USA, built after 1990
        
        :param: vin NEW Vehicle VIN
        :param: edmundResponse The response from Edmund API on completion
    */
    func getBasicVehicleInformationByVIN(#vin: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getBasicVehicleInformationByVIN(vin: vin, edmundResponse: edmundResponse)
    }
    
    /**
        Get Full Vehicle Details by VIN
        Get all vehicle details from make, model, year and fuel type to list of options, features and standard equipment. All this information is returned by decoding the vehicle's VIN. Limited to: Non-Commercial vehicles for sale in the USA, built after 1990
        
        :param: vin Vehicle VIN
        :param: edmundResponse The response from Edmund API on completion
    */
    func getFullVehicleDetailsByVIN(#vin: String, edmundResponse: EdmundResponse) -> Void {
        vehicleSpecs.getFullVehicleDetailsByVIN(vin: vin, edmundResponse: edmundResponse)
    }
    
    //MARK: MEDIA: VEHICLE PHOTO
    /**
        Get by Vehicle Style ID
        Get vehicle photos by Edmunds vehicle style ID.
        
        :param: styleId Edmunds vehicle style ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehiclePhotoByVehicleStyleID(#styleId: String, edmundResponse: EdmundResponseMedia) -> Void {
        vehicleMedia.getVehiclePhotoByVehicleStyleID(styleId: styleId, edmundResponse: edmundResponse)
    }
    
    //MARK: PRICING: TRUE COST TO OWN (TCO)
    /**
        Calculate for New Vehicles
        Get the total 5-year True Cost to Own for a new vehicle.
        
        :param: styleId Edmunds vehicle style ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForNewVehicles(#styleId: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicles(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for Used Vehicles
        Get the total 5-year True Cost to Own for a used vehicle.
        
        :param: styleId Edmunds vehicle style ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForUsedVehicles(#styleId: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicles(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate Total Cash Price for New Vehicle
        The Total Cash Price displayed is the vehicle's True Market Value® price plus the Typically Equipped options, destination charge, base tax and fees assessed by your state, and, if applicable, gas guzzler tax; less any widely available manufacturer-to-customer cash rebates. (However, we do not account for other types of cash rebates or incentives because of the variability of those offers and their eligibility requirements.)
        
        :param: styleId Edmunds vehicle style ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateTotalCashPriceForNewVehicle(#styleId: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateTotalCashPriceForNewVehicle(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate Total Cash Price for Used Vehicle
        The Total Cash Price displayed is the vehicle's True Market Value® price plus the Typically Equipped options, destination charge, base tax and fees assessed by your state, and, if applicable, gas guzzler tax; less any widely available manufacturer-to-customer cash rebates. (However, we do not account for other types of cash rebates or incentives because of the variability of those offers and their eligibility requirements.)
        
        :param: styleId Edmunds vehicle style ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateTotalCashPriceForUsedVehicle(#styleId: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateTotalCashPriceForUsedVehicle(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Get Vehicle Makes with TCO Data
        Get a list of vehicle makes with availabe True Cost to Own data.
        
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehicleMakesWithTCOData(#edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getVehicleMakesWithTCOData(edmundResponse: edmundResponse)
    }
    
    /**
        Get Vehicle Models with TCO Data
        Get a list of vehicle models with availabe True Cost to Own data.
        
        :param: makeId The Car Make ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehicleModelsWithTCOData(#makeId: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getVehicleModelsWithTCOData(makeId: makeId, edmundResponse: edmundResponse)
    }
    
    /**
        Get Vehicle Styles with TCO Data
        Get a list of vehicle styles with available True Cost to Own data.
        
        :param: make Vehicle make niceName
        :param: model Vehicle model niceName
        :param: year Vehicle year (YYYY)
        :param: submodel Vehicle submodel
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehicleStylesWithTCOData(#make: String, model: String, year: String, submodel: CATEGORY, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getVehicleStylesWithTCOData(make: make, model: model, year: year, submodel: submodel, edmundResponse: edmundResponse)
    }
    
    /**
        Get TCO details for a New Car
        Get the 5-year breakdown values of all TCO categories for a New vehicle based on its specified style Id, zip code, and state code.
        
        :param: styleId Vehicle style ID
        :param: zip Five-digit zipcode
        :param: state US State Code (e.g. CA, NY, NJ, PA, ...etc)
        :param: edmundResponse The response from Edmund API on completion
    */
    func getTCODetailsForANewCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getTCODetailsForANewCar(styleId: styleId, zip: zip, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Get TCO details for a Used Car
        Get the 5-year breakdown values of all TCO categories for a Used vehicle based on its specified style Id, zip code, and state code.
        
        :param: styleId Vehicle style ID
        :param: zip Five-digit zipcode
        :param: state US State Code (e.g. CA, NY, NJ, PA, ...etc)
        :param: edmundResponse The response from Edmund API on completion
    */
    func getTCODetailsForAUsedCar(#styleId: String, zip: String, state: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getTCODetailsForAUsedCar(styleId: styleId, zip: zip, state: state, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for New Vehicle with Car Make/Year, MSRP and Zip Code
        
        :param: makeNiceName Vehicle Make niceName
        :param: year Vehicle model four-digit year
        :param: msrp Vehicle MSRP
        :param: zip Five-digit zipcode
        :param: color (optional) Vehicle color (i.e. black, white, blue, ..etc)
        :param: model (optional) Vehicle Model name
        :param: vehicleStyle (optional) Vehicle Style name
        :param: drivenWheels (optional) Vehicle drive type name
        :param: fuelType (optional) Name of the type of fuel the vehicle engine uses
        :param: cylinders (optional) The number of cylinders the vehicle engine has
        :param: compressorType (optional) The name of the aspiration of the vehicle engine
        :param: trim (optional) Vehicle trim name
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(#makeNiceName: String, year: String, msrp: String, zip: String, color: String?, model: String?, vehicleStyle: CATEGORY?, drivenWheels: DRIVENWHEELS?, fuelType: FUELTYPE?, cylinders: String?, compressorType: COMPRESSORTYPE?, trim: String?, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicleWithCarMakeYearMSRPAndZipcode(makeNiceName: makeNiceName, year: year, msrp: msrp, zip: zip, color: color, model: model, vehicleStyle: vehicleStyle, drivenWheels: drivenWheels, fuelType: fuelType, cylinders: cylinders, compressorType: compressorType, trim: trim,  edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for New Vehicle with Car VIN, MSRP, and Zipcode
        Get basic vehicle information and pricing by supplying the vehicle's VIN, MSRP price and the zipcode in which it's located.
        
        :param: vin Vehicle VIN
        :param: zip Five-digit zipcode
        :param: msrp Vehicle MSRP
        :param: color Vehicle color (i.e. black, white, blue, ...etc)
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForNewVehicleWithCarVINMSRPAndZipcode(#vin: String, zip: String, msrp: String, color: COLOR, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicleWithCarVINMSRPAndZipcode(vin: vin, zip: zip, msrp: msrp, color: color, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for New Vehicle with Car Style ID and Zipcode
        
        :param: styleId Vehicle style id
        :param: zip Five-digit zipcode
        :param: colorId (optional) Vehicle color ID (&colorid=xxx&colorid=xxx&colorid=xxx for multiples)
        :param: optionId (optional) Vehicle option ID (&optionid=xxx&optionid=xxx&optionid=xxx for multiples)
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForNewVehicleWithCarStyleIdAndZipcode(#styleId: String, zip: String, colorId: String?, optionId: String?, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicleWithCarStyleIdAndZipcode(styleId: styleId, zip: zip, colorId: colorId, optionId: optionId, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for New Vehicle with Car Style ID, Condition, Mileage, and Zipcode
        
        :param: styleId Vehicle style id
        :param: condition Vehicle condition
        :param: mileage Vehicle milage (e.g. 24000)
        :param: zip Five-digit zipcode
        :param: colorId (optional) Vehicle color ID (&colorid=xxx&colorid=xxx&colorid=xxx for multiples)
        :param: optionId (optional) Vehicle option ID (&optionid=xxx&optionid=xxx&optionid=xxx for multiples)
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForNewVehicleWithCarStyleIdConditionMileageAndZipcode(#styleId: String, condition: CONDITION, mileage: String, zip: String, colorId: String?, optionId: String?, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForNewVehicleWithCarStyleIdConditionMileageAndZipcode(styleId: styleId, condition: condition, mileage: mileage, zip: zip, colorId: colorId, optionId: optionId, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for the Typically Equipped Vehicle
        
        :param: styleId Vehicle style id
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForTheTypicallyEquippedVehicle(#styleId: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.calculateForTheTypicallyEquippedVehicle(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Calculate for the Certified Vehicle
        
        :param: styleId Vehicle style id
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func calculateForTheCertifiedVehicle(#styleId: String, zip: String, edmundResponse: EdmundResponseString) -> Void {
        vehiclePricing.calculateForTheCertifiedVehicle(styleId: styleId, zip: zip, edmundResponse: edmundResponse)
    }
    
    //MARK: PRICING: INCENTIVES AND REBATES
    /**
        Get Incentives and Rebates by ID
        Get incentives and rebates by ID.
        
        :param: id Incentive ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByID(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByID(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Make ID
        Get incentives and rebates by vehicle make ID.
        
        :param: makeid Vehicle make ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleMakeID(#makeid: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleMakeID(makeid: makeid, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Style ID
        Get incentives and rebates by vehicle style ID.
        
        :param: styleid Vehicle style ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleStyleID(#styleid: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleStyleID(styleid: styleid, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Category and Zipcode
        Get incentives and rebates by vehicle category and zipcode.
        
        :param: category Vehicle category
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleCategoryAndZipcode(#category: CATEGORY, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleCategoryAndZipcode(category: category, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Make ID and Zipcode
        Get incentives and rebates by vehicle make ID and zipcode.
        
        :param: makeid Vehicle make ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleMakeIdAndZipcode(#makeid: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleMakeIdAndZipcode(makeid: makeid, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Model Year ID and Zipcode
        Get incentives and rebates by vehicle model year ID and zipcode.
        
        :param: modelyearid Vehicle model year ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleModelYearIdAndZipcode(#modelyearid: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleModelYearIdAndZipcode(modelyearid: modelyearid, zip: zip, edmundResponse: edmundResponse)
    }
    
    /**
        Get Incentives and Rebates by Vehicle Style ID and Zipcode
        Get incentives and rebates by vehicle style ID and zipcode.
        
        :param: styleid Vehicle style ID
        :param: zip Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func getIncentivesAndRebatesByVehicleStyleIdAndZipcode(#styleid: String, zip: String, edmundResponse: EdmundResponse) -> Void {
        vehiclePricing.getIncentivesAndRebatesByVehicleStyleIdAndZipcode(styleid: styleid, zip: zip, edmundResponse: edmundResponse)
    }
    
    //MARK: CONTENT: EDMUNDS CAR RAITINGS
    /**
        Get Car Ratings by Make/Model/Year
        Get vehicle ratings grade by make/model/year, on select 2013 and newer vehicles.
        
        :param: makeNiceName Vehicle make niceName
        :param: modelNiceName Vehicle model niceName
        :param: year Vehicle four-digit year
        :param: submodel Vehicle submodel (i.e. sedan, suv, ...etc)
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarRatingsByMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, submodel: CATEGORY, edmundResponse: EdmundResponse) -> Void {
        vehicleContent.getCarRatingsByMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, submodel: submodel, edmundResponse: edmundResponse)
    }
    
    /**
        Get Car Ratings by Vehicle Style ID
        Get vehicle ratings grade by style ID, on select 2013 and newer vehicles.
        
        :param: styleid Vehicle style ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getCarRatingsByVehicleStyleId(#styleid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleContent.getCarRatingsByVehicleStyleId(styleid: styleid, edmundResponse: edmundResponse)
    }
    
    /**
        Get Consumer Ratings and Reviews by Car Make/Model/Year
        Get vehicle ratings and reviews by providing vehicle make/model/year data.
        
        :param: makeNiceName Vehicle make niceName
        :param: modelNiceName Vehicle model niceName
        :param: year Vehicle four-digit year
        :param: sortby Sort the reviews by any string of the format field or field:direction, where field = created, thumbsUp, or avgRating and direction = ASC (ascending) or DESC (descending). Default: created:DESC
        :param: pagenum The page number of the paginated result. Default: 1
        :param: pagesize The maximum number of returned reviews. Default: 10
        :param: edmundResponse The response from Edmund API on completion
    */
    func getConsumerRatingsAndReviewsByCarMakeModelYear(#makeNiceName: String, modelNiceName: String, year: String, sortby: String, pagenum: String, pagesize: String, edmundResponse: EdmundResponse) -> Void {
        vehicleContent.getConsumerRatingsAndReviewsByCarMakeModelYear(makeNiceName: makeNiceName, modelNiceName: modelNiceName, year: year, sortby: sortby, pagenum: pagenum, pagesize: pagesize, edmundResponse: edmundResponse)
    }
    
    /**
        Get Consumer Ratings and Reviews by Car Style ID
        Get vehicle ratings and reviews by providing vehicle make/model/year data.
        
        :param: styleid Vehicle style ID
        :param: sortby Sort the reviews by any string of the format field or field:direction, where field = created, thumbsUp, or avgRating and direction = ASC (ascending) or DESC (descending). Default: created:DESC
        :param: pagenum The page number of the paginated result. Default: 1
        :param: pagesize The maximum number of returned reviews. Default: 10
        :param: edmundResponse The response from Edmund API on completion
    */
    func getConsumerRatingsAndReviewsByCarStyleId(#styleid: String, sortby: String, pagenum: String, pagesize: String, edmundResponse: EdmundResponse) -> Void {
        vehicleContent.getConsumerRatingsAndReviewsByCarStyleId(styleid: styleid, sortby: sortby, pagenum: pagenum, pagesize: pagesize, edmundResponse: edmundResponse)
    }
    
    //MARK: SERVICE: VEHICLE MAINTENANCE
    /**
        Get Maintenance Schedule by ID
        Get a specific maintenance schedule by ID.
        
        :param: id Vehicle maintenance action ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getMaintenanceScheduleById(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getMaintenanceScheduleById(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get by Vehicle Model Year ID
        Get a specific maintenance schedule for a certain vehicle model year ID.
        
        :param: modelyearid Vehicle model year ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getMaintenanceScheduleByModelYearId(#modelyearid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getMaintenanceScheduleByModelYearId(modelyearid: modelyearid, edmundResponse: edmundResponse)
    }
    
    /**
        Get Vehicle Model Years with Maintenance Schedules
        Get a list of all vehicle model years with a maintenance schedule.
        
        :param: edmundResponse The response from Edmund API on completion
    */
    func getVehicleModelYearsWithMaintenanceSchedules(#edmundResponse: EdmundResponse) -> Void {
        vehicleService.getVehicleModelYearsWithMaintenanceSchedules(edmundResponse: edmundResponse)
    }
    
    //MARK: SERVICE: VEHICLE RECALLS
    /**
        Get Recall by ID
        Get a specific vehicle recall by ID.
        
        :param: id Vehicle recall ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getRecallById(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getRecallById(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get Recall by Vehicle Model Year ID
        Get a specific vehicle recall for a certain vehicle model year ID.
        
        :param: modelyearid Vehicle modelyear ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getRecallByVehicleModelYearId(#modelyearid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getRecallByVehicleModelYearId(modelyearid: modelyearid, edmundResponse: edmundResponse)
    }
    
    //MARK: SERVICE: VEHICLE SERVICE BULLETIN
    /**
        Get Service Bulletin by ID
        Get a specific vehicle service bulletin by ID.
        
        :param: id Vehicle service bulletin ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getServiceBulletinById(#id: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getServiceBulletinById(id: id, edmundResponse: edmundResponse)
    }
    
    /**
        Get Service Bulletin by Vehicle Model Year ID
        Get a specific vehicle service bulletin by model year ID.
        
        :param: modelyearid Vehicle model year ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getServiceBulletinByVehicleModelYearId(#modelyearid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getServiceBulletinByVehicleModelYearId(modelyearid: modelyearid, edmundResponse: edmundResponse)
    }
    
    //MARK: SERVICE: VEHICLE NOTES
    /**
        Get Notes by Vehicle Style ID
        Get maintenance notes for a specific vehicle.
        
        :param: styleid Vehicle style ID
        :param: edmundResponse The response from Edmund API on completion
    */
    func getNotesByVehicleStyleId(#styleid: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getNotesByVehicleStyleId(styleid: styleid, edmundResponse: edmundResponse)
    }
    
    //MARK: SERVICE: LOCAL LABOR RATE
    /**
        Get Local Labor Rate by Zipcode
        Get service labor rates in dollars per hour for a zipcode.
        
        :param: zipcode Five-digit zipcode
        :param: edmundResponse The response from Edmund API on completion
    */
    func getLocalLaborRatesByZipcode(#zipcode: String, edmundResponse: EdmundResponse) -> Void {
        vehicleService.getLocalLaborRatesByZipcode(zipcode: zipcode, edmundResponse: edmundResponse)
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
        Get Result
        
        :param: data The JSON data
        :param: error The download error message
        :param: dataResponse The response from Edmund API on completion
    */
    func getResult(#data: NSData?, error: NSError?, edmundResponse: EdmundResponse) {
        if let err = error {
            edmundResponse(nil, err)
        }
        else {
            let dictionary = parseJSON(data!)
            edmundResponse(dictionary, nil)
        }
    }
    
    /**
        Get Result Media
        
        :param: data The JSON data
        :param: error The download error message
        :param: dataResponse The response from Edmund API on completion
    */
    func getResult(#data: NSData?, error: NSError?, edmundResponse: EdmundResponseMedia) {
        if let err = error {
            edmundResponse(nil, err)
        }
        else {
            let array = parseJSONArray(data!)
            edmundResponse(array, nil)
        }
    }
    
    /**
        Get Result
        
        :param: data The JSON data
        :param: error The download error message
        :param: dataResponse The response from Edmund API on completion
    */
    func getResult(#data: NSData?, error: NSError?, edmundResponse: EdmundResponseString) {
        if let err = error {
            edmundResponse(nil, err)
        }
        else {
            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            edmundResponse(str, nil)
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
    
    /**
        Parse JSON data Media
        
        :param: data The NSData to be parsed
        :return: array The JSON array
    */
    func parseJSONArray(data: NSData) -> NSArray {
        //var err: NSError
        let array: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
        return array
    }
    
    //MARK: ENUMS
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
    
    enum OPTIONS: String {
        case kINTERIOR = "Interior"
        case kEXTERIOR = "Exterior"
        case kROOF = "Roof"
        case kINTERIORTRIM = "Interior+Trim"
        case kMECHANICAL = "Mechanical"
        case kPACKAGE = "Package"
        case kADDITIONALFEES = "Additional+Fees"
        case kOTHER = "Other"
    }
    
    enum AVAILABILITY: String {
        case kSTANDARD = "standard"
        case kOPTIONAL = "optional"
    }
    
    enum EQUIPMENTTYPE: String {
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
    
    enum EQUIPMENTNAME: String {
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
    
    enum DRIVENWHEELS: String {
        case kALLWHEELDRIVE = "all-wheel-drive"
        case kFRONTWHEELDRIVE = "front-wheel-drive"
        case kREARWHEELDRIVE = "rear-wheel-drive"
        case kFOURWHEELDRIVE = "four-wheel-drive"
    }
    
    enum FUELTYPE: String {
        case kELECTRIC = "electric"
        case kNATURALGASCNG = "natural-gas-cng"
        case kGAS = "gas"
        case kFLEXFUELFFV = "flex-fuel-ffv"
        case kDIESEL = "diesel"
        case kHYBRID = "hybrid"
    }
    
    enum COMPRESSORTYPE: String {
        case kSUPERCHARGER = "supercharger"
        case kTWINTURBOCHARGER = "twin-turbocharger"
        case kTURBOCHARGER = "turbocharger"
    }
    
    enum COLOR: String {
        case kBLACK = "black"
        case kDARKBLUE = "dark-blue"
        case kDARKBROWN = "dark-brown"
        case kDARKGREEN = "dark-green"
        case kDARKRED = "dark-red"
        case kGOLD = "gold"
        case kGRAY = "gray"
        case kLIGHTBLUE = "light-blue"
        case kLIGHTBROWN = "light-brown"
        case kLIGHTGREEN = "light-green"
        case kOFFWHITECREAM = "off-whitecream"
        case kORANGE = "orange"
        case kOTHER = "other"
        case kPURPLE = "purple"
        case kRED = "red"
        case kSILVER = "silver"
        case kWHITE = "white"
        case kYELLOW = "yellow"
    }
    
    enum CONDITION: String {
        case kOUTSTANDING = "Outstanding"
        case kCLEAN = "Clean"
        case kAVERAGE = "Average"
        case kROUGH = "Rough"
        case kDAMAGED = "Damaged"
    }
}