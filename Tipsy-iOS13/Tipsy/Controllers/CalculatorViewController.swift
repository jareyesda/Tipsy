//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tipPercent: Float = 0.1
    var totalPerPerson: Float?
    var billPerPerson: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.titleLabel?.text == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPercent = 0.0
        } else if sender.titleLabel?.text == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipPercent = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPercent = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0.00f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let safeBillTextField = billTextField.text {
            let billToCalculate: String = safeBillTextField
            let splitNumber = Float(splitNumberLabel.text ?? "2.0")!
            
            totalPerPerson = ((Float(billToCalculate) ?? 0.0) * tipPercent) + (Float(billToCalculate) ?? 0.0)
            billPerPerson = totalPerPerson! / splitNumber
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billPerPerson = billPerPerson
            destinationVC.numberSplit = splitNumberLabel.text
            destinationVC.percentTip = tipPercent
        }
    }
}
