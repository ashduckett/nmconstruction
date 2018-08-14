//
//  MaterialField.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 08/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class StockServiceField: NewmanField, UIPickerViewDelegate, UIPickerViewDataSource, NewmanFieldDelegate {
    
    var myPickerData = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFields![0].text = myPickerData[row]
    }
    
    let serviceSelector = UIPickerView()
    
    init(placeholders: [String], delegate: NewmanFormViewController?, textFieldCount: Int, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders, type: type)
        
        for stockItem in StockMaterials.getStockMaterials() {
            self.myPickerData.append(stockItem.name)
        }
        
        serviceSelector.delegate = self
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        textFields![0].inputView = serviceSelector
        addSubview(horizontalSubview)
        horizontalSubview.setCustomSpacing(10, after: textFields![0])
    }
    
}

