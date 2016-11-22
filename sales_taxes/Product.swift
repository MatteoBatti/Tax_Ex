//
//  Category.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation


protocol ProductInterface {
    func tax() -> Double
    func taxDescription() -> String
}

enum ProductType {
    case Book
    case Drug
    case Food
    case Others
    
    func tax() -> Double {
        switch self {
        case .Others:
            return 10.0
        default:
            return 0.0
        }
    }
    
    
    
    func importTax() -> Double {
        switch self {
        default:
            return 5.0
        }
    }
}

class Product: ProductInterface {
    
    var type : ProductType
    var imported: Bool
    var mainTax: Double
    var importedTax: Double
    var description: String
    private var price: Double
    var quantity: Int
    
    init(type: ProductType, price: Double, quantity: Int, imported: Bool, description: String) {
        self.type = type
        self.mainTax = self.type.tax()
        self.importedTax = self.type.importTax()
        self.price = price
        self.imported = imported
        self.description = description
        self.quantity = quantity
    }
    
    
    func getPrice() -> Double {
        return price * Double(quantity)
    }
    
    
    func getTaxAmount() -> Double {
        return Math.calculateTax(price: self.getPrice(), tax: self.tax())
    }
    
    func getPriceWithTax() -> Double {
        return self.getPrice() + Math.calculateTax(price: self.getPrice(), tax: self.tax())
    }
    
    func getDescription() -> String {
        
        var tmpDescription: String = self.description.copy() as! String
        if let str_qty_range = self.description.range(of: "\(quantity)") {
            tmpDescription.replaceSubrange(str_qty_range, with: "")
        }
        if let str_qty_range = self.description.range(of: " imported") {
            tmpDescription.replaceSubrange(str_qty_range, with: "")
        }
        
        if imported == true {
            return "imported" + tmpDescription
        } else {
            return tmpDescription
        }
    }
    
    func tax() -> Double {
        return imported == true ? (mainTax + importedTax) : mainTax
    }
    
    func taxDescription() -> String {
        return "" // 10%
    }
}


