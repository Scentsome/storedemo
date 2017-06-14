//
//  ViewController.swift
//  MyList
//
//  Created by Michael on 14/06/2017.
//  Copyright © 2017 Zencher. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlPath = "https://jsonplaceholder.typicode.com/albums"
        Alamofire.request(urlPath).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

