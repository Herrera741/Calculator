//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Sergio Herrera on 8/15/22.
//

import XCTest
@testable import Calculator

final class MathEquationTests: XCTestCase {

    func testAddition() throws {
        var mathEquation = MathEquation(leftOperand: .zero)
        mathEquation.leftOperand = 7
        mathEquation.operation = .add
        mathEquation.rightOperand = 3
        mathEquation.execute()
        
        let expectedResult = Decimal(10)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
    func testSubtraction() throws {
        var mathEquation = MathEquation(leftOperand: .zero)
        mathEquation.leftOperand = 5
        mathEquation.operation = .subtract
        mathEquation.rightOperand = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(1)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
    func testMultiplication() throws {
        var mathEquation = MathEquation(leftOperand: .zero)
        mathEquation.leftOperand = 4
        mathEquation.operation = .multiply
        mathEquation.rightOperand = 4
        mathEquation.execute()
        
        let expectedResult = Decimal(16)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
    
    func testDivision() throws {
        var mathEquation = MathEquation(leftOperand: .zero)
        mathEquation.leftOperand = 16
        mathEquation.operation = .divide
        mathEquation.rightOperand = 2
        mathEquation.execute()
        
        let expectedResult = Decimal(8)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

}
