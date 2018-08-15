//
//  RightPaddedTextField.swift
//  Newman
//
//  Created by Ash Duckett on 14/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation
import UIKit

class RightPaddedTextField: UITextField {
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightBounds = CGRect(x: bounds.size.width - 35, y: 15, width: 27, height: 20)
        return rightBounds
    }
}
