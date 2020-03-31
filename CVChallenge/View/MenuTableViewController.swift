//
//  MenuTableViewController.swift
//  CVChallenge
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

protocol LabelDelegate: class
{
    func updateLabel(label: String)
}

class MenuTableViewController: UITableViewController {
    
    weak var labelDelegate: LabelDelegate?
    
    @IBOutlet var menuTableView: UITableView!
    
    let menuItems: [String] = ["Summary", "Key Technologies", "Previous Jobs"]

    var vm: ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.mainLabel.text = menuItems[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        vm.menuItem = menuItems[indexPath.row]
        labelDelegate?.updateLabel(label:menuItems[indexPath.row])
       
        
        navigationController?.popToRootViewController(animated: true)

    }
}
