//
//  CalculatorEngine.swift
//  Calc
//
//  Created by iOSBFree on 25/01/2022.
//
//
//  iOSBFree Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  π Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSBFree
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's the core of the calculator. The brain. It generates all of our behaviour.
//   Architecural Layer: Business Logic Layer
//
// *******************************************************************************************


import Foundation

struct CalculatorEngine {
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    // MARK: - Math Equation
    
    private var mathEquation = MathEquation(leftOperand: .zero)
    private var operandSide = OperandSide.leftHandSide
    
    // MARK: - Equation History
    private var historyLog: [MathEquation] = []
    
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        mathEquation = MathEquation(leftOperand: .zero)
        operandSide = OperandSide.leftHandSide
        lcdDisplayText = mathEquation.leftOperand.formatted()
    }
    
    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftOperand()
            lcdDisplayText = mathEquation.leftOperand.formatted()
        case .rightHandSide:
            mathEquation.negateRightOperand()
            lcdDisplayText = mathEquation.rightOperand?.formatted() ?? "Error: unable to negate right operand"
        }
    }
    
    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftOperand()
            lcdDisplayText = mathEquation.leftOperand.formatted()
        case .rightHandSide:
            lcdDisplayText = mathEquation.rightOperand?.formatted() ?? "Error: unable to apply percentage to right operand"

        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        operandSide = .rightHandSide
    }
    
    mutating func subtractPressed() {
        mathEquation.operation = .subtract
        operandSide = .rightHandSide
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operandSide = .rightHandSide
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        operandSide = .rightHandSide
    }
    
    mutating func equalsPressed() {
        mathEquation.execute()
        historyLog.append(mathEquation)
        printEquationToDebugConsole()
        lcdDisplayText = mathEquation.result?.formatted() ?? "Error: unable to execute operation"
    }
    
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        let decimalValue = Decimal(number)
        lcdDisplayText = decimalValue.formatted()
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.leftOperand = decimalValue
        case .rightHandSide:
            mathEquation.rightOperand = decimalValue
        }
    }
    
    // MARK: - Debug Console
    
    private func printEquationToDebugConsole() {
        print("Equation: " + mathEquation.generatePrintout())
    }
    
    // MARK: - History Log
    
    private mutating func clearHistory() {
        historyLog = []
    }
    
}
