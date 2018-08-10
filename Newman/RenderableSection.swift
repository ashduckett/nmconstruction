//
//  File.swift
//  Newman
//
//  Created by Ash Duckett on 08/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class RenderableSection {
    var mainContentRect: CGRect?
    var contentAreas = [RenderableSection]()
    var nextContentAreaTop: CGFloat?
    
    let pdfLeftMargin: CGFloat = 10
    let pdfRightMargin: CGFloat = 10
    let pdfTopMargin: CGFloat = 10
    let pdfBottomMargin: CGFloat = 10
    
    let pdfHeaderTopMargin: CGFloat = 10
    let pdfHeaderBottomMargin: CGFloat = 10
    let pdfHeaderHeight: CGFloat = 200
    //let pdfHeaderWidth: CGFloat?
    let pdfFooterHeight: CGFloat = 75
    let pdfFooterTopMargin: CGFloat = 10
    let pdfFooterBottomMargin: CGFloat = 10
    var nextYPosition: CGFloat = 0
    var topOfFooter: CGFloat = 0
    
    init() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        self.mainContentRect = CGRect(x: pdfLeftMargin, y: pdfTopMargin, width: context.boundingBoxOfClipPath.width - (pdfLeftMargin + pdfRightMargin), height: context.boundingBoxOfClipPath.height - (pdfTopMargin + pdfBottomMargin))

        nextContentAreaTop = mainContentRect?.minY
        
    }
    
    func render() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(mainContentRect!)
        context.drawPath(using: .stroke)
    
        for area in contentAreas {
            
            print("nextContentAreaTop \(nextContentAreaTop!)")
            area.render()
            
        }
    }
    
    func appendSection(heightPercent: CGFloat, section: RenderableSection) {
        section.mainContentRect = CGRect(x: (mainContentRect?.minX)!, y: nextContentAreaTop!, width: (mainContentRect?.width)!, height: (mainContentRect?.height)! / 100 * heightPercent)
        contentAreas.append(section)
        nextContentAreaTop = nextContentAreaTop! + (section.mainContentRect?.height)!
    }
    
    func addSubView(subview: RenderableSection) {
        
    }
    
    
    
    
    
}
