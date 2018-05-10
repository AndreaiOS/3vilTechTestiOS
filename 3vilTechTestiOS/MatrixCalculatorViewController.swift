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
    }
    
    @IBAction func doCalculation(_ sender: Any) {
        view.endEditing(true)

        guard let numberOfRowsText = numberOfRowsTextField.text, let numberOfRows = Int(numberOfRowsText) else {
            return
        }
        guard let numberOfColumnsText = numberOfColumnsTextField.text, let numberOfColumns = Int(numberOfColumnsText) else {
            return
        }
        calculate(numberOfRows, numberOfColumns)
    }
    
    func calculate(_ columns: Int,_ rows: Int) {
        numberoOfRows = rows
        numberoOfColumns = columns
        
        MatrixCalculator.calculate(columns, rows) { (result, error) in
            if let error = error {
                errorLabel.text = error
            } else {
                errorLabel.text = ""
                matrix = result
                resultCollectionView.reloadData()
            }
        }
    }
}

extension MatrixCalculatorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
