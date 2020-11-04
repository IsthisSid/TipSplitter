//
//  ViewController.swift
//  TipSplitter
//
//  Created by Sidany Walker on 11/3/20.
//

import UIKit

class CalculatorViewController: UIViewController {
    /*
    // MARK: Understanding Inheritance: the subclass 'CalculatorViewController will inherit the properties and methods from its superclass 'UIViewController'
    Classes like structures are a way of defining a blueprint. They are ways to plan out properties and methods and eventually when we run our app, be able to initialize our class into an actual object.
    Bottom line, when we create classes and inherit from other classes, we are saving ourselves from creating repeating bits of code and instead we are just layering functionality upon a superclass. You can see inheritance is used amongst the components that is a part of APPLE's UIKit i.e. UISlider, UILabel, UIButton, etc. Example of inheritance at the beginning: NSObject -> UIResponder -> UIView -> UIControl -> UIButton
    */
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    
    @IBOutlet weak var tenPercentButton: UIButton!
    
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    

// all three tip buttons should link to the same IBAction func tipChanged
    @IBAction func tipChanged(_ sender: UIButton) {
        //you can dismiss the keyboard by adding calling a method called 'endEditing(true)' on the textfield. Triggered when the user taps on the tip percentages.
        billTextField.endEditing(true)
        
        //You can have a property called 'isSelected' to make a button have a background and appear selected. When you tap on any of the tip buttons, it shows selected. Setting it to false deselects.
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        //calculating the tip changing from String(dropping the last element in that collection (the % sign)) to an integer which is a Double so that we may calculate it using tip = buttonTitleAsANumber / 100 ... i.e. 20% selected so tip = 20/100 = 0.2
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
    }
    //changes the text on the splitNumberLabel when using the stepper in the format of a string(number to 0 decimal places)
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        //since this is the button once calculate is pressed, we can performSegue since we linked the CalculatorViewController to the ResultsViewController with a segue identified as "goToResults" in the Main.storyboard
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    // Result, tip and split vars are properties described in that VC.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            //number in the format of a string to 2 decimal places, see calculation earlier from above
            
            destinationVC.tip = Int(tip * 100)
            // see calculation from above
            
            destinationVC.split = numberOfPeople
            // remember numberOfPeople = Int(sender.value)
        }
    }
    
}

