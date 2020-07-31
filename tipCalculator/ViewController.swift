//
//  ViewController.swift
//  tipCalculator
//
//  Created by Natisha Khadgi on 7/20/20.
//  Copyright © 2020 Natisha Khadgi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Names of the objects created
    @IBOutlet weak var splitControl: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        //If not valid input, replace with 0
        let bill = Double(billField.text!) ?? 0
        
        //Calculate split, tip, & total
        let splitDisplay = splitControl.value
        let tipDisplay = Double(tipControl.value) * 100
        let tip = bill * Double(tipControl.value)
        let total = (bill + tip)/splitDisplay
        
        //Update split, tip, & total labels
        splitLabel.text = String(format: "Split: %.0f", splitDisplay)
        tipPercentage.text=String(format: "%.0f%% Tip", tipDisplay)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

