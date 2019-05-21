//
//  MZTableViewController.swift
//  SwiftAll
//
//  Created by 车明明 on 2019/5/21.
//  Copyright © 2019年 Ming. All rights reserved.
//

import UIKit
import Alamofire

class MZTableViewController: MZBaseViewController {

    var newsTab: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;

        self.getData();

    }
    
    //  拉取网络数据
    func getData()  {

        let urlString  = "https://api.apiopen.top/getSongPoetry?page=1&count=20";

        Alamofire.request(urlString).response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
                let lab =  UILabel.init(frame: CGRect(x: 50, y: 100, width: 300, height: 300));
                lab.text = utf8Text;



                if let dataUU =  utf8Text.data(using: String.Encoding.utf8){

//                    JSONSerialization.jsonObject(with: "", options: .mutableContainers);

                }


                self.view.addSubview(lab);
            }
        }

    }

}
