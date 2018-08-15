//
//  ExtraServicesTable.swift
//  Newman
//
//  Created by Ash Duckett on 11/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class ExtraServicesTable: GenericTable {
    var extraServices: [ExtraService]
    
    init(area: CGRect, headers: [GenericTableHeader], extraServices: [ExtraService]) {
        self.extraServices = extraServices
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
    
    func getExtraServices() -> [ExtraService] {
        return self.extraServices
    }
    
    override func renderData() {
        var nextY: CGFloat = 0
        var notRendered = false
        var extraServicesNotRendered = [ExtraService]()
        
        //        var servicesNotRendered = [Service]()
//        
        for extraService in extraServices {
//            
            var tallestTextInRow: CGFloat = 0
//            
            for (index, contentArea) in tableAreaRects.enumerated() {
//                
//                
                let headerTextFont = UIFont(name: "Academy Engraved LET", size: 12)
//                
                let headerTextAttributes = [
                    NSAttributedStringKey.font: headerTextFont,
                    NSAttributedStringKey.foregroundColor: UIColor.black
                ]
//                
                var testText: NSString = ""
//                
//                // Start to collect all
                let serviceName: NSString = extraService.name as NSString
                let serviceCost: NSString = String(extraService.price) as NSString
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
                let serviceNameHeight = getHeightOfString(string: serviceName, size: contentArea.size)
                let serviceCostHeight = getHeightOfString(string: serviceCost, size: contentArea.size)
                let heights = [serviceNameHeight, serviceCostHeight].max()
                
                if index == 0 {
                    testText = extraService.name as NSString
                } else if index == 1 {
                    testText = String(extraService.price) as NSString
                }

//                
//                // Obtain the height of the string obtained above
//                
                let height = testText.boundingRect(with: CGSize(width: contentArea.width, height: contentArea.height), options: .usesLineFragmentOrigin, attributes: headerTextAttributes, context: nil).size.height
//                
                let newTextRect = CGRect(x: contentArea.minX, y: contentArea.minY + nextY, width: contentArea.width, height: height)
//                
                if height > tallestTextInRow {
                    tallestTextInRow = height
                }
//                
                if contentArea.minY + nextY + heights! < contentArea.maxY && notRendered == false {
                    testText.draw(in: newTextRect, withAttributes: headerTextAttributes)
                } else {
                    notRendered = true
                    break
                }
            }
//            
            if notRendered {
                extraServicesNotRendered.append(extraService)
            }
//            
            nextY += tallestTextInRow
        }
        self.extraServices = extraServicesNotRendered
        // print("Extra services not rendered = \(extraServicesNotRendered)")
    }
    
    
    
}
