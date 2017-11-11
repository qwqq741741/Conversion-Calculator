//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Wentao Song on 2017/11/10.
//  Copyright © 2017年 Wentao Song. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    var numbers: String  = ""
    var choice: Int = 1
    
    @IBAction func numbers(_ sender: UIButton) {
        
        outputDisplay.textAlignment = .right
        inputDisplay.textAlignment = .right
        
        numbers = numbers + String(sender.tag-1)
        inputDisplay.text = numbers
        print(numbers)
        
        switch choice {
        case 1:
            self.outputDisplay.text = self.fToC(numbers)
        case 2:
            self.outputDisplay.text = self.cToF(numbers)
        case 3:
            self.outputDisplay.text = self.kTom(numbers)
        case 4:
            self.outputDisplay.text = self.mTok(numbers)
        default:
            self.outputDisplay.text = "default"
        }
    }
    

        
    
    
    var checkif = 0
    
    @IBAction func dot(_ sender: UIButton) {
        if (checkif == 0){
            numbers = numbers + "."
            inputDisplay.text=numbers
            
            checkif=1
        }
    }
    
    
    @IBAction func convert(_ sender: AnyObject) {
        let alert = UIAlertController(title:"choose a converter",message:nil,preferredStyle:UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title:"fahrenheit to celcius",style:UIAlertActionStyle.default,handler:{(alertAction) -> Void in
            self.inputDisplay.text = "°F"
            self.outputDisplay.text = "°C"
            self.choice = 1
            self.inputDisplay.text = self.numbers
            if(self.numbers != ""){
                self.outputDisplay.text = self.fToC(self.numbers)
            }
        }))
        
        alert.addAction(UIAlertAction(title:"celcius to fahrenheit",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputDisplay.text = "°C"
            self.outputDisplay.text = "°F"
            self.choice = 2
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.cToF(self.numbers)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title:"miles to kilometers",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputDisplay.text = "mi"
            self.outputDisplay.text = "km"
            self.choice = 3
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.mTok(self.numbers)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title:"kilometers to miles",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.inputDisplay.text = "km"
            self.outputDisplay.text = "mi"
            self.choice = 4
            self.inputDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.outputDisplay.text = self.kTom(self.numbers)
            }
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func fToC(_ ferenheight: String) -> String {
        
        let new: Double = Double(ferenheight)!
        
        let total = (new - 32) * (5/9)
        
        return String(format: "%.2f", total )
        
    }
    
    func cToF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        
        let total = new * (9/5) + 32
        
        return String(format: "%.2f", total )
        
    }
    
    func kTom(_ kilometers: String) -> String {
        
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    func mTok(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        if (sender.tag == 11) {
            outputDisplay.text = nil
            inputDisplay.text = nil
            numbers=""
            checkif=0
        }
    }
    
    @IBAction func posOrNeg(_ sender: UIButton) {
        var lessZ : Double
        
        
        if (numbers == "")
        {
            return
        }
        if (numbers == ".")
        {
            return
        }
        if let test = Double(numbers),
            (test < 0)
        {
            lessZ = abs(test)
            numbers = String(lessZ)
            checkif=1
            
        }
        else {
            numbers = "-" + numbers
        }
        
        inputDisplay.text = numbers
        switch choice {
        case 1:
            self.outputDisplay.text = self.fToC(numbers)
        case 2:
            self.outputDisplay.text = self.cToF(numbers)
        case 3:
            self.outputDisplay.text = self.kTom(numbers)
        case 4:
            self.outputDisplay.text = self.mTok(numbers)
        default:
            self.outputDisplay.text = "default"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputDisplay.text="°F"
        self.outputDisplay.text="°C"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
