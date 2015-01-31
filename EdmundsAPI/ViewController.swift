//
//  ViewController.swift
//  EdmundsAPI
//
//  Created by Talia DeVault on 1/28/15.
//  Copyright (c) 2015 Frames Per Sound. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Example usage
        let manager = EdmundsAPIManager()
        manager.getAllCarMakes(state: EdmundsAPIManager.STATE.kNEW, year: "2013", view: EdmundsAPIManager.VIEW.kBASIC) { (dictionary: NSDictionary?, error: NSError?) -> Void in
            if let e = error {
                println(e)
            }
            else {
                println(dictionary)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

