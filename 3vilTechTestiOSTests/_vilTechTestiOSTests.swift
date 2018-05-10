//
//  _vilTechTestiOSTests.swift
//  3vilTechTestiOSTests
//
//  Created by Andrea Murru on 10/05/2018.
//  Copyright © 2018 TheAppsDoctor. All rights reserved.
//

import XCTest
@testable import _vilTechTestiOS

class _vilTechTestiOSTests: XCTestCase {
    
    func testValuesZero() {
        MatrixCalculator.calculate(0, 0) { (matrix, error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testColumnsValueZero() {
        MatrixCalculator.calculate(0, 1) { (matrix, error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testRowsValueZero() {
        MatrixCalculator.calculate(1, 0) { (matrix, error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testValuesOne() {
        MatrixCalculator.calculate(1, 1) { (matrix, error) in
            XCTAssertEqual(matrix, [[1]])
        }
    }
    
    func testValuesFive() {
        MatrixCalculator.calculate(5, 5) { (matrix, error) in
            XCTAssertEqual(matrix, [[1, 2, 3, 4, 10], [2, 3, 4, 5, 14], [3, 4, 5, 6, 18], [4, 5, 6, 7, 22], [10, 14, 18, 22, 64]])
        }
    }
    
    func testValuesSevenFive() {
        MatrixCalculator.calculate(7, 5) { (matrix, error) in
            XCTAssertEqual(matrix, [[1, 2, 3, 4, 5, 6, 21], [2, 3, 4, 5, 6, 7, 27], [3, 4, 5, 6, 7, 8, 33], [4, 5, 6, 7, 8, 9, 39], [10, 14, 18, 22, 26, 30, 120]])
        }
    }
    
    func testValuesSixFour() {
        MatrixCalculator.calculate(6, 4) { (matrix, error) in
            XCTAssertEqual(matrix, [[1, 2, 3, 4, 5, 15], [2, 3, 4, 5, 6, 20], [3, 4, 5, 6, 7, 25], [6, 9, 12, 15, 18, 60]])
        }
    }
}
