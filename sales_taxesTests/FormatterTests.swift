//
//  FormatterTests.swift
//  sales_taxes
//
//  Created by Matteo Battistini on 20/11/16.
//
//

import XCTest

class FormatterTests: BaseTest {
    
    func testFormatPrice() {
        //given
        let case_1 = 1
        let case_2 = 10
        let case_3 = 200
        let case_4 = -10.0
        let case_5 = 25.56
        let case_6 = 1111.111
        
        //when
        let formatter = TaxNumberFormatter(patten: .TwoDecimal)
        
        let output_case_1 = formatter.formatPercentage(perc: Double(case_1))
        let output_case_2 = formatter.formatPercentage(perc: Double(case_2))
        let output_case_3 = formatter.formatPercentage(perc: Double(case_3))
        let output_case_4 = formatter.formatPercentage(perc: case_4)
        let output_case_5 = formatter.formatPercentage(perc: case_5)
        let output_case_6 = formatter.formatPercentage(perc: case_6)
        
        //then
        XCTAssertEqual(output_case_1, "1.00")
        XCTAssertEqual(output_case_2, "10.00")
        XCTAssertEqual(output_case_3, "200.00")
        XCTAssertEqual(output_case_4, "-10.00")
        XCTAssertEqual(output_case_5, "25.56")
        XCTAssertEqual(output_case_6, "1,111.11")
    }
    
    
}
