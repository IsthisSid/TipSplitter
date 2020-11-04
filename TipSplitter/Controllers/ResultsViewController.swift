//
//  ResultsViewController.swift
//  TipSplitter
//
//  Created by Sidany Walker on 11/3/20.
//

import UIKit
//make sure that you identify the viewcontrollers in the Main.storyboard using identity inspector and select the correct class to link the assistant to the correct swift file. Click on Automatic in the Assistant and you also may have to close and reopen XCODE.
class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //once pressed it dismisses this ResultsViewController and you are back to the CalculatorViewController
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    In a storyboard-based application, you will often want to do a little preparation before navigation which this line of code below. You can see it is placed towards the bottom of the CalculatorViewController swift file :
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


