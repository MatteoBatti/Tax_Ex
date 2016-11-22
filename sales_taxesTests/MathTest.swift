//
//  MathTest.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 20/11/16.
//
//

import XCTest

class MathTest: BaseTest {
    
    
    func testTaxCalculum() {
        
        //given
        let price_1_1 = 10.00
        let tax_1_1 = 5.0
        let price_1_2 = 47.50
        let tax_1_2 = 15.0
        
        let price_2_1 = 12.49
        let tax_2_1 = 0.0
        let price_2_2 = 14.99
        let tax_2_2 = 10.0
        let price_2_3 = 0.85
        let tax_2_3 = 0.0
        
        
        let price_3_1 = 27.99
        let tax_3_1 = 15.0
        let price_3_2 = 18.99
        let tax_3_2 = 10.0
        let price_3_3 = 9.75
        let tax_3_3 = 0.0
        let price_3_4 = 11.25
        let tax_3_4 = 5.0
        
        //when
        let output_1_1 = Math.calculateTax(price: price_1_1, tax: tax_1_1)
        let output_1_2 = Math.calculateTax(price: price_1_2, tax: tax_1_2)
        let total_tax_1 = output_1_1 + output_1_2
        
        let output_2_1 = Math.calculateTax(price: price_2_1, tax: tax_2_1)
        let output_2_2 = Math.calculateTax(price: price_2_2, tax: tax_2_2)
        let output_2_3 = Math.calculateTax(price: price_2_3, tax: tax_2_3)
        let total_tax_2 = output_2_1 + output_2_2 + output_2_3
        
        let output_3_1 = Math.calculateTax(price: price_3_1, tax: tax_3_1)
        let output_3_2 = Math.calculateTax(price: price_3_2, tax: tax_3_2)
        let output_3_3 = Math.calculateTax(price: price_3_3, tax: tax_3_3)
        let output_3_4 = Math.calculateTax(price: price_3_4, tax: tax_3_4)
        let total_tax_3 = output_3_1 + output_3_2 + output_3_3 + output_3_4
        
        let formatter = PriceNumberFormatter(patten: .TwoDecimal)
        
        //then
        XCTAssertEqual(formatter.formatPrice(price: total_tax_1), "7.65")
        XCTAssertEqual(formatter.formatPrice(price: total_tax_2), "1.50")
        XCTAssertEqual(formatter.formatPrice(price: total_tax_3), "6.70")
    }

    func testTotalPriceCalculum() {
        //given
        let price_1 = 12.49
        let tax_1 = 0.0
        let price_2 = 14.99
        let tax_2 = 10.0
        let price_3 = 0.85
        let tax_3 = 0.0
        
        //when
        let output_1 = Math.calculatePrice(price: price_1, tax: tax_1)
        let output_2 = Math.calculatePrice(price: price_2, tax: tax_2)
        let output_3 = Math.calculatePrice(price: price_3, tax: tax_3)
        let total_amount = output_1 + output_2 + output_3
        
        let formatter = PriceNumberFormatter(patten: .TwoDecimal)
        
        //then
        XCTAssertEqual(formatter.formatPrice(price: output_1), "12.49")
        XCTAssertEqual(formatter.formatPrice(price: output_2), "16.49")
        XCTAssertEqual(formatter.formatPrice(price: output_3), "0.85")
        //and
        XCTAssertEqual(formatter.formatPrice(price: total_amount), "29.83")
    }
    
}
