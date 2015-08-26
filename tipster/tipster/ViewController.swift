//
//  ViewController.swift
//  tipster
//
//  Created by Michie Cao on 8/25/15.
//  Copyright (c) 2015 Michie Cao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var greenColor = UIColor(red: 23/255.0, green: 247/255.0, blue: 18/255.0, alpha: 1.0)
    var whiteColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.billField.alpha = 0
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated:Bool){
        super.viewDidAppear(animated)
        UIView.animateWithDuration(2.0, animations: {
            self.billField.alpha = 1.0
            
        // Slowly fade in field box
            
        })
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        billField.backgroundColor = greenColor
        billField.textColor = whiteColor
        
        // Bill field box background changes to green, text to white
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        println("tip: \(tip)")
        println("bill amount: \(billAmount)")
        println("bill field: \(billField.text)")
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
        billField.backgroundColor = whiteColor
        billField.textColor = greenColor
        
        // Bill field box background changes back to white, text to green

        
    }

}

