//
//  KeypadPlusController.swift
//  Calculator
//
//  Created by Kristina Del Rio Albrechet on 7/7/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

/// Class controles addition keypad and binds functionality via closure
class KeypadPlusController: UIViewController {
    
    var onButtonTap: ((_ sender: UIButton)->())?
    
    @IBOutlet var keypadPlus: [UIButton]!
    
    @IBAction func buttonTap(_ sender: UIButton) {
        onButtonTap?(sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        setFont()
    }
    
    /// Set theme on the controller
    func setTheme() {
        for but in keypadPlus {
            but.backgroundColor = style.currentStyle["UtilitybuttonColor"]
            but.setTitleColor(style.currentStyle["textColor"], for: .normal)
        }
    }
    
    /// Set font for buttons on KeypadPlus
    func setFont() {
        for but in keypadPlus {
            but.titleLabel?.font = UIFont(name: style.currentFont, size: 30.0)
        }
    }
}
