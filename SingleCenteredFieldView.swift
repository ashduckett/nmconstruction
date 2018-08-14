//
//  SingleCenteredFieldView.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 08/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class SingleCenteredFieldView: NewmanField {
    
    let containingView = UIView()
    var label: String?
    var textField = UITextField()
    
    init(placeholders: [String], label: String, textFieldCount: Int, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: nil, textFieldCount: textFieldCount, placeholders: placeholders, type: type)
        self.label = label
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func getText() -> String {
        return textField.text!
    }

    override func setupViewHierarchy() {
        let label = UILabel()
        label.text = self.label!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        super.setupHorizontalSubview()
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.alignment = .center
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.addArrangedSubview(label)
        horizontalStackView.spacing = 10
        
       // horizontalStackView.distribution = .fillProportionally
        //let textField = UITextField()
        //textField.borderStyle = .roundedRect
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        horizontalStackView.addArrangedSubview(textField)

        verticalStackView.addArrangedSubview(horizontalStackView)

        horizontalSubview.addArrangedSubview(verticalStackView)
        
        
        
        
    }

}
