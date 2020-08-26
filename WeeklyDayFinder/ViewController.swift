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
    
    
    @IBOutlet weak var resultLabel: UIStackView!
    
    
    
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
        
        guard let day = dayTextField.text, let month = monthsTextFiled.text, let year = yearTextFiled.text
            else{
                print("textField err")
        return
            <#statements#>
        }
        //dateComponent.day = Int(dayTextField.text!)
        //dateComponent.month = Int(monthsTextFiled.text!)
        //dateComponent.year = Int(yearTextFiled.text!)
        
        guard let date = calendar.date(from: dateComponent) else {
            print("calendar.date err")
            return
            
        }
        
        let dateFormatter = DateFormatter()
        DateFormatter().locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        resultLabel.text = weekday
    }
    @IBAction func findWeekDayTapped(_ sender: Any) {
        handleCalculation()

}

}
