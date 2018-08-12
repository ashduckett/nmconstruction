//
//  Service.swift
//  Newman
//
//  Created by Ash Duckett on 11/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation

struct Service {
    var name: String
    var materials: [Material]
    var elevation: Int
    var details: String
    var cost: Double
    
    var surveyImages: [String]
    var surveyDrawings: [String]
}
