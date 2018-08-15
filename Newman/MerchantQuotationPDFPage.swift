//
//  MerchantQuotationPDFPage.swift
//  Newman
//
//  Created by Ash Duckett on 10/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

struct MerchantQuotationPDFPageData {
    var services: [Service]
    var extraServices: [ExtraService]
}


// Struct to represent headers along with their percentage widths
struct GenericTableHeader {
    var text: NSString
    var percentageWidth: CGFloat
}

// One class for tables, header drawing, area calculating or whatever's generic, and then subclass to fill in the data
class GenericTable {
    let headerHeight: CGFloat = 25
    var headers: [GenericTableHeader]?
    var area: CGRect?
    var tableAreaRects = [CGRect]()
    
    init(area: CGRect, headers: [GenericTableHeader]) {
        self.headers = headers
        self.area = area
    }
    
    func renderHeaderContainerRect() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Draw outline around header container
        let headerContainingRect = CGRect(x: (area?.minX)!, y: (area?.minY)!, width: (area?.width)!, height: 25)
        context.addRect(headerContainingRect)
        context.setStrokeColor(UIColor(red: 250 / 255, green: 182 / 255, blue: 48 / 255, alpha: 1).cgColor)
        context.setLineWidth(2)
        context.drawPath(using: .stroke)
        context.setLineWidth(1)

    }
    
    
    
    func render() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
    
        var currentLeft = area!.minX
    
        if let headers = self.headers {
            for header in headers {
                let headerRect = CGRect(x: currentLeft, y: area!.minY, width: area!.width / 100 * header.percentageWidth, height: headerHeight)

                let headerTextFont = UIFont(name: "MyriadPro-Regular", size: 12)
            
                let headerTextAttributes = [
                    NSAttributedStringKey.font: headerTextFont,
                    NSAttributedStringKey.foregroundColor: UIColor.black
                ]
            
                // Find the size of the text before it's rendered so that it may be centered
                var headerTextSize = header.text.size(withAttributes: headerTextAttributes)
                let headerTextRect = CGRect(x: (headerRect.minX + headerRect.width / 2) - (headerTextSize.width / 2), y: headerRect.minY + headerRect.height / 2 - headerTextSize.height / 2, width: headerTextSize.width, height: headerTextSize.height)
                header.text.draw(in: headerTextRect, withAttributes: headerTextAttributes)
            
            
                // Calculate the content areas for each column
                var contentArea = CGRect(x: currentLeft, y: headerRect.maxY, width: headerRect.width, height: (area?.height)! - headerHeight)
                tableAreaRects.append(contentArea)
                
                // Draw the gray lines for the segments of the table
                context.addRect(contentArea)
                context.setStrokeColor(UIColor.lightGray.cgColor)
                context.drawPath(using: .stroke)
                currentLeft += headerRect.width
            
            }
        }
        
        renderData()
        renderHeaderContainerRect()
    }
    
    func renderData() {
        // To be overridden. Why doesn't Swift allow for abstract classes and functions?
        print("You should have subclassed GenericTable and overriden this method you fool.")
    }
    
    
}

class ServiceQuoteTable: GenericTable {
    var services: [Service]

    init(area: CGRect, headers: [GenericTableHeader], services: [Service]) {
        self.services = services
        super.init(area: area, headers: headers)
    }

