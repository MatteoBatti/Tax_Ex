//
//  SaleTaxes.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation


class AppLogic {
    
    class func getTaxAndTotal(input: String) -> (products: [Product], tax: String?, total: String?)? {
        let lines = Parser.splitLine(input: input)
        let products = lines.map({Parser.getProduct(inputLine: $0)}) as? [Product]
        if let products = products {
            let tax = getTotalTax(products: products).1
            let total = getTotal(products: products)
            return (products, tax, total)
        }
        return nil
    }
    
    class func getBill(input: String) -> String? {
        let datas = getTaxAndTotal(input: input)
        if let datas = datas {
            var result: String = ""
            for product in datas.products {
                let formatter = PriceNumberFormatter(patten: .TwoDecimal)
                let formattedPrice = formatter.formatPrice(price: product.getPriceWithTax())
                if let formattedPrice = formattedPrice {
                    result = result + "\(product.quantity) " + "\(product.getDescription()): " + formattedPrice + "\n"
                }
            }
            if let tax = datas.tax {
                 result = result + "Sales Taxes: " + tax + "\n"
            }
            if let total = datas.total {
                result = result + "Total: " + total
            }
            return result.condensedWhitespace()
        }
        return nil
    }
    
    class func getTotalTax(products: [Product]) -> (Double, String?) {
        let totalTax = products.map({$0.getTaxAmount()}).reduce(0.0,+)
        let formatter = PriceNumberFormatter(patten: .TwoDecimal)
        return (totalTax, formatter.formatPrice(price: totalTax))
    }
    
    class func getTotal(products: [Product]) -> String? {
        let total = products.map({$0.getPrice()}).reduce(0.0, +)
        let tax = getTotalTax(products: products)
        let totalWithTax = total + tax.0
        let formatter = PriceNumberFormatter(patten: .TwoDecimal)
        return formatter.formatPrice(price: totalWithTax)
    }
    
}
