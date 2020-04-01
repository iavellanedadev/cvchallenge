//
//  EditViewController.swift
//  CVChallenge
//
//  Created by Consultant on 3/27/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var summarTextView: UITextView!
    @IBOutlet weak var topicsTextView: UITextView!
    @IBOutlet weak var companyWorkTextField: UITextField!
    @IBOutlet weak var datesWorkTextField: UITextField!
    @IBOutlet weak var responsibilitiesWorkTextView: UITextView!
    
    var vm: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadFields()
    }
    @IBAction func submitEditButtonTouch(_ sender: UIButton) {
        
        print("Submitting")
        
        summarTextView.text = vm.resume?.summary
        topicsTextView.text = vm.resume?.topicsOfKnowledge
        
        companyWorkTextField.text = vm.resume?.pastExperience[0].companyName
        
        datesWorkTextField.text = vm.resume?.pastExperience[0].dateFromTo
        
        guard let responsibilities = vm.resume?.pastExperience[0].mainResponsibilities else {return}
        
        for responsibility in responsibilities
        {

            responsibilitiesWorkTextView.text = responsibilitiesWorkTextView.text + responsibility + "\n"
            
        }
        vm.sendResume()
    }
    
    func loadFields()
    {
        summarTextView.text = vm.resume?.summary
        topicsTextView.text = vm.resume?.topicsOfKnowledge
        
        companyWorkTextField.text = vm.resume?.pastExperience[0].companyName
        
        datesWorkTextField.text = vm.resume?.pastExperience[0].dateFromTo
        
        guard let responsibilities = vm.resume?.pastExperience[0].mainResponsibilities else {return}
        
        for responsibility in responsibilities
        {

            responsibilitiesWorkTextView.text = responsibilitiesWorkTextView.text + responsibility + "\n"
            
        }
       
    }

}