    func getHeightOfString(string: NSString, size: CGSize) -> CGFloat {
        let headerTextFont = UIFont(name: "MyriadPro-Regular", size: 12)
        
        let headerTextAttributes = [
            NSAttributedStringKey.font: headerTextFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        let height = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height
        
        return height
    }
    
    func getServices() -> [Service] {
        return self.services
    }
    
    override func renderData() {
        var nextY: CGFloat = 0
        var notRendered = false
        var servicesNotRendered = [Service]()
        
        for service in services {
            
            var tallestTextInRow: CGFloat = 0

            for (index, contentArea) in tableAreaRects.enumerated() {


                let headerTextFont = UIFont(name: "MyriadPro-Regular", size: 12)

                let headerTextAttributes = [
                    NSAttributedStringKey.font: headerTextFont,
                    NSAttributedStringKey.foregroundColor: UIColor.black
                ]

                var testText: NSString = ""
                
                // Start to collect all
                let serviceName: NSString = service.name as NSString
                
                var materialNameAccumulator = ""
                
                for material in service.materials {
                    materialNameAccumulator += material.name + "\n"
                }
                
                let materialName = materialNameAccumulator
                
                var materialAmountAccumulator = ""
                
                for material in service.materials {
                    materialAmountAccumulator += String(material.amount) + "\n"
                }
                let materialAmount = materialAmountAccumulator
                
                let materialElevation = String(service.elevation)
                let materialDetails = service.details
                let materialCost = String(service.cost)
                
                
                let serviceNameHeight = getHeightOfString(string: serviceName, size: contentArea.size)
                let materialNameHeight = getHeightOfString(string: materialName as NSString, size: contentArea.size)
                let materialAmountHeight = getHeightOfString(string: materialAmount as NSString, size: contentArea.size)
                let materialElevationHeight = getHeightOfString(string: materialElevation as NSString, size: contentArea.size)
                let materialDetailsHeight = getHeightOfString(string: materialDetails as NSString, size: contentArea.size)
                let materialCostHeight = getHeightOfString(string: materialCost as NSString, size: contentArea.size)
                let heights = [serviceNameHeight, materialNameHeight, materialAmountHeight, materialElevationHeight, materialDetailsHeight, materialCostHeight].max()

                
                if index == 0 {
                    testText = service.name as NSString
                } else if index == 1 {
                    var accumulator = ""
                    for material in service.materials {
                        accumulator += material.name + "\n"
                    }
                    testText = accumulator as NSString
                } else if index == 2 {
                    var accumulator = ""
                    for material in service.materials {
                        accumulator += String(material.amount) + "\n"
                    }
                    testText = accumulator as NSString
                } else if index == 3 {
                    testText = String(service.elevation) as NSString
                } else if index == 4 {
                    testText = service.details as NSString
                } else if index == 5 {
                    testText = String(service.cost) as NSString
                }

                // Obtain the height of the string obtained above

                let height = testText.boundingRect(with: CGSize(width: contentArea.width, height: contentArea.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height

                let newTextRect = CGRect(x: contentArea.minX + 5, y: contentArea.minY + nextY + 5, width: contentArea.width, height: height)

                if height > tallestTextInRow {
                    tallestTextInRow = height
                }
                
                if contentArea.minY + nextY + heights! < contentArea.maxY && notRendered == false {
                    testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
                } else {
                    notRendered = true
                    break
                }
            }
            
            if notRendered {
                servicesNotRendered.append(service)
            }
            
            nextY += tallestTextInRow
        }
        self.services = servicesNotRendered
    }
    
    
    
    
}

class MerchantQuotationPDFPage: NewmanPDFPage {
    var serviceTableRect: CGRect?
    var extrasTableRect: CGRect?
    var data: MerchantQuotationPDFPageData
    var quote: Quote?
    
    init(data: MerchantQuotationPDFPageData, quote: Quote) {
        self.data = data
        self.quote = quote
    }
    
    func getServices() -> [Service] {
        //return self.data.services
        return (self.quote?.services)!
    }
    
    func getExtraServices() -> [ExtraService] {
        //return self.data.extraServices
        return (self.quote?.extraServices)!
    }
    
    func renderServiceTable() {
        // This should be 80% of the height of the table area and should start at the top of this rect.
        serviceTableRect = CGRect(x: marginLeft, y: tableRect!.minY, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 80)
    
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //context.addRect(getDrawableRect()!)
        context.drawPath(using: .stroke)
        context.setFillColor(UIColor.white.cgColor)
        context.fill(serviceTableRect!)
    
        
        let serviceHeader = GenericTableHeader(text: "SERVICE", percentageWidth: 16.666)
        let materialHeader = GenericTableHeader(text: "MATERIAL", percentageWidth: 16.666)
        let amountHeader = GenericTableHeader(text: "AMOUNT", percentageWidth: 16.666)
        let elevationHeader = GenericTableHeader(text: "ELEVATION", percentageWidth: 16.666)
        let detailsHeader = GenericTableHeader(text: "DETAILS", percentageWidth: 16.666)
        let priceHeader = GenericTableHeader(text: "", percentageWidth: 16.666)
        
        // Create a table instance
        let serviceTable = ServiceQuoteTable(area: serviceTableRect!, headers: [serviceHeader, materialHeader, amountHeader, elevationHeader, detailsHeader, priceHeader], services: (self.quote?.services)!)
        serviceTable.render()
        //self.data.services = serviceTable.getServices()
        self.quote?.services = serviceTable.getServices()
    }
    
    func renderExtrasTable() {
        // This should be 20% of the height of the table area and should start at the bottom of the service table.
        extrasTableRect = CGRect(x: marginLeft, y: marginTop + headerRect!.height + tableRect!.height / 100 * 80, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 20)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //context.addRect(getDrawableRect()!)
        context.drawPath(using: .stroke)
        context.setFillColor(UIColor.white.cgColor)
        context.fill(extrasTableRect!)
        
        let extraServicesHeader = GenericTableHeader(text: "EXTRA SERVICES", percentageWidth: 80)
        let expectedCostHeader = GenericTableHeader(text: "EXPECTED COST", percentageWidth: 20)
        
        //let extraService1 = ExtraService(name: "Extra Service 1", price: 100.00)
        
        let extraServicesTable = ExtraServicesTable(area: extrasTableRect!, headers: [extraServicesHeader, expectedCostHeader], extraServices: (self.quote?.extraServices)!)
        extraServicesTable.render()
        //self.data.extraServices = extraServicesTable.getExtraServices()
        self.quote?.extraServices = extraServicesTable.getExtraServices()
    }
    
    func getNextPage() {
        prepareForNewPage()
        //renderDrawableAreaOutline()
        renderHeaderRect()
        //renderTableRect()
        renderFooterRect()
        renderServiceTable()
        renderExtrasTable()
        
    }
    
    override func getQuote() -> Quote {
        return self.quote!
    }
}
