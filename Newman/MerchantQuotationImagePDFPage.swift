//
//  MerchantQuotationPDFPage.swift
//  Newman
//
//  Created by Ash Duckett on 10/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class MerchantQuotationImagePDFPage: NewmanPDFPage {
    var serviceImageTableRect: CGRect?
    var notesTableRect: CGRect?
    var data: MerchantQuotationPDFPageData
    
    init(data: MerchantQuotationPDFPageData) {
        self.data = data
    }
    
    func getServices() -> [Service] {
        return self.data.services
    }
    
    func renderServiceImageTable() {
        // This should be 80% of the height of the table area and should start at the top of this rect.
        serviceImageTableRect = CGRect(x: marginLeft, y: tableRect!.minY, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 80)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
       // context.addRect(getDrawableRect()!)
       // context.drawPath(using: .stroke)
       // context.setFillColor(UIColor.yellow.cgColor)
       // context.fill(serviceImageTableRect!)
        
        
        let serviceHeader = GenericTableHeader(text: "SERVICE", percentageWidth: 33.333)
        let surveyImagesHeader = GenericTableHeader(text: "SURVEY IMAGES", percentageWidth: 33.333)
        let surveyDrawingsHeader = GenericTableHeader(text: "SURVEY DRAWINGS", percentageWidth: 33.333)
        
        
        // Create a table instance
        //let serviceTable = ServiceQuoteTable(area: serviceImageTableRect!, headers: [serviceHeader, materialHeader, amountHeader, elevationHeader, detailsHeader, priceHeader], services: self.data.services)
        let serviceImageTable = ServiceQuoteImageTable(area: serviceImageTableRect!, headers: [serviceHeader, surveyImagesHeader, surveyDrawingsHeader], services: self.data.services)
        serviceImageTable.render()
        self.data.services = serviceImageTable.getServices()
        
    }
    
    func renderNotesTable() {
        // This should be 20% of the height of the table area and should start at the bottom of the service table.
        notesTableRect = CGRect(x: marginLeft, y: marginTop + headerRect!.height + tableRect!.height / 100 * 80, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 20)
        
        let notesHeader = GenericTableHeader(text: "NOTES", percentageWidth: 100)
        
        
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
//        context.addRect(getDrawableRect()!)
//        context.drawPath(using: .stroke)
//        context.setFillColor(UIColor.yellow.cgColor)
//        context.fill(notesTableRect!)
        
        let notesTable = ImageNotesTable(area: notesTableRect!, headers: [notesHeader], notes: "Here are all the notes")
        notesTable.render()
    }
    
    func getNextPage() {
        prepareForNewPage()
        //renderDrawableAreaOutline()
        renderHeaderRect()
        renderTableRect()
        renderFooterRect()
        renderServiceImageTable()
        renderNotesTable()
    }
}
