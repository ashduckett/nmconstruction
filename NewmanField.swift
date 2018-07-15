//
//  NewmanField.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 11/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class NewmanField: UIView {
    let horizontalSubview = UIStackView()
    var delegate: ViewController?
    let addFieldButton = UIButton(type: .system)
    var textFields: [UITextField]?
    var placeholders: [String]?

    
    init(frame: CGRect, delegate: ViewController?, textFieldCount: Int, placeholders: [String]) {
        super.init(frame: frame)
        
        self.delegate = delegate
        textFields = (0..<textFieldCount).map { _ in UITextField() }
        self.placeholders = placeholders
    }
    
    @objc func plusButtonTapped() {
        self.delegate?.addField(plusButtonTappedFor: self)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    func setupViewHierarchy() {
        
    }
    
    func setupHorizontalSubview() {
        
        for (index, textField) in textFields!.enumerated() {
            textField.borderStyle = .roundedRect
            textField.placeholder = self.placeholders![index]
            print("Adding text field")
            horizontalSubview.addArrangedSubview(textField)
        }
        
        
        
        addSubview(horizontalSubview)
        
        horizontalSubview.axis = .horizontal
        horizontalSubview.distribution = .fillEqually
        horizontalSubview.alignment = .center
        horizontalSubview.translatesAutoresizingMaskIntoConstraints = false
        horizontalSubview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalSubview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        horizontalSubview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalSubview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
        if let _ = delegate {
            addSubview(addFieldButton)
            addFieldButton.setTitle("+", for: .normal)
            addFieldButton.translatesAutoresizingMaskIntoConstraints = false
            addFieldButton.leadingAnchor.constraint(equalTo: horizontalSubview.trailingAnchor, constant: 5).isActive = true
            addFieldButton.topAnchor.constraint(equalTo: horizontalSubview.bottomAnchor, constant: -20).isActive = true
            addFieldButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        }
        
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    }
   

}
