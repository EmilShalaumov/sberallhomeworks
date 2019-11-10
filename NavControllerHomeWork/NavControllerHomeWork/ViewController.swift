//
//  ViewController.swift
//  NavControllerHomeWork
//
//  Created by Эмиль Шалаумов on 19.10.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let animatedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("START ANIMATION", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .semibold)
        button.backgroundColor = .gray
        button.setTitleColor(.cyan, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan

        animatedButton.frame = CGRect(x: self.view.frame.midX - 100, y: self.view.frame.maxY - 100, width: 200, height: 60)
        view.addSubview(animatedButton)
    }
    
    @objc func buttonTapped() {
        let rememberedButtonCenter = animatedButton.center.y
        
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.red.cgColor
        colorAnimation.toValue = UIColor.blue.cgColor
        colorAnimation.duration = 0.5
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = 6
        colorAnimation.beginTime = 0
        
        let moveAnimation1 = CABasicAnimation(keyPath: "position")
        moveAnimation1.fromValue = [animatedButton.center.x, animatedButton.center.y]
        moveAnimation1.toValue = [animatedButton.center.x, 200]
        moveAnimation1.duration = 2
        moveAnimation1.beginTime = 0
        moveAnimation1.fillMode = .forwards;
        moveAnimation1.isRemovedOnCompletion = false
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = Double.pi
        rotationAnimation.duration = 1
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = 1
        rotationAnimation.beginTime = moveAnimation1.duration
        rotationAnimation.fillMode = .forwards;
        rotationAnimation.isRemovedOnCompletion = false
        
        let moveAnimation2 = CABasicAnimation(keyPath: "position")
        moveAnimation2.fromValue = [animatedButton.center.x, 200]
        moveAnimation2.toValue = [animatedButton.center.x, rememberedButtonCenter]
        moveAnimation2.duration = 2
        moveAnimation2.beginTime = rotationAnimation.beginTime + rotationAnimation.duration
        moveAnimation2.fillMode = .forwards;
        moveAnimation2.isRemovedOnCompletion = false
        
        let rotationAnimation2 = rotationAnimation.copy() as! CABasicAnimation
        rotationAnimation2.toValue = Double.pi * 2
        rotationAnimation2.beginTime = moveAnimation2.beginTime + moveAnimation2.duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [colorAnimation, moveAnimation1, rotationAnimation, moveAnimation2, rotationAnimation2]
        animationGroup.duration = rotationAnimation.duration * 10
        
        animatedButton.layer.add(animationGroup, forKey: "animationGroup")
    }
}

