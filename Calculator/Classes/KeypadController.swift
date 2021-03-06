//
//  KeypadController.swift
//  Calculator
//
//  Created by Kristina Del Rio Albrechet on 6/28/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit
import AVFoundation

/// Class controls the whole keypad and functionality
class KeypadController: UIViewController {
    
    var onNumTap: ((_ num: Int)->())?
    var onUtilityTap: ((_ symbol: Int)->())?
    
    var popUpAdditionKeypad: AdditionKeypadController!
    var sideAdditionkeypad: KeypadPlusController!
    var sound = false
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    // Catch all digit tap
    @IBAction func onNumericTap(button: UIButton) {
        onNumTap?(button.tag)
        buttonPressedSound()
    }
    
    // Catch tap on all the symbols in the calculator
    @IBAction func onUtilityTap(button: UIButton) {
        onUtilityTap?(button.tag)
        buttonPressedSound()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdditionKeypadSegue", let controller = segue.destination as? AdditionKeypadController {
            popUpAdditionKeypad = controller
            
            popUpAdditionKeypad.onSymbolTap = { [weak self] button in
                self?.onUtilityTap(button: button)
            }
        } else if segue.identifier == "KeypadPlusForLandscapeSegue", let controller = segue.destination as? KeypadPlusController {
            sideAdditionkeypad = controller
            
            sideAdditionkeypad.onButtonTap = { [weak self] button in
                self?.onUtilityTap(button: button)
            }
        }
    }
    
    // Enable arrow buttons for differnt position of screen
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        UIDevice.current.orientation.isLandscape ? (arrowButton.isEnabled = false) : (arrowButton.isEnabled = true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.orientation.isLandscape ? (arrowButton.isEnabled = false) : (arrowButton.isEnabled = true)
        sound = (UserDefaults.standard.value(forKey: KeyForUserDefaults.soundSwitcher.rawValue) as? Bool)!
        
        setTheme()
        setFont()
    }

    func setTheme() {
        equalButton.backgroundColor = style.currentStyle[ElementsOfTheme.equal]
        for but in buttons {
            but.setTitleColor(style.currentStyle[ElementsOfTheme.textColor], for: .normal)
            
            // but.tag 10 is arrow ; tag 10015 is dot
            if but.tag >= 0 && but.tag <= 10 || but.tag == 10015 {
                but.backgroundColor = style.currentStyle[ElementsOfTheme.buttonColor]
            } else {
                but.backgroundColor = style.currentStyle[ElementsOfTheme.utilitybuttonColor]
            }
        }
    }
    
    func setFont() {
        equalButton.titleLabel?.font = UIFont(name: style.currentFont, size: 30.0)
        for but in buttons {
            but.titleLabel?.font = UIFont(name: style.currentFont, size: 30.0)
        }
    }
    
    func buttonPressedSound() {
        if sound {
            AudioServicesPlaySystemSound(1104)
        }
    }
}
