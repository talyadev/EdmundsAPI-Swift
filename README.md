# EdmundsAPI-Swift
Swift wrapper for the Edmunds Vehicle API

Instructions:
1. Copy EdmundsAPI folder to your project.
2. Update API key on line 14 of EdmundsAPIManager.swift

Example usage:
let manager = EdmundsAPIManager()
manager.getAllCarMakes(state: EdmundsAPIManager.STATE.kNEW, year: "2013", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, error: NSError?) -> Void in
        if let e = error { println(e) }
        else { println(dictionary) }
    }