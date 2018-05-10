//
//  MatrixCalculatorViewController.swift
//  3vilTechTestiOS
//
//  Created by Andrea Murru on 10/05/2018.
//  Copyright © 2018 TheAppsDoctor. All rights reserved.
//

import UIKit

class MatrixCalculatorViewController: UIViewController  {
    @IBOutlet weak var numberOfRowsTextField: UITextField!
    @IBOutlet weak var numberOfColumnsTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    var matrix: [[Int]] = [[Int]]()
    
    var numberoOfRows: Int = 0
    var numberoOfColumns: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        resultCollectionView.register(UINib(nibName: "MatrixCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MatrixCollectionViewCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doCalculation(_ sender: Any) {
        view.endEditing(true)

        guard let numberOfRowsText = numberOfRowsTextField.text, numberOfRows = Int(numberOfRowsText) else {
            return
        }
        guard let numberOfColumnsText = numberOfColumnsTextField.text, numberOfColumns = Int(numberOfColumnsText) else {
            return
        }
        calculate(numberOfRows, numberOfColumns)
    }
    
    func calculate(_ columns: Int,_ rows: Int) {
        errorLabel.text = ""

        view.endEditing(true)
        matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        if columns == 0 || rows == 0 {
            errorLabel.text = "Rows and columns must be bigger than 0"
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
        resultCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberoOfRows
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberoOfColumns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatrixCollectionViewCell", for: indexPath) as! MatrixCollectionViewCell
        cell.valueLabel.text = "\(matrix[indexPath.item][indexPath.section])"
        
        return cell
    }
}
