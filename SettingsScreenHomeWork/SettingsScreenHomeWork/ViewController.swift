//
//  ViewController.swift
//  SettingsScreenHomeWork
//
//  Created by Эмиль Шалаумов on 24.10.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textView = UITextView()
    let acceptButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("ACCEPT CHANGES", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(acceptBtnTapped), for: .touchUpInside)
        return button
    }()
    
    var cellSection: Int?
    var cellRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        navigationController?.navigationBar.prefersLargeTitles = false
        
        textView.frame = CGRect(x: 10, y: 75, width: view.frame.width - 20, height: 200)
        if let section = cellSection, let row = cellRow {
            textView.text = CellStore.cells[section][row].text
        }
        
        acceptButton.frame = CGRect(x: 10, y: 285, width: view.frame.width - 20, height: 40)
        
        view.addSubview(textView)
        view.addSubview(acceptButton)
    }
    
    @objc func acceptBtnTapped() {
        if let section = cellSection, let row = cellRow {
            CellStore.cells[section][row].text = textView.text
        }
        self.navigationController?.popViewController(animated: true)
    }


}

class CellStore {
    static var cells = [
        [
            CellStore(image: UIImage(named: "Person"), text: "Sign in to your iPhone")
        ],
        [],
        [
            CellStore(image: UIImage(named: "General"), text: "General"),
            CellStore(image: UIImage(named: "Privacy"), text: "Privacy")
        ],
        [
            CellStore(image: UIImage(named: "PasswordsAndAccounts"), text: "Passwords & Accounts")
        ],
        [
            CellStore(image: UIImage(named: "Maps"), text: "Maps"),
            CellStore(image: UIImage(named: "Safari"), text: "Safari"),
            CellStore(image: UIImage(named: "News"), text: "News"),
            CellStore(image: UIImage(named: "Siri"), text: "Siri"),
            CellStore(image: UIImage(named: "Photos"), text: "Photos"),
            CellStore(image: UIImage(named: "GroupCenter"), text: "Game Center")
        ]
    ]
    
    let image: UIImage?
    var text: String
    
    init(image: UIImage?, text: String) {
        self.image = image
        self.text = text
    }
}

