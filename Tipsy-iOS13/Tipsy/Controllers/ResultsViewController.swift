//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Juan Reyes on 3/31/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var billPerPerson: Float?
    var numberSplit: String?
    var percentTip: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", billPerPerson ?? "0.00")
        settingsLabel.text = "Split between \(numberSplit ?? "0") persons and a \(String((percentTip ?? 0.0) * 100))% percent tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
