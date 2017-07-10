//
//  KeypadPlusController.swift
//  Calculator
//
//  Created by Kristina Del Rio Albrechet on 7/7/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

class KeypadPlusController: UIViewController {
    var onButtonTap: ((_ sender: UIButton)->())?
    
    @IBOutlet var keypadPlus: [UIButton]!
    
    @IBAction func buttonTap(_ sender: UIButton) {
        onButtonTap?(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: CHANGE_STYLE_COLOR, object: nil)
    }
    
    func changeTheme() {
        if UserDefaults.standard.value(forKey: "themeSwitcher") as! Bool {
            for but in keypadPlus {
                but.backgroundColor = StyleManager.shared.LightTheme["backgroundColor"]
                but.setTitleColor(StyleManager.shared.LightTheme["textColor"], for: .normal)
            }
        } else {
            for but in keypadPlus {
                but.backgroundColor = StyleManager.shared.DarkTheme["backgroundColor"]
                but.setTitleColor(StyleManager.shared.DarkTheme["textColor"], for: .normal)
            }
        }
    }
}
