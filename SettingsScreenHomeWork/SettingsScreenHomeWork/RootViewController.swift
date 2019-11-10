//
//  RootViewController.swift
//  SettingsScreenHomeWork
//
//  Created by Эмиль Шалаумов on 24.10.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        navigationItem.title = "Settings"
        
        tableView.frame = CGRect.init(origin: .zero, size: self.view.frame.size)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        tableView.frame = CGRect.init(origin: .zero, size: self.view.frame.size)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellStore.cells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellStore.cells[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            var cellImage = CellStore.cells[indexPath.section][indexPath.row].image
            if indexPath.section == 0 {
                cell = TableViewCell(style: .subtitle, reuseIdentifier: "TableViewCell")
                cell.detailTextLabel?.text = "Set up iCloud, the AppStore, and more."
                cell.textLabel?.textColor = UIColor.init(red: 0, green: 122/255, blue: 255/255, alpha: 1)
                cell.detailTextLabel?.textColor = .lightGray
                cellImage = cellImage?.resizeImage(targetSize: CGSize(width: 75, height: 75))
            } else {
                cellImage = cellImage?.resizeImage(targetSize: CGSize(width: 30, height: 30))
            }
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.numberOfLines = 0
            cell.imageView?.image = cellImage
            
            cell.textLabel?.text = CellStore.cells[indexPath.section][indexPath.row].text
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ViewController()
        viewController.cellSection = indexPath.section
        viewController.cellRow = indexPath.row
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.accessoryType = .none
        
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
