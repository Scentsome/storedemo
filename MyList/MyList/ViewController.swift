//
//  ViewController.swift
//  MyList
//
//  Created by Michael on 14/06/2017.
//  Copyright © 2017 Zencher. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var list:[String] = ["Michael","James", "Allen"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlPath = "https://jsonplaceholder.typicode.com/albums"
        Alamofire.request(urlPath).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
        
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListCell")
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

