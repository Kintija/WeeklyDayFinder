//
//  ViewController.swift
//  WeeklyDayFinder
//
//  Created by kintija.avena on 24/08/2020.
//  Copyright © 2020 Kintija Avena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthsTextFiled: UITextField!
    @IBOutlet weak var yearTextFiled: UIStackView!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dayTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func handleCalculation(){
        
        let calendar = Calendar.current
        
        var dateComponent = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthsTextFiled.text!), let year = Int(yearTextFiled.text!)
            else{
                //print("textField err")
                warningPopup(withTitle: "Input Error", withMessage: "Date text field can't be empty.")
        return
        }
        dateComponent.day = Int(dayTextField.text!)
        dateComponent.month = Int(monthsTextFiled.text!)
        dateComponent.year = Int(yearTextFiled.text!)
        
        guard let date = calendar.date(from: dateComponent) else {
            print("calendar.date err")
            return
            
        }
        
        let dateFormatter = DateFormatter()
        DateFormatter().locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text{
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12{
                
      
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        resultLabel.text = capitalizedWeekday
            }else{
                warningPopup(withTitle: "Wrong date!", withMessage: "Please enter correct date")
            }
    
              default:
                findButton.setTitle("Find", for: .normal)
        clearTextField()
        }
    }
    
    func clearTextField(){
        dayTextField.text = ""
        monthsTextFiled.text = ""
        yearTextFiled.text = ""
        resultLabel.text = "Find a weekday"
    }
              
    func warningPopup(withTitle title: String?, withMessage message: String?){
        DispatchQueue.main.async{
        let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popUP.addAction(okButton)
        
        self.present(popUP, animated: true, completion: nil)
        }
    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        handleCalculation()


            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            //Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController
            //Pass the selected object to the new View Controller.
            vc.infoText = "DayFinder helps you to find \nyour value for given date."
            
    }
    }
}
