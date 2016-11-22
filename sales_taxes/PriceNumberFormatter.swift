//
//  NumberFormatter.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation

enum PriceNumberPattern: String {
    
    case TwoDecimal = "#,##0.00"    
}

class PriceNumberFormatter: NumberFormatter {
    
    convenience init(patten: PriceNumberPattern) {
        self.init()
        self.locale = Locale(identifier: "us")
        self.positiveFormat = patten.rawValue
    }

    func formatPrice(price: Double) -> String? {
        self.numberStyle = .decimal
        return self.string(from: NSNumber(value: price))
    }
    
    func formatPercentage(perc: Double) -> String? {
        self.numberStyle = .percent
        self.multiplier = 1
        return self.string(from: NSNumber(value: perc))
    }
    
}
