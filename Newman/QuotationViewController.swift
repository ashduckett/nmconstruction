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
        
        
        UIGraphicsBeginPDFPage()
        
        let pdfPage = MerchantQuotationPDFPage()
        
        // Normally you'd just call render on the page, and this would be done from the PDFPage itself.
        pdfPage.renderDrawableAreaOutline()
        pdfPage.renderHeaderRect()
        pdfPage.renderTableRect()
        pdfPage.renderFooterRect()
        pdfPage.renderServiceTable()
        //pdfPage.renderExtrasTable()
        // Let us begin once more, and with feeling.
        
        
        // THIS IS THE THING
        UIGraphicsBeginPDFPage()
        
        let pdfPage2 = MerchantQuotationPDFPage()
        
        // Normally you'd just call render on the page, and this would be done from the PDFPage itself.
        pdfPage2.renderDrawableAreaOutline()
        pdfPage2.renderHeaderRect()
        pdfPage2.renderTableRect()
        pdfPage2.renderFooterRect()
        pdfPage2.renderServiceTable()
        //pdfPage.renderExtrasTable()
        // Let us begin once more, and with feeling.
        
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
        
        
        print(documentsUrl.appendingPathComponent("experiment.pdf")!)
        return documentsUrl.appendingPathComponent("experiment.pdf")!
        
    }
    
}
