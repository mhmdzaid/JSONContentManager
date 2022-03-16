//
//  ViewController.swift
//  JSONContentManager
//
//  Created by mozead1996 on 03/16/2022.
//  Copyright (c) 2022 mozead1996. All rights reserved.
//

import UIKit
import JSONContentManager
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1st step : you declare instance of JSONContentManager and pass json file name to it. 
        let contentManager = JSONContentManager.init(JSONFile: "ExampleJSONFile")
        
        // 2nd pass the path for the value you want in the dictionary
        let contentValue = contentManager.stringValue(from: "Product.bill",
                                                     placeholders: ["12.35$","40,30$"])
        
        print(contentValue) // you paid 12.35$ of 40,30$.
        
        
        // also you can get any value
       print(contentManager.value(from: "Product.specs.height")) // Int 40
    }
}
