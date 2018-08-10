//
//  MerchantQuotationPDFPage.swift
//  Newman
//
//  Created by Ash Duckett on 10/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

struct Material {
    var name: String
    var amount: Int
}

struct Service {
    var name: String
    var materials: [Material]
    var elevation: Int
    var details: String
    var cost: Double
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
    
    func render() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
    
        var currentLeft = area!.minX
    
        if let headers = self.headers {
            for header in headers {
                let headerRect = CGRect(x: currentLeft, y: area!.minY, width: area!.width / 100 * header.percentageWidth, height: headerHeight)
                
                context.addRect(headerRect)
                context.drawPath(using: .stroke)
                context.setFillColor(UIColor.black.cgColor)
                //context.fill(headerRect)
                
                
            
                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
            
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
                context.addRect(contentArea)
                context.drawPath(using: .stroke)
                
                currentLeft += headerRect.width
            
            }
        }
        
        renderData()
    }
    
    func renderData() {
        // To be overridden
    }
    
    
}

class ServiceQuoteTable: GenericTable {
    var services: [Service]

    init(area: CGRect, headers: [GenericTableHeader], services: [Service]) {
        self.services = services
        super.init(area: area, headers: headers)
    }
    
    //func getStringHeight(string: NSString) -> CGFloat {
        
    //}
    
    override func renderData() {
        var nextY: CGFloat = 0
        guard let context = UIGraphicsGetCurrentContext() else { return }
       
        for service in services {
            var tallestTextInRow: CGFloat = 0

            for (index, contentArea) in tableAreaRects.enumerated() {


                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)

                let headerTextAttributes = [
                    NSAttributedStringKey.font: headerTextFont,
                    NSAttributedStringKey.foregroundColor: UIColor.black
                ]

                var testText: NSString = ""
                
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

                let newTextRect = CGRect(x: contentArea.minX, y: contentArea.minY + nextY, width: contentArea.width, height: height)

                if height > tallestTextInRow {
                    tallestTextInRow = height
                }

                print("Content Area max y \(contentArea.maxY)")
                print("New Text Rect max y \(newTextRect.maxY)")
                
                if newTextRect.maxY < contentArea.maxY {
                    testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
                }
            }
            nextY += tallestTextInRow

        }
        
        
        
        
    }
    
    
}

class MerchantQuotationPDFPage: NewmanPDFPage {
    var serviceTableRect: CGRect?
    var extrasTableRect: CGRect?
    
    func renderServiceTable() {
        // This should be 80% of the height of the table area and should start at the top of this rect.
        serviceTableRect = CGRect(x: marginLeft, y: tableRect!.minY, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 80)
    
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(getDrawableRect()!)
        context.drawPath(using: .stroke)
        context.setFillColor(UIColor.red.cgColor)
        context.fill(serviceTableRect!)
    
        
        let serviceHeader = GenericTableHeader(text: "SERVICE", percentageWidth: 16.666)
        let materialHeader = GenericTableHeader(text: "MATERIAL", percentageWidth: 16.666)
        let amountHeader = GenericTableHeader(text: "AMOUNT", percentageWidth: 16.666)
        let elevationHeader = GenericTableHeader(text: "ELEVATION", percentageWidth: 16.666)
        let detailsHeader = GenericTableHeader(text: "DETAILS", percentageWidth: 16.666)
        let priceHeader = GenericTableHeader(text: "", percentageWidth: 16.666)
        
        
        
        
        // Construct dummy data:
        let material1 = Material(name: "Material One", amount: 5)
        let material2 = Material(name: "Material Two", amount: 10)
        
        let service = Service(name: "Water Proofing", materials: [material1, material2], elevation: 5, details: "W", cost: 55.55)
        let electrics = Service(name: "Electrix", materials: [material1, material2], elevation: 5, details: "A", cost: 200.50)
                // End dummy data
        
        
        
        // Create a table instance
        let serviceTable = ServiceQuoteTable(area: serviceTableRect!, headers: [serviceHeader, materialHeader, amountHeader, elevationHeader, detailsHeader, priceHeader], services: [service, electrics, service, service, service, service, electrics, electrics, electrics, electrics, electrics])
        serviceTable.render()
    
    }
    
    func renderExtrasTable() {
        // This should be 20% of the height of the table area and should start at the bottom of the service table.
        extrasTableRect = CGRect(x: marginLeft, y: marginTop + headerRect!.height + tableRect!.height / 100 * 80, width: (getDrawableRect()?.width)!, height: tableRect!.height / 100 * 20)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(getDrawableRect()!)
        context.drawPath(using: .stroke)
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(extrasTableRect!)
        
        
        
        
        
    }
    
    
    
    func renderTable(headers: [String]) {
        
    }
    
    
}
