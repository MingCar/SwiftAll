//
//  MZAnimationViewController.swift
//  SwiftAll
//
//  Created by 车明明 on 2019/7/1.
//  Copyright © 2019年 Ming. All rights reserved.
//

import Foundation
import UIKit

class MZAnimationViewController : MZBaseViewController  {

    var  animationLayer : CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.animationLayer = CALayer.init();
        self.animationLayer.frame = CGRect(x: 100, y: 100, width: 80, height: 80);
        self.animationLayer.backgroundColor = UIColor.red.cgColor;
        self.view.layer.addSublayer(animationLayer)

        self.view.backgroundColor = UIColor.white
        let gets = UITapGestureRecognizer.init(target: self, action:#selector(self.addAnimationLayer) )
        self.view.addGestureRecognizer(gets)


    }

    func tapAction() {
        self.addAnimationLayer()
    }


    //  添加动画
    @objc func addAnimationLayer() {

        print("开始动画")
        let animation = CAKeyframeAnimation.init(keyPath: "alpha")
        animation.duration = 3.0;
        animation.values =  Array<Double>(arrayLiteral: 0.1,0.5,0.8)
        animationLayer.add(animation, forKey: "nil")

    }
}
