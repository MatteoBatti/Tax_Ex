//
//  Math.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation


class Math {
    
    class func calculateTax(price: Double, tax: Double) -> Double {
        return Math.roundPrice(price:(price*tax)/100.0)
    }
    
    class func calculatePrice(price: Double, tax: Double) -> Double {
        return  price + Math.calculateTax(price: price, tax: tax)
    }
    
    class func roundPrice(price: Double) -> Double {
        return 0.05 * ceil( price / 0.05 )
    }
    
}
