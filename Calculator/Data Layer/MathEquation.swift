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
    
}
