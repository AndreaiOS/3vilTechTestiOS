//
//  MatrixCalculator.swift
//  3vilTechTestiOS
//
//  Created by Andrea Murru on 10/05/2018.
//  Copyright © 2018 TheAppsDoctor. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ result: [[Int]], _ error: String?) -> Void

class MatrixCalculator {
    class func calculate(_ columns: Int,_ rows: Int, completion: CompletionHandler) {
        var matrix: [[Int]] = [[Int]]()
        
        matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        if columns < 1 || rows < 1 {
            completion(matrix, "Rows and columns must be bigger than 0")
            return
        } else if (columns == 1 && rows == 1) {
            matrix[0][0] = 1
        } else if rows == 1  {
            var cSum: Int = 0
            for column in 0...columns - 2 {
                let value = column + 1
                matrix[0][column] = value
                cSum += value
            }
            matrix[0][columns - 1] = cSum
        } else if columns == 1{
            var rSum: Int = 0
            for row in 0...rows - 2 {
                let value = row + 1
                matrix[row][0] = value
                rSum += value
            }
            matrix[rows - 1][0] = rSum
        } else {
            var rSum = Array(repeating: 0, count: columns)
            
            for row in 0...rows - 2 {
                var cSum: Int = 0
                for column in 0...columns - 2 {
                    let value = row + column + 1
                    matrix[row][column] = value
                    rSum[column] += value
                    cSum += value
                }
                matrix[row][columns - 1] = cSum
            }
            rSum[columns - 1] = rSum.reduce(0, +)
            matrix[rows - 1] = rSum
        }
        completion(matrix, nil)
    }
}
