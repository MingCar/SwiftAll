//
//  MZRootViewController.swift
//  SwiftAll
//
//  Created by Ming on 2017/6/20.
//  Copyright © 2017年 Ming. All rights reserved.
//

import UIKit

class MZRootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    var demoList:UITableView!
    
    var vcList : NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "mingzi"
        self.view.backgroundColor = UIColor.orange
        let button = UIButton(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        button.titleLabel?.text = "btn_title"
        button.addTarget(self, action: #selector(self.clickAction), for: .touchDown)
        self.view.addSubview(button)
        
        self.vcList = NSMutableArray.init(capacity: 5);
        
        self.vcList.add("MZBaseTypeController")
        self.vcList.add("MZFontViewController")
//        self.vcList.add("MZFontViewController")
        
        demoList = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        demoList.delegate = self
        demoList.dataSource = self
        demoList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(demoList)
    }

    
    func clickAction() {
        
        self.demoList.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vcList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let x  = self.vcList[indexPath.row];
        cell.textLabel?.text  = "My name is " + "\(x)";
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        var  next : UIViewController = UIViewController.init();
        if indexPath.row  == 0 {
            next = MZBaseTypeController();
            next.title = "基础数据类型";
            next.view.backgroundColor = UIColor.purple
        }
        
        if indexPath.row  == 1 {
            next = MZFontViewController( );
            next.view.backgroundColor = UIColor.blue
        }

        self.navigationController?.pushViewController(next, animated: true)
        
        
    }

}
