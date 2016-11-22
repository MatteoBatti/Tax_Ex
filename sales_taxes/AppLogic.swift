//
//  SaleTaxes.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation


class AppLogic {
    
    class func computeOutput(input: String) -> (tax: String?, total: String?)? {
        let lines = Parser.split(input: input)
        let products = lines.map({Parser.getProduct(inputLine: $0)}) as? [Product]
        if let products = products {
            let tax = getTotalTax(products: products).1
            let total = getTotal(products: products)
            return (tax, total)
        }
        return nil
    }
    
    class func getTotalTax(products: [Product]) -> (Double, String?) {
        let totalTax = products.map({Math.calculateTax(price: $0.getPrice(), tax: $0.tax())}).reduce(0.0,+)
        let formatter = TaxNumberFormatter(patten: .TwoDecimal)
        return (totalTax, formatter.formatPrice(price: totalTax))
    }
    
    class func getTotal(products: [Product]) -> String? {
        let total = products.map({$0.getPrice()}).reduce(0.0, +)
        let tax = getTotalTax(products: products)
        let totalWithTax = total + tax.0
        let formatter = TaxNumberFormatter(patten: .TwoDecimal)
        return formatter.formatPrice(price: totalWithTax)
    }
    
}
