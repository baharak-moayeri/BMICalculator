//
//  ViewController.swift
//  BMICalculator
//
//  Created by Baharak on 10/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField! {
        didSet{
            weightTextField.addDoneCancelToolbar()
        }
    }
    
    @IBOutlet weak var heightTextField: UITextField! {
        didSet{
            heightTextField.addDoneCancelToolbar()
        }
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        //let weight = Double(weightTextField.text!)!
        
        /*
        var weight: Double = 0
        if weightTextField.text != nil{
            if Double(weightTextField.text!) != nil{
                weight = Double(weightTextField.text!)!
            }
        }
 */
        
        var weight: Double = 0;
        if let weightText = weightTextField.text {
            if let weightDouble = Double(weightText) {
                weight = weightDouble
            }
        }
    
        //let height = Double(heightTextField.text!)!
        
        var height: Double = 0;
        if let heightText = heightTextField.text {
            if let heightDouble = Double(heightText) {
                height = heightDouble
            }
        }
        
        let bmi = weight/(height*height)
        
        //print(bmi)
        
        //bmiLabel.text = String(bmi)
        
        //bmiLabel.text = String(format: "%.1f",bmi)
        
        var classification: String
        if bmi < 18.5{
            classification = "Underweight"
        }
        else if bmi < 24.9{
            classification = "Healthy weight"
        }
        else if bmi < 29.9{
            classification = "Overweight"
        }
        else{
            classification = "Obese"
        }
        let formattedBMI = String(format: "%.1f", bmi)
        bmiLabel.text = "BMI: \(formattedBMI), \(classification)"
    }
    
}


extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
