//
//  ThreeTextFieldView.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 10/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class ThreeTextFieldView: NewmanField, NewmanFieldDelegate {
    
    init(placeholders: [String], delegate: NewmanFormViewController, textFieldCount: Int, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders, type: type)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        addSubview(horizontalSubview)
        horizontalSubview.setCustomSpacing(10, after: textFields![0])
        horizontalSubview.setCustomSpacing(10, after: textFields![1])
    }

}
