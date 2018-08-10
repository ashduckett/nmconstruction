//
//  PDFPage.swift
//  Newman
//
//  Created by Ash Duckett on 10/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class PDFPage {
    let marginLeft: CGFloat = 10
    let marginRight: CGFloat = 10
    let marginTop: CGFloat = 10
    let marginBottom: CGFloat = 10
    
    func getDrawableRect() -> CGRect? {
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        return CGRect(x: marginLeft, y: marginTop, width: context.boundingBoxOfClipPath.width - marginRight - marginLeft, height: context.boundingBoxOfClipPath.height - marginBottom - marginTop)
    }
    
    func renderDrawableAreaOutline() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(getDrawableRect()!)
        context.drawPath(using: .stroke)
    }
    
}
