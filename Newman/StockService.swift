//
//  StockService.swift
//  Newman
//
//  Created by Ash Duckett on 14/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation

struct StockService {
    var name: String
}

class StockServices {
    
    
    class func getStockServices() -> [StockService] {
        return [
            StockService(name: "Water Proofing"),
            StockService(name: "Structural"),
            StockService(name: "Brick Repair/Tint"),
            StockService(name: "Concrete Repair"),
            StockService(name: "Stone Repair"),
        ]
    }
}
