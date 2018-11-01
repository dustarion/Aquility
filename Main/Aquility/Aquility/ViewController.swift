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
    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var psiValue: UILabel!
    @IBOutlet weak var psiLabel: UILabel!
    @IBOutlet weak var psiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePSI (psi: 0)
        psiDescription.numberOfLines = 0;
        getPSI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        guard let psi = Int(userInputTextField.text!) else {return}
        updatePSI(psi: psi)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let psi = Int(userInputTextField.text!) else {return true}
        updatePSI(psi: psi)
        return true
    }
    
    
    func updatePSI (psi: Int) {
        
        psiValue.text = String(psi)
        
        // Hazardous
        if psi > 300 {
            psiLabel.text = "HAZARDOUS"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "HazardousBackground")!)
            psiDescription.text = "Avoid Outdoor activity"
        }
        
        // Very Unhealthy
        else if psi > 201 {
            psiLabel.text = "VERY UNHEALTHY"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "VeryUnhealthyBackground")!)
            psiDescription.text = "Minimise Outdoor Activity"
        }
        
        // Unhealthy
        else if psi > 101 {
            psiLabel.text = "UNHEALTHY"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "UnhealthyBackground")!)
            psiDescription.text = "Reduce Prolonged Outdoor Activity"
        }
        
        // Moderate
        else if psi > 51 {
            psiLabel.text = "MODERATE"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ModerateBackground")!)
            psiDescription.text = ""
        }
        
        // Good
        else {
            psiLabel.text = "GOOD"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "GoodBackground")!)
            psiDescription.text = ""
        }
        
    }
    
    func getPSI() {
        //https://api.data.gov.sg/v1/environment/psi
        
        let url = URL(string: "https://api.data.gov.sg/v1/environment/psi")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}
