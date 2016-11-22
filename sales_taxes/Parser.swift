//
//  Parser.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import Foundation

class Parser: AnyObject {
    
    
    class func split(input: String) -> [String] {
        let newlineChars = NSCharacterSet.newlines
        return input.components(separatedBy: newlineChars).filter({!$0.isEmpty}).filter({$0 != ""})
    }
    
    class func isValidLine(input: String) -> Bool {
        if let _ = input.range(of: "^[0-9].*at.[0-9]*\\.?[0-9]{2}$", options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
    
    class func getQuantity(input: String) -> Int? {
        guard isValidLine(input: input) == true else {
            return nil
        }
        let scanner = Scanner(string: input)
        var quantity: Int = 0
        if scanner.scanInt(&quantity) {
            return quantity
        }
        return nil
    }
    
    class func isImportedProduct(input: String) -> Bool {
        return input.contains("imported")
    }
    
    class func getPrice(input: String) -> Double?  {
        guard isValidLine(input: input) == true else {
            return nil
        }
        if let match = input.range(of: "at", options: .backwards) {
            let substring = input.substring(from: match.upperBound)
            let scanner = Scanner(string: substring)
            var price: Double = 0.0
            if scanner.scanDouble(&price) {
                return price
            }
            return nil
        }
        return nil
    }
    
    class func getDescription(input: String) -> String? {
        if let match = input.range(of: "at") {
            return input.substring(from: match.lowerBound)
        }
        return nil
    }
    
    class func getProductType(input: String) -> ProductType? {
        guard isValidLine(input: input) == true else {
            return nil
        }
        
        let lcInput = input.lowercased()
        
        if lcInput.contains("book") {
            return .Book
        } else if lcInput.contains("pills") {
            return .Drug
        } else if lcInput.contains("chocolate") {
            return .Food
        } else {
            return .Others
        }
    }
    
    class func getProduct(inputLine: String) -> Product? {
        guard isValidLine(input: inputLine) == true else {
            return nil
        }
        let quantity = Parser.getQuantity(input: inputLine)
        let price = Parser.getPrice(input: inputLine)
        let type = Parser.getProductType(input: inputLine)
        let imported = Parser.isImportedProduct(input: inputLine)
        if let quantity = quantity, let price = price, let type = type {
            return Product(type: type, price: price, quantity: quantity, imported: imported, description: inputLine)
        }
        return nil
    }
}
