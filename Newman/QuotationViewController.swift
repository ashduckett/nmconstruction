//
//  QuotationViewController.swift
//  Newman
//
//  Created by Ash Duckett on 06/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit
import PDFKit

struct Header {
    let percentOfWidth: CGFloat
    let text: NSString
}


class QuotationViewController: UIViewController {
    var testText: String?
    let pdfView = PDFView()
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        
        createPDF()
        
        guard let path = documentPath() else {
            return
        }
        
        if let document = PDFDocument(url: path) {
            pdfView.document = document
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createPDF() {
        // Grab file path
        guard let pdfPath = documentPath()?.path else { return }
        UIGraphicsBeginPDFContextToFile(pdfPath, .zero, nil)
        
        
        // Construct dummy data:
        let material1 = Material(name: "Material One", amount: 5)
        let material2 = Material(name: "Material Two", amount: 10)
        
        
        let surveyImages1 = ["Survey Images 1", "Survey Images 2", "Survey Images 3", "Survey Images 4", "Survey Images 4"]
        let surveyDrawings1 = ["Survey Drawings 1", "Survey Drawings 2", "Survey Drawings 3", "Survey Drawings 1", "Survey Drawings 2", "Survey Drawings 3"]
        
        
        let service1 = Service(name: "Service 1", materials: [material1], elevation: 5, details: "Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text Here is some text ", cost: 55.55, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        
        let service2 = Service(name: "Service 2", materials: [material1], elevation: 5, details: "Here is some test datadsfsdlkjfhdsjkflf dsfoidsn lkjn j hnjk hnjk bn jkb jkb jkb jkb kj bj bj b bj jbj b jb j b", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service3 = Service(name: "Service 3", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service4 = Service(name: "Service 4", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service5 = Service(name: "Service 5", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service6 = Service(name: "Service 6", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service7 = Service(name: "Service 7", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service8 = Service(name: "Service 8", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service9 = Service(name: "Service 9", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service10 = Service(name: "Service 10", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service11 = Service(name: "Service 11", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)
        let service12 = Service(name: "Service 12", materials: [material1], elevation: 5, details: "Here is some test data", cost: 200.50, surveyImages: surveyImages1, surveyDrawings: surveyDrawings1)

        
        
        let services = [service1, service2, service3, service4, service5, service6, service7, service8, service9, service10, service11, service12]
        
        let extraService1 = ExtraService(name: "Extra Service 1", price: 1.99)
        let extraService2 = ExtraService(name: "Extra Service 2", price: 1.99)
        let extraService3 = ExtraService(name: "Extra Service 3", price: 1.99)
        let extraService4 = ExtraService(name: "Extra Service 4", price: 1.99)
        let extraService5 = ExtraService(name: "Extra Service 5", price: 1.99)
        let extraService6 = ExtraService(name: "Extra Service 6", price: 1.99)
        let extraService7 = ExtraService(name: "Extra Service 7", price: 1.99)
        let extraService8 = ExtraService(name: "Extra Service 8", price: 1.99)
        let extraService9 = ExtraService(name: "Extra Service 9", price: 1.99)
        let extraService10 = ExtraService(name: "Extra Service 10", price: 1.99)
        let extraService11 = ExtraService(name: "Extra Service 11", price: 1.99)
        let extraService12 = ExtraService(name: "Extra Service 12", price: 1.99)
        let extraService13 = ExtraService(name: "Extra Service 13", price: 1.99)
        let extraService14 = ExtraService(name: "Extra Service 14", price: 1.99)
        let extraService15 = ExtraService(name: "Extra Service 15", price: 1.99)
        
        let data = MerchantQuotationPDFPageData(services: services, extraServices: [extraService1, extraService2, extraService3, extraService4, extraService5, extraService6, extraService7, extraService8, extraService9, extraService10, extraService12, extraService13, extraService14, extraService15, extraService1])
        
        let pdfPage = MerchantQuotationPDFPage(data: data)
        while pdfPage.getServices().count > 0 || pdfPage.getExtraServices().count > 0 {
            pdfPage.getNextPage()
        }
        
        // Now let's render the second page
        let pdfImagePage = MerchantQuotationImagePDFPage(data: data)
        while pdfImagePage.getServices().count > 0 {
            pdfImagePage.getNextPage()
        }
        
        
        
        
        
        UIGraphicsEndPDFContext()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // A function to get hold of the path for the current pdf
    func documentPath() -> URL? {
        let fileManager = FileManager.default
        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
        return documentsUrl.appendingPathComponent("experiment.pdf")!
        
    }
    
}
