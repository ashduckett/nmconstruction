//
//  File.swift
//  Newman
//
//  Created by Ash Duckett on 08/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

struct TableContentArea {
    var area: CGRect
    var remainingHeight: CGFloat
}


/* A table section encapsulates n number of tables so they can be split and customised as much as needed */
class TableSection: RenderableSection {
    var currentY: CGFloat?
    var tables = [Table]()
    
    override init() {
        super.init()
        nextContentAreaTop = self.pdfTopMargin + ((self.mainContentRect?.height)! / 100 * 20)
    }
    
    override func render() {
        
        super.render()
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.black.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(mainContentRect!)
        context.drawPath(using: .stroke)
        context.fill(mainContentRect!)
        context.stroke(mainContentRect!)
        
        for table in tables {
            table.render()
        }
    }
    

    
    
    // When you append a table it should set its own Y.
    func appendTable(table: Table) {
        self.tables.append(table)
        self.appendSection(heightPercent: table.percentOfTableSection, section: table)
    }
}




/* A table, as opposed to a table area, is a clear definition of headers and tabulated content */
class Table: RenderableSection {
    var headers: [Header]?
    var tableContentAreas = [TableContentArea]()
    let pdfTableHeaderHeight: CGFloat = 25
    var percentOfTableSection: CGFloat = 0
    var data = [[String]]()
    
    init(percentOfTableSection: CGFloat, headers: [Header]?, data: [[String]]) {
        super.init()
        self.headers = headers
        self.percentOfTableSection = percentOfTableSection
        self.data = data
    }
    
    override func render() {
        // Initialise the content areas based on the table and based on the headers
        super.render()
        print("Header count is \(headers!.count)" )
    
        tableContentAreas = [TableContentArea]()
        var currentContentRectLeft = self.mainContentRect?.minX
        if let headers = headers {
            for header in headers {
                var tableContentArea = TableContentArea(area: CGRect(x: currentContentRectLeft!, y: (self.mainContentRect?.minY)! + pdfTableHeaderHeight, width: (self.mainContentRect?.width)! / 100 * header.percentOfWidth, height: (self.mainContentRect?.height)! - pdfTableHeaderHeight), remainingHeight: (self.mainContentRect?.height)! - pdfHeaderHeight)
                
                tableContentAreas.append(tableContentArea)
                
                currentContentRectLeft = tableContentArea.area.maxX
                
            }
        }
        
        print("TABLE CONTENT AREAS \(tableContentAreas.count)")
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        print("Calling render on table header section")
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(mainContentRect!)
        context.drawPath(using: .stroke)
        context.fill(mainContentRect!)
        context.stroke(mainContentRect!)
        renderHeaderSection()
        
        
        for area in tableContentAreas {
            context.setStrokeColor(UIColor.black.cgColor)
            context.addRect(area.area)
            context.drawPath(using: .stroke)
            context.stroke(mainContentRect!)
        }
        
        renderData()
        
    }
    
    func renderData() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        var nextY: CGFloat = 0
        for row in data {
            var tallestTextInRow: CGFloat = 0
            
            for (index, contentArea) in tableContentAreas.enumerated() {
                print(index)
                //
                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)

                let headerTextAttributes = [
                    NSAttributedStringKey.font: headerTextFont,
                    NSAttributedStringKey.foregroundColor: UIColor.black
                ]
                //print("Index is \(index)    \()")
                let testText: NSString = row[index] as! NSString

                // Obtain the height of the string obtained above

                let height = testText.boundingRect(with: CGSize(width: contentArea.area.width, height: contentArea.area.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height



                //print("Height of current rect is \(height)")


                // Calculate a new rect
                let newTextRect = CGRect(x: contentArea.area.minX, y: contentArea.area.minY + nextY, width: contentArea.area.width, height: contentArea.area.height)

                if height > tallestTextInRow {
                    tallestTextInRow = height
                }


                testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
            }
            nextY += tallestTextInRow
            
        }
    }
    
    func renderHeaderSection() {
        let headersContainer = TableHeaderSection(table: self, headers: headers)
        headersContainer.render()
    }
}


class TableHeaderSection: RenderableSection {
    let pdfTableHeaderHeight: CGFloat = 25
    var headers: [Header]?
    
    init(table: RenderableSection, headers: [Header]?) {
        super.init()
        self.headers = headers
        
        mainContentRect = CGRect(x: (table.mainContentRect?.minX)!, y: (table.mainContentRect?.minY)!, width: (table.mainContentRect?.width)!, height: pdfTableHeaderHeight)
    }
    
    override func render() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        print("Calling render on table header section")
        
        context.setStrokeColor(UIColor.orange.cgColor)
        context.addRect(mainContentRect!)
        context.drawPath(using: .stroke)
        let containerRect = mainContentRect!
        var currentLeft = containerRect.minX
        
        if let headers = self.headers {
            for header in headers {
                let headerRect = CGRect(x: currentLeft, y: containerRect.minY, width: containerRect.width / 100 * header.percentOfWidth, height: containerRect.height)
                    currentLeft += headerRect.width

                    let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
                
                    let headerTextAttributes = [
                        NSAttributedStringKey.font: headerTextFont,
                        NSAttributedStringKey.foregroundColor: UIColor.black
                    ]
                
                    // Find the size of the text before it's rendered so that it may be centered
                    var headerTextSize = header.text.size(withAttributes: headerTextAttributes)
                    let headerTextRect = CGRect(x: (headerRect.minX + headerRect.width / 2) - (headerTextSize.width / 2), y: headerRect.minY + headerRect.height / 2 - headerTextSize.height / 2, width: headerTextSize.width, height: headerTextSize.height)
                        header.text.draw(in: headerTextRect, withAttributes: headerTextAttributes)
            }
        }
    }
}


