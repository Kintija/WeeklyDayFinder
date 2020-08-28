//
//  AppearanceViewController.swift
//  WeeklyDayFinder
//
//  Created by kintija.avena on 27/08/2020.
//  Copyright © 2020 Kintija Avena. All rights reserved.
//

import UIKit

class AppearanceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setLabelText()
     
    }
    

    @IBAction func openSettingTapped(_ sender: Any) {
        
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString)
            else{
                return}
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
            print(success)
            }
        }
        
    }
    
    func setLabelText(){
        var text = "Unable to specify UI style"
    
        if self.traitCollection.userInterfaceStyle == .dark {
        
    text = "Dark mode is on. \nGo to settings if you would like \nto change to light mode."
        }else{
            text = "Light mode is on. \nGo to settings if you would like \nto change to dark mode."
        }
        textLabel.text = text
        
        
    }
    


extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}


}
