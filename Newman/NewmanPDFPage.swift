//
//  NewmanPDFPage.swift
//  Newman
//
//  Created by Ash Duckett on 10/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class NewmanPDFPage: PDFPage {
    var headerRect: CGRect?
    var tableRect: CGRect?
    var footerRect: CGRect?
    
    override init() {
        print("NewmainPDFPage constructor has been called")
        super.init()
    }
    
    func prepareForNewPage() {
        UIGraphicsBeginPDFPage()
        // Create the header rect at the top and of 20 percent of the entire drawable height.
        headerRect = CGRect(x: marginLeft, y: marginTop, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 20)
        
        // Create the table rect at the top and of 70 percent of the entire drawable height.
        tableRect = CGRect(x: marginLeft, y: marginTop + (headerRect?.height)!, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 70)
        
        // Create the table footer at the top and of 70 percent of the entire drawable height.
        footerRect = CGRect(x: marginLeft, y: marginTop + (headerRect?.height)! + (tableRect?.height)!, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 10)
    }
    
    func renderHeaderRect() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //context.addRect(headerRect!)
        //context.drawPath(using: .stroke)
        
        renderHeader()
    }
    
    func renderTableRect() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(tableRect!)
        context.drawPath(using: .stroke)
    }
    
    func renderFooterRect() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(footerRect!)
        context.drawPath(using: .stroke)
    }
    
    func renderHeader() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let image = UIImage(named: "newmanlogo")
        
        let x = context.boundingBoxOfClipPath.minX + marginLeft
        let y = context.boundingBoxOfClipPath.minY + marginTop
        
        let imageRect = CGRect(x: x, y: y, width: 191.333, height: 49)
        

        
        UIGraphicsPushContext(context)

        context.saveGState()

        image?.draw(in: imageRect)
        let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
        let clientName = self.getQuote().clientName
        //print("The client name entered is \(getClientName())")
        
        let clientAddress = self.getQuote().clientAddress
        let clientNameAndAddress = "\(clientName)\n\(clientAddress)"
        
        let headerTextAttributes = [
            NSAttributedStringKey.font: headerTextFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        // Get the distance
        let imageBottom = imageRect.maxY
        let tableTop = headerRect?.maxY
        
        let distance = (tableTop! - imageBottom) / 2
        
        let nameAndAddressSize = clientNameAndAddress.boundingRect(with: CGSize(width: imageRect.width, height: imageRect.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size
        // Text rect
        let nameAndAddressRect = CGRect(x: imageRect.minX, y: imageRect.maxY + distance - (nameAndAddressSize.height / 2), width: imageRect.width, height: nameAndAddressSize.height)
        
        
        
        
        clientNameAndAddress.draw(with: nameAndAddressRect, options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil)
        
        
        
        let quotationTextFont = UIFont(name: "Academy Engraved LET", size: 24)
        let quotationString = "Quotation"
        let quotationTextAttributes = [
            NSAttributedStringKey.font: quotationTextFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        let quotationTextSize = quotationString.boundingRect(with: CGSize(width: imageRect.width, height: imageRect.height), options: .usesLineFragmentOrigin, attributes: quotationTextAttributes, context: nil).size
        let quotationTextRect = CGRect(x: headerRect!.maxX - quotationTextSize.width, y: imageRect.minY, width: quotationTextSize.width, height: quotationTextSize.height)

        quotationString.draw(with: quotationTextRect, options: .usesLineFragmentOrigin, attributes: quotationTextAttributes, context: nil)
        
        
        
        
        
        
        let merchantCopyNumberFont = UIFont(name: "Academy Engraved LET", size: 12)
        let merchantCopyNumber = "MERCHANT COPY NO# \(self.getQuote().quoteNumber)"

        let merchantCopyNumberTextAttributes = [
            NSAttributedStringKey.font: merchantCopyNumberFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        let merchantCopyNumberTextSize = merchantCopyNumber.boundingRect(with: CGSize(width: imageRect.width, height: imageRect.height), options: .usesLineFragmentOrigin, attributes: merchantCopyNumberTextAttributes, context: nil).size
        let merchantCopyNumberTextRect = CGRect(x: headerRect!.maxX - merchantCopyNumberTextSize.width, y: quotationTextRect.maxY, width: merchantCopyNumberTextSize.width, height: merchantCopyNumberTextSize.height)
        
        merchantCopyNumber.draw(with: merchantCopyNumberTextRect, options: .usesLineFragmentOrigin, attributes: merchantCopyNumberTextAttributes, context: nil)
        
        
        
        
        // Date
        // Same in all headers so this can be done here
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateFont = UIFont(name: "Academy Engraved LET", size: 12)
        var date = "Date here"
        
        let todaysDate = Date()
        date = "Date: \(dateFormatter.string(from: todaysDate))"
        
        let dateTextAttributes = [
            NSAttributedStringKey.font: dateFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        
        // Calculate center
        let bottomOfMerchantCopyNumber = merchantCopyNumberTextRect.maxY
        let topOfHeader = headerRect?.maxY
        
        let difference = (topOfHeader! - bottomOfMerchantCopyNumber) / 2
        print(difference)
        
        
        let dateTextSize = date.boundingRect(with: CGSize(width: imageRect.width, height: imageRect.height), options: .usesLineFragmentOrigin, attributes: dateTextAttributes, context: nil).size
        let dateTextRect = CGRect(x: headerRect!.maxX - dateTextSize.width, y: merchantCopyNumberTextRect.maxY + difference - (dateTextSize.height / 2), width: dateTextSize.width, height: dateTextSize.height)
        
        date.draw(with: dateTextRect, options: .usesLineFragmentOrigin, attributes: dateTextAttributes, context: nil)
        
        
        
        
        
        
        context.restoreGState()
        UIGraphicsPopContext()
        
    }
    
    func getQuote() -> Quote {
        // This should never be called
        return Quote(quotationNumber: "Override Me", clientName: "", clientAddress: "")
    }
    
    
}
