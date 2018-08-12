//
//  ImageNotesTable.swift
//  Newman
//
//  Created by Ash Duckett on 12/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class ImageNotesTable: GenericTable {
    var notes: String
    
    init(area: CGRect, headers: [GenericTableHeader], notes: String) {
        self.notes = notes
        super.init(area: area, headers: headers)
    }
    
    func getHeightOfString(string: NSString, size: CGSize) -> CGFloat {
        let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
        
        let headerTextAttributes = [
            NSAttributedStringKey.font: headerTextFont,
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        
        let height = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height
        
        return height
    }
    
    //func getServices() -> [Service] {
        //return self.services
    //}
    
    override func renderData() {
//        var nextY: CGFloat = 0
//        var notRendered = false
//        var servicesNotRendered = [Service]()
//
//        for service in services {
//
//            var tallestTextInRow: CGFloat = 0
//
//            for (index, contentArea) in tableAreaRects.enumerated() {
//
//
//                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
//
//                let headerTextAttributes = [
//                    NSAttributedStringKey.font: headerTextFont,
//                    NSAttributedStringKey.foregroundColor: UIColor.black
//                ]
//
//                var testText: NSString = ""
//
//                // Start to collect all
//                let serviceName: NSString = service.name as NSString
//
//                var materialNameAccumulator = ""
//
//                for material in service.materials {
//                    materialNameAccumulator += material.name + "\n"
//                }
//
//                let materialName = materialNameAccumulator
//
//                var materialAmountAccumulator = ""
//
//                for material in service.materials {
//                    materialAmountAccumulator += String(material.amount) + "\n"
//                }
//                let materialAmount = materialAmountAccumulator
//
//                let materialElevation = String(service.elevation)
//                let materialDetails = service.details
//                let materialCost = String(service.cost)
//
//
//                let serviceNameHeight = getHeightOfString(string: serviceName, size: contentArea.size)
//                let materialNameHeight = getHeightOfString(string: materialName as NSString, size: contentArea.size)
//                let materialAmountHeight = getHeightOfString(string: materialAmount as NSString, size: contentArea.size)
//                let materialElevationHeight = getHeightOfString(string: materialElevation as NSString, size: contentArea.size)
//                let materialDetailsHeight = getHeightOfString(string: materialDetails as NSString, size: contentArea.size)
//                let materialCostHeight = getHeightOfString(string: materialCost as NSString, size: contentArea.size)
//                let heights = [serviceNameHeight, materialNameHeight, materialAmountHeight, materialElevationHeight, materialDetailsHeight, materialCostHeight].max()
//
//
//                if index == 0 {
//                    testText = service.name as NSString
//                } else if index == 1 {
//                    var accumulator = ""
//                    for material in service.materials {
//                        accumulator += material.name + "\n"
//                    }
//                    testText = accumulator as NSString
//                } else if index == 2 {
//                    var accumulator = ""
//                    for material in service.materials {
//                        accumulator += String(material.amount) + "\n"
//                    }
//                    testText = accumulator as NSString
//                } else if index == 3 {
//                    testText = String(service.elevation) as NSString
//                } else if index == 4 {
//                    testText = service.details as NSString
//                } else if index == 5 {
//                    testText = String(service.cost) as NSString
//                }
//
//                // Obtain the height of the string obtained above
//
//                let height = testText.boundingRect(with: CGSize(width: contentArea.width, height: contentArea.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height
//
//                let newTextRect = CGRect(x: contentArea.minX, y: contentArea.minY + nextY, width: contentArea.width, height: height)
//
//                if height > tallestTextInRow {
//                    tallestTextInRow = height
//                }
//
//                if contentArea.minY + nextY + heights! < contentArea.maxY && notRendered == false {
//                    testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
//                } else {
//                    notRendered = true
//                    break
//                }
//            }
//
//            if notRendered {
//                servicesNotRendered.append(service)
//            }
//
//            nextY += tallestTextInRow
//        }
//        self.services = servicesNotRendered
    }
    
    
    
}

