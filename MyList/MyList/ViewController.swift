//
//  ViewController.swift
//  MyList
//
//  Created by Michael on 14/06/2017.
//  Copyright © 2017 Zencher. All rights reserved.
//

import UIKit
import Alamofire
struct Album {
    var id:Int
    var title:String
    var userId:Int
}
class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var list:[[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        let urlPath = "https://jsonplaceholder.typicode.com/albums"
        Alamofire.request(urlPath).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
                self.list = json as? [[String:Any]]
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list == nil {
            return 0
        }
        return list!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListCell")
        cell?.textLabel?.text = list?[indexPath.row]["title"] as? String
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

