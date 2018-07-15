//
//  ViewController.swift
//  Newman
//
//  Created by Ash Duckett on 15/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class NewmanFormViewController: UIViewController {


    @IBOutlet weak var formContainer: UIStackView!
    
    // var waterProofingForm: [NewmanField]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        setupWaterProofingForm()
        
    }
    
    func removeAllItemsFromStack() {
        let viewsToRemove = formContainer.arrangedSubviews
        
        for viewToRemove in viewsToRemove {
            formContainer.removeArrangedSubview(viewToRemove)
        }
    }
    
    @IBAction func structuralButtonPressed(_ sender: Any) {
        removeAllItemsFromStack()
        setupStructuralForm()
    }
    @IBAction func stoneRepairButtonPressed(_ sender: Any) {
        removeAllItemsFromStack()
        setupStoneRepairForm()
    }
    
    @IBAction func concreteRepairButtonPressed(_ sender: Any) {
        removeAllItemsFromStack()
        setupConcreteRepairForm()
    }
    @IBAction func brickRepairButtonPressed(_ sender: Any) {
        removeAllItemsFromStack()
        setupBrickRepairForm()
    
    }
    @IBAction func waterProofingButtonPressed(_ sender: Any) {
        removeAllItemsFromStack()
        setupWaterProofingForm()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end edit")
        self.view.endEditing(true)
    }
    
    func addField(plusButtonTappedFor: NewmanField) {
        let indexToAddControlTo = formContainer.arrangedSubviews.index(of: plusButtonTappedFor)! + 1
        let blankPair = TextFieldPairView(placeholders: ["", ""], delegate: self)
        blankPair.delegate = self
        formContainer.insertArrangedSubview(blankPair, at: indexToAddControlTo)
        blankPair.setupViewHierarchy()
    }
    
    func setupStoneRepairForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION STONE REPAIR", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENTS", "ADDRESS"], delegate: self),
            TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["CLIENT TO PROVIDE"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    func setupConcreteRepairForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION CONCRETE REPAIR", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENTS", "ADDRESS"], delegate: self),
            TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["CLIENT TO PROVIDE"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    func setupBrickRepairForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION BRICK REPAIR", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENTS", "ADDRESS"], delegate: self),
            TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["CLIENT TO PROVIDE"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    func setupStructuralForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION STRUCTURAL", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENTS", "ADDRESS"], delegate: self),
            TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["CLIENT TO PROVIDE"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    func setupWaterProofingForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENTS", "ADDRESS"], delegate: self),
            TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["CLIENT TO PROVIDE"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
}

