//
//  TextFieldPairView.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 08/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

protocol NewmanFieldDelegate {
    func plusButtonTapped()
}

class TextFieldPairView: NewmanField, NewmanFieldDelegate {
    
    init(placeholders: [String], delegate: NewmanFormViewController?, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: 2, placeholders: placeholders, type: type)
    }
        
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    func customFieldSetup() {
        horizontalSubview.setCustomSpacing(10, after: textFields![0])
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        customFieldSetup()
    }



    
    
    
    
    
    
    
    
    


    
    

}
