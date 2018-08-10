//import Foundation
//import UIKit
//
//class AnotherTable: RenderableSection {
//    var headers: [Header]?
//    var tableContentAreas = [TableContentArea]()
//    let pdfTableHeaderHeight: CGFloat = 25
//    var percentOfTableSection: CGFloat = 0
//    var data = [[String]]()
//    
//    init(percentOfTableSection: CGFloat, headers: [Header]?, data: [[String]]) {
//        super.init()
//        self.headers = headers
//        self.percentOfTableSection = percentOfTableSection
//        self.data = data
//    }
//    
//    override func render() {
//        // Initialise the content areas based on the table and based on the headers
//        super.render()
//        print("Header count is \(headers!.count)" )
//        
//        tableContentAreas = [TableContentArea]()
//        var currentContentRectLeft = self.mainContentRect?.minX
//        if let headers = headers {
//            for header in headers {
//                var tableContentArea = TableContentArea(area: CGRect(x: currentContentRectLeft!, y: (self.mainContentRect?.minY)! + pdfTableHeaderHeight, width: (self.mainContentRect?.width)! / 100 * header.percentOfWidth, height: (self.mainContentRect?.height)! - pdfTableHeaderHeight), remainingHeight: (self.mainContentRect?.height)! - pdfHeaderHeight)
//                
//                tableContentAreas.append(tableContentArea)
//                
//                currentContentRectLeft = tableContentArea.area.maxX
//                
//            }
//        }
//        
//        print("TABLE CONTENT AREAS \(tableContentAreas.count)")
//        
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        print("Calling render on table header section")
//        
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.setFillColor(UIColor.white.cgColor)
//        context.addRect(mainContentRect!)
//        context.drawPath(using: .stroke)
//        context.fill(mainContentRect!)
//        context.stroke(mainContentRect!)
//        renderHeaderSection()
//        
//        
//        for area in tableContentAreas {
//            context.setStrokeColor(UIColor.black.cgColor)
//            context.addRect(area.area)
//            context.drawPath(using: .stroke)
//            context.stroke(mainContentRect!)
//        }
//        
//        renderData()
//        
//    }
//    
//    func renderData() {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        var nextY: CGFloat = 0
//        for row in data {
//            var tallestTextInRow: CGFloat = 0
//            
//            for (index, contentArea) in tableContentAreas.enumerated() {
//                print(index)
//                //
//                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
//                
//                let headerTextAttributes = [
//                    NSAttributedStringKey.font: headerTextFont,
//                    NSAttributedStringKey.foregroundColor: UIColor.black
//                ]
//                //print("Index is \(index)    \()")
//                let testText: NSString = row[index] as! NSString
//                
//                // Obtain the height of the string obtained above
//                
//                let height = testText.boundingRect(with: CGSize(width: contentArea.area.width, height: contentArea.area.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height
//                
//                
//                
//                //print("Height of current rect is \(height)")
//                
//                
//                // Calculate a new rect
//                let newTextRect = CGRect(x: contentArea.area.minX, y: contentArea.area.minY + nextY, width: contentArea.area.width, height: contentArea.area.height)
//                
//                if height > tallestTextInRow {
//                    tallestTextInRow = height
//                }
//                
//                
//                testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
//            }
//            nextY += tallestTextInRow
//            
//        }
//    }
//    
//    func renderHeaderSection() {
//        let headersContainer = TableHeaderSection(table: self, headers: headers)
//        headersContainer.render()
//    }
//}
