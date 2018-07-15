//
//  SubstrateField.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 10/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class SubstrateField: NewmanField, UIPickerViewDelegate, UIPickerViewDataSource, NewmanFieldDelegate {
    let picker = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return substrateTypeData.count
        case 1:
            return colourData.count
        case 2:
            return colourData.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return substrateTypeData[row]
        case 1:
            return colourData[row]
        case 2:
            return colourData[row]
        default:
            return nil
        }
    }
    
    let substrateTypeData = ["Type One", "Type Two", "Type Three", "Type Four", "Type Five"]
    let colourData = ["Red", "Yellow", "Green", "Blue", "Orange"]
    
    init(placeholders: [String], delegate: ViewController, textFieldCount: Int) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func setupViewHierarchy() {
        picker.delegate = self
        super.setupHorizontalSubview()
        addSubview(horizontalSubview)
        textFields![0].inputView = picker
        
        horizontalSubview.setCustomSpacing(10, after: textFields![0])
        horizontalSubview.setCustomSpacing(10, after: textFields![1])
    }

}
