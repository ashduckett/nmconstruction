//
//  TermsAndConditionsViewController.swift
//  Newman
//
//  Created by Ash Duckett on 06/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit
import PDFKit


class TermsAndConditionsViewController: UIViewController {
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var topBar: UIView!
    let pdfView = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        pdfView.autoScales = true
        
        if let path = Bundle.main.path(forResource: "Terms and Conditions", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            
            if let pdfDocument = PDFDocument(url: url) {
                pdfView.document = pdfDocument
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
