//
//  Quote.swift
//  Newman
//
//  Created by Ash Duckett on 13/08/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import Foundation

class Quote {
    var clientName: String
    var clientAddress: String
    var quoteNumber: String
    
    init(quotationNumber: String, clientName: String, clientAddress: String) {
        self.quoteNumber = quotationNumber
        self.clientName = clientName
        self.clientAddress = clientAddress
    }
}
