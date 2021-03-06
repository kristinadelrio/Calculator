//
//  InfoPresentedController.swift
//  Calculator
//
//  Created by Kristina Del Rio Albrechet on 6/28/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

/// Class controls presentation of history and result of calculation
class InfoPresentedController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let output = OutputAdapter.shared
    
    func presentResult(_ result: String) {
        displayLabel.text = result
    }
    
    func presentHistory(_ history: String) {
        historyLabel.text = history
        scrollView.scrollRectToVisible(historyLabel.bounds, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.historyDisplay = { [weak self] history in
            self?.presentHistory(history)
        }
        
        output.resultDisplay = { [weak self] result in
            self?.presentResult(result)
        }
        
        setFont()
        setTheme()
    }
    
    func setTheme() {
        displayLabel.backgroundColor = style.currentStyle[ElementsOfTheme.backgroundColor]
        historyLabel.backgroundColor = style.currentStyle[ElementsOfTheme.backgroundColor]
        scrollView.backgroundColor = style.currentStyle[ElementsOfTheme.backgroundColor]
        displayLabel.textColor = style.currentStyle[ElementsOfTheme.textColor]
        historyLabel.textColor = style.currentStyle[ElementsOfTheme.textColor]
    }
    
    func setFont() {
        displayLabel.font = UIFont(name: style.currentFont, size: 35.0)
        historyLabel.font = UIFont(name: style.currentFont, size: 25.0)
    }
}
