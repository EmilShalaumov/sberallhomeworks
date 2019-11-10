//
//  RootViewController.swift
//  NavControllerHomeWork
//
//  Created by Эмиль Шалаумов on 19.10.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UINavigationControllerDelegate {
    
    let viewController = ViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.delegate = self
        
        self.view.backgroundColor = .lightGray
        view.addSubview(createButton())
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Next VC", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        button.frame = CGRect(x: self.view.frame.midX - 50, y: self.view.frame.midY - 20, width: 100, height: 40)
        
        return button
    }
    
    @objc func buttonTapped() {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print(viewController)
    }
}
