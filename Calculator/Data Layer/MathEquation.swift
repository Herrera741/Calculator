//
//  MathEquation.swift
//  Calculator
//
//  Created by Sergio Herrera on 8/17/22.
//

import Foundation

struct MathEquation {
    
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }
    
    var leftOperand: Decimal
    var rightOperand: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    // MARK: - Execution
    
    mutating func execute() {
        guard
            let rightOperand = self.rightOperand,
            let operation = self.operation else {
                return
            }
        
        switch operation {
        case .add:
            self.result = self.leftOperand + rightOperand
        case .subtract:
            self.result = self.leftOperand - rightOperand
        case .multiply:
            self.result = self.leftOperand * rightOperand
        case .divide:
            self.result = self.leftOperand / rightOperand
        }
    }
    
    // MARK: - Negate
    
    mutating func negateLeftOperand() {
        leftOperand.negate()
    }
    
    mutating func negateRightOperand() {
        rightOperand?.negate()
    }
    
    // MARK: - Percentage
    
    func calculatePercentageValue(_ decimalValue: Decimal) -> Decimal {
        return decimalValue / 100
    }
    
    mutating func applyPercentageToLeftOperand() {
        leftOperand = calculatePercentageValue(leftOperand)
    }
    
    mutating func applyPercentageToRightOperand() {
        guard let decimalValue = rightOperand else { return }
        rightOperand = calculatePercentageValue(decimalValue)
    }
    
    //MARK: - String Representation
    
    func generatePrintout() -> String {
        let operatorString = generateOperatorString()
        return leftOperand.formatted() + " " + operatorString + " " + (rightOperand?.formatted() ?? "") + " = " + (result?.formatted() ?? "")
    }
    
    func generateOperatorString() -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        case .none: return ""
        }
    }
    
    
}
