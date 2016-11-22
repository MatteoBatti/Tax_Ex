//
//  StringExtension.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 22/11/16.
//
//

import Foundation

extension String {
    
    func condensedWhitespace() -> String {
        let components = self.components(separatedBy: NSCharacterSet.whitespaces)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
