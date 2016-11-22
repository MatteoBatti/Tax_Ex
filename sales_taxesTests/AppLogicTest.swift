//
//  AppLogicTest.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 22/11/16.
//
//

import XCTest

class AppLogicTest: BaseTest {
        
    func testApp() {
        //given
        let input = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n\n\n1 box of imported chocolates at 11.25"
        let input_2 = "1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85"
        let input_3 = "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
    
        //when
        let tax_total = AppLogic.computeOutput(input: input)
        let tax_total_2 = AppLogic.computeOutput(input: input_2)
        let tax_total_3 = AppLogic.computeOutput(input: input_3)
        
        //then
        XCTAssertEqual(tax_total?.tax, "6.70")
        XCTAssertEqual(tax_total?.total, "74.68")
        XCTAssertEqual(tax_total_2?.tax, "1.50")
        XCTAssertEqual(tax_total_2?.total, "29.83")
        XCTAssertEqual(tax_total_3?.tax, "7.65")
        XCTAssertEqual(tax_total_3?.total, "65.15")
    }
}
