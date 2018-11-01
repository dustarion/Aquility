//
//  ViewController.swift
//  Aquility
//
//  Created by Dalton Ng on 28/10/18.
//  Copyright © 2018 Dalton Prescott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Ui Elements From Storyboard
    //userInputTextField
    //psiValue
    //psiLabel
    //psiDescription
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePSI (psi: 0)
        //psiDescription.numberOfLines = 0;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        //guard let psi = Int(userInputTextField.text!) else {return}
        //updatePSI(psi: psi)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        //guard let psi = Int(userInputTextField.text!) else {return true}
        //updatePSI(psi: psi)
        return true
    }
    
    
    func updatePSI (psi: Int) {
        
        // psiValue.text = String(psi)
        
        // Hazardous, 300 and above
        // HazardousBackground
        // Avoid Outdoor Activity
        if psi > 300 {
            //psiLabel.text = "HAZARDOUS"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "HazardousBackground")!)
            //psiDescription.text = "Avoid Outdoor activity"
        }
        
        // Very Unhealthy, 201 and above
        // VeryUnhealthyBackground
        // Minimise Outdoor Activity

        // Unhealthy, 101 and above
        // UnhealthyBackground
        // Reduce Prolonged Outdoor Activity
        
        // Moderate, 51 and above
        // ModerateBackground
        
        // Good, 0 to 51
        // GoodBackground
        
    }
    
}
