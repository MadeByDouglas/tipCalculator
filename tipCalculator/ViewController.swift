//
//  ViewController.swift
//  tipCalculator
//
//  Created by Douglas Hewitt on 3/4/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func isEditingBill(_ sender: UITextField) {
        updateLabels(text: sender.text)
    }
    
    @IBAction func didChangeTipPercentage(_ sender: UISegmentedControl) {
        updateLabels(text: billTextField.text)
    }
    
    func tipPercentageFromSegmentedControl(_ segment: UISegmentedControl) -> Double {
        let tipTitle = segment.titleForSegment(at: segment.selectedSegmentIndex)
        guard let tipTitleFiltered = tipTitle?.replacingOccurrences(of: "%", with: "") else {return 0}
        guard let tipValue = Double(tipTitleFiltered) else {return 0}
        let tipPercentage = tipValue * 0.01
        return tipPercentage
    }
    
    func updateLabels(text: String?) {
        guard let text = text else {return}

        let bill = Double(text) ?? 0
        let tipPercentage = tipPercentageFromSegmentedControl(tipPercentageSegmentedControl)
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

