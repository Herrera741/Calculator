//
//  ViewController.swift
//  Calculator
//
//  Created by Sergio Herrera on 8/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lcdDisplay: UIView!
    @IBOutlet weak var displayLabel: UILabel!

    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnPosNeg: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var btnEquals: UIButton!
    
    var currentTheme: CalculatorTheme {
        // gray:            #a6a6a6
        // dark gray:       #333333
        // orange:          #ff9f0a
        return CalculatorTheme(backgroundColor: "#000000", displayColor: "#FFFFFF", extraFunctionBtnBgColor: "#a6a6a6", extraFunctionBtnTextColor: "#FFFFFF", operationBtnBgColor: "#ff9f0a", operationBtnTextColor: "#FFFFFF", keypadBtnBgColor: "#333333", keypadBtnTextColor: "#FFFFFF")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }

    private func decorateView() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = UIColor(hex: currentTheme.displayColor)
        
        decorateButtons()
    }
    
    private func decorateButtons() {
        decorateKeypadButton(btn0, true)
        decorateKeypadButton(btn1)
        decorateKeypadButton(btn2)
        decorateKeypadButton(btn3)
        decorateKeypadButton(btn4)
        decorateKeypadButton(btn5)
        decorateKeypadButton(btn6)
        decorateKeypadButton(btn7)
        decorateKeypadButton(btn8)
        decorateKeypadButton(btn9)
        decorateKeypadButton(btnDecimal)
        
        decorateExtraFunctionButton(btnClear)
        decorateExtraFunctionButton(btnPosNeg)
        decorateExtraFunctionButton(btnPercent)
        
        decorateOperationButton(btnDivide)
        decorateOperationButton(btnMultiply)
        decorateOperationButton(btnAdd)
        decorateOperationButton(btnSubtract)
        decorateOperationButton(btnEquals)
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        let image = usingSlicedImage ? UIImage(named: "circle-sliced-bg") : UIImage(named: "circle-bg")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
        
        button.tintColor = .orange
    }
    
    private func decorateKeypadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)

        button.tintColor = UIColor(hex: currentTheme.keypadBtnBgColor)
        button.setTitleColor(UIColor(hex: currentTheme.keypadBtnTextColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)

        button.tintColor = UIColor(hex: currentTheme.operationBtnBgColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationBtnTextColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionBtnBgColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionBtnTextColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    }

}

