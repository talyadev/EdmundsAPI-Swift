//
//  VehicleService.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/31/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import Foundation

class VehicleService {
    
    let manager: EdmundsAPIManager!
    
    init(manager: EdmundsAPIManager) {
        self.manager = manager
    }

    //MARK: SERVICE: VEHICLE MAINTENANCE
    func getMaintenanceScheduleById(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/action/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getMaintenanceScheduleByModelYearId(#modelyearid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/actionrepository/findbymodelyearid?modelyearid=\(modelyearid)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getVehicleModelYearsWithMaintenanceSchedules(#edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/actionrepository/findmodelyearidswithmaintenanceschedule?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SERVICE: VEHICLE RECALLS
    func getRecallById(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/recall/\(id)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getRecallByVehicleModelYearId(#modelyearid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/recallrepository/findbymodelyearid?modelyearid=\(modelyearid)&fmt=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SERVICE: VEHICLE SERVICE BULLETIN
    func getServiceBulletinById(#id: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/servicebulletin/271056?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    func getServiceBulletinByVehicleModelYearId(#modelyearid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/servicebulletinrepository/findbymodelyearid?modelyearid=\(modelyearid)&fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SERVICE: VEHICLE NOTES
    func getNotesByVehicleStyleId(#styleid: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/stylesnotes/\(styleid)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
    
    //MARK: SERVICE: LOCAL LABOR RATES
    func getLocalLaborRatesByZipcode(#zipcode: String, edmundResponse: EdmundsAPIManager.EdmundResponse) -> Void {
        let URLString = "https://api.edmunds.com/v1/api/maintenance/ziplaborrate/\(zipcode)?fmt=json&api_key=\(manager.kAPIKEY)"
        manager.getJSON(URLString, dataResponse: { (data: NSData?, error: NSError?) -> Void in
            self.manager.getResult(data: data, error: error, edmundResponse: edmundResponse)
        })
    }
}