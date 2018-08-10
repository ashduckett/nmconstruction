//
//  HeaderSection.swift
//  Newman
//
//  Created by Ash Duckett on 08/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class HeaderSection: RenderableSection {
    override init() {
        super.init()
    }
    
    override func render() {
        print("Calling render inside header section")
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addRect(mainContentRect!)
        context.drawPath(using: .stroke)
    }
}
