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
        super.init()
        // Create the header rect at the top and of 20 percent of the entire drawable height.
        headerRect = CGRect(x: marginLeft, y: marginTop, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 20)
        
        // Create the table rect at the top and of 70 percent of the entire drawable height.
        tableRect = CGRect(x: marginLeft, y: marginTop + (headerRect?.height)!, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 70)
        
        // Create the table footer at the top and of 70 percent of the entire drawable height.
        footerRect = CGRect(x: marginLeft, y: marginTop + (headerRect?.height)! + (tableRect?.height)!, width: (getDrawableRect()?.width)!, height: (getDrawableRect()?.height)! / 100 * 10)
        
    }
    
    func renderHeaderRect() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(headerRect!)
        context.drawPath(using: .stroke)
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
    
    
}
