//
//  ViewController.swift
//  Newman
//
//  Created by Ash Duckett on 15/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class NewmanFormViewController: UIViewController {

    var formFields = [NewmanField]()
    var quotationNumberField: SingleCenteredFieldView!
    
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
        //let blankPair = TextFieldPairView(placeholders: ["", ""], delegate: self, type: .unset)
        //blankPair.delegate = self
        
        
        
        
        //formContainer.insertArrangedSubview(blankPair, at: indexToAddControlTo)
        
        
        print("TYPE FOUND: \(plusButtonTappedFor.type!)")
        
        
        //blankPair.setupViewHierarchy()
        
        switch plusButtonTappedFor.type! {
        case .material:
            let indexToAddControlTo = formContainer.arrangedSubviews.index(of: plusButtonTappedFor)! + 1
            let materialField = MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2, type: .material)
            materialField.delegate = self
            formContainer.insertArrangedSubview(materialField, at: indexToAddControlTo)
            materialField.setupViewHierarchy()
        case .photo:
            let indexToAddControlTo = formContainer.arrangedSubviews.index(of: plusButtonTappedFor)! + 1
            let photoField = PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self, type: .photo)
            photoField.delegate = self
            formContainer.insertArrangedSubview(photoField, at: indexToAddControlTo)
            photoField.setupViewHierarchy()
        case .drawing:
            let indexToAddControlTo = formContainer.arrangedSubviews.index(of: plusButtonTappedFor)! + 1
            let drawingField = PictureField(placeholders: ["Insert Drawing"], delegate: self, textFieldCount: 1, viewController: self, type: .drawing)
            drawingField.delegate = self
            formContainer.insertArrangedSubview(drawingField, at: indexToAddControlTo)
            drawingField.setupViewHierarchy()
        case .details, .extraService:
        
            // Find out the kind of service type the user wants: Stock or Extra
            let alert = UIAlertController(title: "Service Type", message: "What kind of service are you adding?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Stock", style: .default, handler: { action in
                let indexToAddControlTo = self.formContainer.arrangedSubviews.index(of: plusButtonTappedFor)! + 1
                
                let stockServiceField = StockServiceField(placeholders: ["SERVICE"], delegate: nil, textFieldCount: 1, type: .service)
                self.formContainer.insertArrangedSubview(stockServiceField, at: indexToAddControlTo)
                stockServiceField.setupViewHierarchy()
                
                // Next add a material field
                let materialField = MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2, type: .material)
                materialField.delegate = self
                self.formContainer.insertArrangedSubview(materialField, at: indexToAddControlTo + 1)
                materialField.setupViewHierarchy()
                
                // Next add an elevation field
                let elevationField = FullLengthTextField(placeholders: ["Elevation"], delegate: nil, textFieldCount: 1, type: .elevation)
                self.formContainer.insertArrangedSubview(elevationField, at: indexToAddControlTo + 2)
                elevationField.setupViewHierarchy()
                
                // Next add an elevation field
                let photoField = PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self, type: .photo)
                photoField.delegate = self
                self.formContainer.insertArrangedSubview(photoField, at: indexToAddControlTo + 3)
                photoField.setupViewHierarchy()
                
                let drawingField = PictureField(placeholders: ["Insert Drawing"], delegate: self, textFieldCount: 1, viewController: self, type: .drawing)
                drawingField.delegate = self
                self.formContainer.insertArrangedSubview(drawingField, at: indexToAddControlTo + 4)
                drawingField.setupViewHierarchy()
                
                let detailsField = FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1, type: .details)
                detailsField.delegate = self
                self.formContainer.insertArrangedSubview(detailsField, at: indexToAddControlTo + 5)
                detailsField.setupViewHierarchy()
            }))
            
            alert.addAction(UIAlertAction(title: "Extra", style: .default, handler: { action in
                let extraServiceField = TextFieldPairView(placeholders: ["SERVICE", "COST"], delegate: self, type: .extraService)
                self.formContainer.insertArrangedSubview(extraServiceField, at: indexToAddControlTo)
                extraServiceField.setupViewHierarchy()
            }))
            
            //self.present(alert, animated: true)
//            if let popoverPresentationController = alert.popoverPresentationController {
//                popoverPresentationController.sourceView = self.view
//                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//
//            }
            
            self.present(alert, animated: false, completion: nil)
            
        default:
            print("What kind of control should be put here")
        }
        
        
        for formField in formContainer.arrangedSubviews {
            let field = formField as! NewmanField
            
            print(field.type)
        }
    }
    
    func setupForm() {
        
        quotationNumberField = SingleCenteredFieldView(placeholders: [""], label: "QUOTE REQUISITION", textFieldCount: 0, type: .quoteRequisitionNumber)
        print("setting up form")
        formFields = [
            quotationNumberField,
            TextFieldPairView(placeholders: ["CLIENT", "ADDRESS"], delegate: nil, type: .nameAndAddress),
            //FullLengthTextField(placeholders: ["SERVICE"], delegate: nil, textFieldCount: 1, type: .service),
            StockServiceField(placeholders: ["SERVICE"], delegate: nil, textFieldCount: 1, type: .service),
            MaterialField(placeholders: ["MATERIAL", "AMOUNT"], delegate: self, textFieldCount: 2, type: .material),
            FullLengthTextField(placeholders: ["ELEVATION/s"], delegate: nil, textFieldCount: 1, type: .elevation),
            PictureField(placeholders: ["Insert Photo"], delegate: self, textFieldCount: 1, viewController: self, type: .photo),
            PictureField(placeholders: ["Insert Drawings"], delegate: self, textFieldCount: 1, viewController: self, type: .drawing),
            FullLengthTextField(placeholders: ["DETAIL/s"], delegate: self, textFieldCount: 1, type: .details),
            // TextFieldPairView(placeholders: ["GUARANTEE", "EXPECTED PRICE"], delegate: nil),
            FullLengthTextField(placeholders: ["NOTE/s"], delegate: nil, textFieldCount: 1, type: .notes),
            SingleCenteredFieldView(placeholders: [""], label: "APPROX TOTAL", textFieldCount: 0, type: .approxTotal)
        ]
        
        for formField in formFields {
            formContainer.addArrangedSubview(formField)
            formField.setupViewHierarchy()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuote" {
            let destinationVC = segue.destination as! QuotationViewController
            destinationVC.testText = "Hamster"
            
            // How are you going to get the text out of the client field?
            var clientName = formFields[1].textFields![0].text!
            var clientAddress = formFields[1].textFields![1].text!
            var quoteNo = quotationNumberField.getText()
            
            
            
            destinationVC.quote = Quote(quotationNumber: quoteNo, clientName: clientName, clientAddress: clientAddress)
        }
    }
}


