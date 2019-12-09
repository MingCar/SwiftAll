//
//  MZUIViewController.swift
//  SwiftAll
//
//  Created by 车明明 on 2019/5/21.
//  Copyright © 2019年 Ming. All rights reserved.
//

import UIKit

class MZUIViewController: MZBaseViewController ,UITextFieldDelegate {

    var textfield : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white;
        self.addLabel();
        self.addButton();
        self.addSlider()
        self.addTextField()

    }

    deinit {
        print("\(NSStringFromClass(MZUIViewController.self))  dealloc")
    }
    
    // label
    func addLabel(){
        let lbContent = UILabel.init(frame: CGRect(x: 50, y: 100, width: 200, height: 40) );
        lbContent.text = "😂  \n 测试文本内容";
        lbContent.numberOfLines = 0;
        lbContent.backgroundColor = UIColor.green;
        lbContent.textColor = UIColor.orange;
        if #available(iOS 8.2, *) {
            lbContent.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        } else {
            // Fallback on earlier versions
            lbContent.font = UIFont.boldSystemFont(ofSize: 14);
        };
        self.view.addSubview(lbContent);
    }

    // buton
    func addButton () {

        let button = UIButton.init(type: .custom);
        button.frame = CGRect(x: 50, y: 150, width: 200, height: 40);
        button.setTitleColor(UIColor.yellow, for: .highlighted);
        button.setTitleColor(UIColor.black, for: .normal);
        button.setTitle("button", for: .normal);
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        self.view.addSubview(button);
    }

    @objc func buttonAction(button:UIButton) {
        button.setTitle("已点击", for: .normal)
        print("点击button");
    }
    // slider
    func addSlider() {

        let slider = UISlider.init(frame: CGRect(x: 50, y: 190, width: 200, height: 20))
        slider.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged);
        slider.maximumValue = 1;
        slider.minimumValue = 0;
        self.view.addSubview(slider);
    }

    @objc func sliderValueChanged(slider:UISlider) {
        print("slider == \(slider.value)");
    }

    // 输入框
    func addTextField(){
        self.textfield = UITextField.init(frame: CGRect(x: 50, y: 230, width: 300, height: 40));
        self.textfield.delegate = self;
        self.textfield.backgroundColor = UIColor.orange;
        self.view.addSubview(self.textfield);
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(self.tapViewAction));
        self.view.addGestureRecognizer(tap);
    }

    @objc func tapViewAction (){

        if self.textfield.isFirstResponder {
            self.textfield.resignFirstResponder();
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("开始编辑");
    }


}
