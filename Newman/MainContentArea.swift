//
//  MainContentArea.swift
//  Newman
//
//  Created by Ash Duckett on 08/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class MainContentArea: RenderableSection {
    // get most of this into a render method
    var data: [[String]]?
    var pdfPath: String?
    
    init(services: [[String]], pdfPath: String) {
        super.init()
        data = services
        self.pdfPath = pdfPath
    }
    
    func beginRenderingToPDF() {
        UIGraphicsBeginPDFContextToFile(self.pdfPath!, .zero, nil)
    }
    
    func endRenderingToPDF() {
        UIGraphicsEndPDFContext()
    }
    
    func renderPage() {
        
    }
    
    override func render() {
//        UIGraphicsBeginPDFPage()
        let headerSection = HeaderSection()
        let tableSection = TableSection()
        let footerSection = FooterSection()
        
        let header1 = Header(percentOfWidth: 16.666, text: "SERVICE")
        let header2 = Header(percentOfWidth: 16.666, text: "MATERIAL")
        let header3 = Header(percentOfWidth: 16.666, text: "AMOUNT")
        let header4 = Header(percentOfWidth: 16.666, text: "ELEVATION")
        let header5 = Header(percentOfWidth: 16.666, text: "DETAILS")
        let header6 = Header(percentOfWidth: 16.666, text: "")
        
        let extraServices = Header(percentOfWidth: 80, text: "EXTRA SERVICES")
        let expectedCost = Header(percentOfWidth: 20, text: "EXPECTED COST")
        
        self.appendSection(heightPercent: 20, section: headerSection)
        self.appendSection(heightPercent: 70, section: tableSection)
        self.appendSection(heightPercent: 10, section: footerSection)
        
        let newTable = Table(percentOfTableSection: 80, headers: [header1, header2, header3, header4, header5, header6], data: self.data!)
        
        // What about an array of array?
        var extras = [[String]]()
        // How about a method called addRow on the table.
        
        
        
        extras.append(["Water Proofing", "PVC"])
        
        let newTable2 = Table(percentOfTableSection: 20, headers: [extraServices, expectedCost], data: extras)
        
        tableSection.appendTable(table: newTable)
        tableSection.appendTable(table: newTable2)
        
        
        super.render()
    }
    
}
