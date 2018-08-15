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
    var delegate: NewmanFormViewController?
    let addFieldButton = UIButton(type: .system)
    var textFields: [RightPaddedTextField]?
    var placeholders: [String]?
    var type: NewmanFieldType?
    
    init(frame: CGRect, delegate: NewmanFormViewController?, textFieldCount: Int, placeholders: [String], type: NewmanFieldType) {
        super.init(frame: frame)
        self.type = type
        self.delegate = delegate
        self.type = type

        // Initialise two new UITextField instances
        textFields = (0..<textFieldCount).map { _ in RightPaddedTextField() }
        
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
            textField.borderStyle = .line
            //textField.frame.size.height = 250
            //textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont(name: "MyriadPro-Regular", size: 16)
            
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftView = leftPaddingView
            textField.leftViewMode = .always
            textField.placeholder = self.placeholders![index]
            horizontalSubview.addArrangedSubview(textField)
        }
        
        
        
        addSubview(horizontalSubview)
        
        horizontalSubview.axis = .horizontal
        horizontalSubview.distribution = .fillEqually
        horizontalSubview.alignment = .center
        horizontalSubview.translatesAutoresizingMaskIntoConstraints = false
        horizontalSubview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        horizontalSubview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        horizontalSubview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalSubview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
        if let _ = delegate {
            addSubview(addFieldButton)
            addFieldButton.setTitle("+", for: .normal)
//            addFieldButton.backgroundColor = UIColor.yellow
            //addFieldButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
            addFieldButton.translatesAutoresizingMaskIntoConstraints = false
            addFieldButton.leadingAnchor.constraint(equalTo: horizontalSubview.trailingAnchor, constant: 15).isActive = true
            addFieldButton.topAnchor.constraint(equalTo: horizontalSubview.bottomAnchor, constant: -30).isActive = true
            //addFieldButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
            //addFieldButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            addFieldButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        }
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
        //heightAnchor.constraint(equalToConstant: 50).isActive = true
        //leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
        //trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    }
   

}
