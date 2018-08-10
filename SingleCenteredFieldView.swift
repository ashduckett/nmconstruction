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
    
    init(placeholders: [String], label: String, textFieldCount: Int) {
        super.init(frame: CGRect.zero, delegate: nil, textFieldCount: textFieldCount, placeholders: placeholders)
        self.label = label
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
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

        let textField = UITextField()
        //textField.borderStyle = .roundedRect
        textField.borderStyle = .line
        
        horizontalStackView.addArrangedSubview(textField)

        verticalStackView.addArrangedSubview(horizontalStackView)

        horizontalSubview.addArrangedSubview(verticalStackView)
        
        
        
        
    }

}
