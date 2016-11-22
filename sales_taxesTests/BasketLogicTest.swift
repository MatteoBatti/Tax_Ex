//
//  AppLogicTest.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 22/11/16.
//
//

import XCTest

class BasketLogicTest: BaseTest {
        
    func testTaxEndTotal() {
        //given
        let input = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n\n\n1 box of imported chocolates at 11.25"
        let input_2 = "1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85"
        let input_3 = "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
        let input_4 = "2 imported box of chocolates at 10.00\n2 imported bottle of perfume at 47.50"
    
        //when
        let tax_total = BasketLogic.getTaxAndTotal(input: input)
        let tax_total_2 = BasketLogic.getTaxAndTotal(input: input_2)
        let tax_total_3 = BasketLogic.getTaxAndTotal(input: input_3)
        let tax_total_4 = BasketLogic.getTaxAndTotal(input: input_4)
        
        //then
        XCTAssertEqual(tax_total?.tax, "6.70")
        XCTAssertEqual(tax_total?.total, "74.68")
        XCTAssertEqual(tax_total_2?.tax, "1.50")
        XCTAssertEqual(tax_total_2?.total, "29.83")
        XCTAssertEqual(tax_total_3?.tax, "7.65")
        XCTAssertEqual(tax_total_3?.total, "65.15")
        XCTAssertEqual(tax_total_4?.tax, "15.25")
        XCTAssertEqual(tax_total_4?.total, "130.25")
    }
    
    func testOutputBill() {
        //given
        let input_1 = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n\n\n1 box of imported chocolates at 11.25"
        let input_2 = "1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85"
        let input_3 = "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
        
        //when
        let output_1 = BasketLogic.getBill(input: input_1)
        let output_2 = BasketLogic.getBill(input: input_2)
        let output_3 = BasketLogic.getBill(input: input_3)
        
        //then
        let result_1 = "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 imported box of chocolates: 11.85\nSales Taxes: 6.70\nTotal: 74.68"
        let result_2 = "1 book: 12.49\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 29.83"
        let result_3 = "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15"
        
        XCTAssertEqual(output_1, result_1)
        XCTAssertEqual(output_2, result_2)
        XCTAssertEqual(output_3, result_3)
    }
}
