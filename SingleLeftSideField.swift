//
//  SingleCenteredFieldView.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 08/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class SingleLeftSideField: NewmanField {
    
    // Create a view, create a horizontal stack view, add latter to former
    
    // Internal view used for centering
    let containingView = UIView()
    var label: String?
    
    init(placeholders: [String], label: String, textFieldCount: Int, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: nil, textFieldCount: textFieldCount, placeholders: placeholders, type: type)
        self.label = label
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func setupViewHierarchy() {
        let label = UILabel()
        label.text = self.label!
        label.font = UIFont(name: "MyriadPro-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        super.setupHorizontalSubview()
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.alignment = .leading
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.addArrangedSubview(label)
        horizontalStackView.spacing = 10
      //  label.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 25).isActive = true


        
        
        let textField = UITextField()
        textField.borderStyle = .line
        textField.frame.size.height = 200
        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        
        horizontalStackView.addArrangedSubview(textField)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        horizontalSubview.addArrangedSubview(verticalStackView)
        
        
        
        
    }
    
}

