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
    
    @IBAction func nextPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuote", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        setupForm()
    }
    
    func removeAllItemsFromStack() {
        let viewsToRemove = formContainer.arrangedSubviews
        
        for viewToRemove in viewsToRemove {
            formContainer.removeArrangedSubview(viewToRemove)
        }
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
    
    func setupForm() {
        let formOne = [
            SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION", textFieldCount: 0),
            TextFieldPairView(placeholders: ["CLIENT", "ADDRESS"], delegate: self),
            //TextFieldPairView(placeholders: ["SERVICE/s", "SPECIFICATION/s"], delegate: self),
            FullLengthTextField(placeholders: ["SERVICE"], delegate: self, textFieldCount: 1),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: self, textFieldCount: 1),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self),
            //SubstrateField(placeholders: ["SUBSTRATE TYPE", "COLOUR", "MORTAR COLOUR"], delegate: self, textFieldCount: 3),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1),
            //SingleCenteredFieldView(placeholders: [""], label: "QUOTE NOTES", textFieldCount: 0),
            // ThreeTextFieldView(placeholders: ["SCAFFOLDING", "INSERT TYPE", "INSERT TYPE"], delegate: self, textFieldCount: 3),
            TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: self),
            //TextFieldPairView(placeholders: ["", ""], delegate: self),
            FullLengthTextField(placeholders: ["NOTE/s"], delegate: self, textFieldCount: 1),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0)
        ]
        
        for formField in formOne {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuote" {
            let destinationVC = segue.destination as! QuotationViewController
            destinationVC.testText = "Hamster"
        }
    }
}


