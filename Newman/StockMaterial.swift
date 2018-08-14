//
//  StockMaterial.swift
//  Newman
//
//  Created by Ash Duckett on 14/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation

struct StockMaterial {
    var name: String
    var cost: Double
}

class StockMaterials {
    class func getStockMaterials() -> [StockMaterial] {
        
        let concrete = StockMaterial(name: "Concrete", cost: 30.00)
        let stone = StockMaterial(name: "Stone", cost: 100.00)
        let brick = StockMaterial(name: "Brick", cost: 50.00)
        let metal = StockMaterial(name: "Metal", cost: 60.00)
        let wood = StockMaterial(name: "Wood", cost: 30.00)
        
        return [
            concrete,
            stone,
            brick,
            metal,
            wood
        ]
    }
}
