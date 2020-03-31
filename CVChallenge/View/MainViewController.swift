//
//  ViewController.swift
//  CVChallenge
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var menuLabel: UILabel!
    
    let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupScreen()
    }

    func setupScreen()
    {
        vm.getData()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTapped))
    }

    @objc func addTapped()
    {
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        menuVC.labelDelegate = self
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.vm = vm
        navigationController?.pushViewController(menuVC, animated: true)
    }
    
    @objc func editTapped()
    {
        let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        editVC.modalPresentationStyle = .overCurrentContext
        editVC.vm = vm
        navigationController?.pushViewController(editVC, animated: true)
        
        
    }
}

extension MainViewController: LabelDelegate
{
    func updateLabel(label: String) {
        print("Menu Item Selected: \(label)")
        
        var messaging: String = ""
        switch label{
        case "Summary":
            guard let resumesummary = vm.resume?.summary
            else {return }
            messaging = resumesummary
        case "Key Technologies":
            guard let keytechnologies = vm.resume?.topicsOfKnowledge else {return}
            messaging = keytechnologies
        default:
            guard let experience = vm.resume?.pastExperience else {return}
            if experience.count > 0
            {
                for val in experience
                {
                    messaging = messaging + "\n" + val.companyName + "(\(val.dateFromTo))" + "\n" + val.roleName + "\n"
                    for duties in val.mainResponsibilities
                    {
                        messaging = messaging + duties + "\n"
                    }
                }
            }
        }
        DispatchQueue.main.async {
            self.mainLabel.text = messaging
            self.menuLabel.text = label
        }
    }
}

