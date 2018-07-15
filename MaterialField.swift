//
//  MaterialField.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 08/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class MaterialField: NewmanField, UIPickerViewDelegate, UIPickerViewDataSource, NewmanFieldDelegate {
        
    let myPickerData = ["Material One", "Material Two", "Material Three", "Material Four", "Material Five"]
    
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

    let materialSelector = UIPickerView()
    
    init(placeholders: [String], delegate: ViewController, textFieldCount: Int) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders)
        materialSelector.delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        textFields![0].inputView = materialSelector
        addSubview(horizontalSubview)
        horizontalSubview.setCustomSpacing(10, after: textFields![0])
    }

}
