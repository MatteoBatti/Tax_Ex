//
//  sales_taxesTests.swift
//  sales_taxesTests
//
//  Created by Matteo Battistini on 18/11/16.
//
//

import XCTest

class ParserTest: BaseTest {
    
    
    func testSplitInput() {
        //given
        let input = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n\n\n1 box of imported chocolates at 11.25"
        
        //when
        let output = Parser.split(input: input)
        
        //then
        XCTAssertEqual(output, ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"])
    }
    
    func testIsValidInputLine() {
        //given
        let input_1 = "1 imported bottle of perfume at 27.99"
        let input_2 = "3 bottle of perfume at 18.99"
        let input_3 = "s packet of headache pills at 9.75 "
        let input_4 = "2,2 box of imported chocolates at 11.25"
        let input_5 = "6.6 packet of headache pills at nine end five cents"

        
        //when
        //when
        let output_1 = Parser.isValidLine(input: input_1)
        let output_2 = Parser.isValidLine(input: input_2)
        let output_3 = Parser.isValidLine(input: input_3)
        let output_4 = Parser.isValidLine(input: input_4)
        let output_5 = Parser.isValidLine(input: input_5)
        
        //then
        XCTAssertTrue(output_1)
        XCTAssertTrue(output_2)
        XCTAssertFalse(output_3)
        XCTAssertTrue(output_4)
        XCTAssertFalse(output_5)
    }
    
    func testGetQuantity() {
        
        //given
        let input_1 = "1 book at 12.49"
        let input_2 = "five book at 4"
        let input_3 = "23 book at 3.20"
        let input_4 = "3.2 book at 4.80"
        let input_5 = "4,3 book at 100"
        let input_6 = "400,5 book at 220.34"
        
        //when
        let output_1 = Parser.getQuantity(input: input_1)
        let output_2 = Parser.getQuantity(input: input_2)
        let output_3 = Parser.getQuantity(input: input_3)
        let output_4 = Parser.getQuantity(input: input_4)
        let output_5 = Parser.getQuantity(input: input_5)
        let output_6 = Parser.getQuantity(input: input_6)
        
        
        //then
        XCTAssertEqual(output_1, 1)
        XCTAssertEqual(output_2, nil)
        XCTAssertEqual(output_3, 23)
        XCTAssertEqual(output_4, 3)
        XCTAssertEqual(output_5, 4)
        XCTAssertEqual(output_6, 400)
    }
    
    func testGetPrice() {
        
        //given
        let input_1 = "1 book at 12.49"
        let input_2 = "five book at 4"
        let input_3 = "23 book at 3.20"
        let input_4 = "3.2 book at 4.80"
        let input_5 = "4,3 book at 100"
        let input_6 = "400,5 book at 220.34"
        
        //when
        let output_1 = Parser.getPrice(input: input_1)
        let output_2 = Parser.getPrice(input: input_2)
        let output_3 = Parser.getPrice(input: input_3)
        let output_4 = Parser.getPrice(input: input_4)
        let output_5 = Parser.getPrice(input: input_5)
        let output_6 = Parser.getPrice(input: input_6)
        
        
        //then
        XCTAssertEqual(output_1, 12.49)
        XCTAssertEqual(output_2, nil)
        XCTAssertEqual(output_3, 3.20)
        XCTAssertEqual(output_4, 4.80)
        XCTAssertEqual(output_5, 100)
        XCTAssertEqual(output_6, 220.34)
    }
    
    func testIfProductIsImported() {
        //given
        let input_1 = "1 imported bottle of perfume at 27.99"
        let input_2 = "3 bottle of perfume at 18.99"
        let input_3 = "s packet of headache pills at 9.75 "
        let input_4 = "22 box of imported chocolates at 11.25"
        
        //when
        let output_1 = Parser.isImportedProduct(input: input_1)
        let output_2 = Parser.isImportedProduct(input: input_2)
        let output_3 = Parser.isImportedProduct(input: input_3)
        let output_4 = Parser.isImportedProduct(input: input_4)
        
        //then
        XCTAssertTrue(output_1)
        XCTAssertFalse(output_2)
        XCTAssertFalse(output_3)
        XCTAssertTrue(output_4)
    }
    
    func testProductType() {
        //given
        let input_1 = "1 imported bottle of perfume at 27.99"
        let input_2 = "3 bottle of perfume at 18.99"
        let input_3 = "1 packet of headache pills at 9.75"
        let input_4 = "22 box of imported chocolates at 11.25"
        
        //when
        let output_1 = Parser.getProductType(input: input_1)
        let output_2 = Parser.getProductType(input: input_2)
        let output_3 = Parser.getProductType(input: input_3)
        let output_4 = Parser.getProductType(input: input_4)
        
        //then
        XCTAssertEqual(output_1, ProductType.Others)
        XCTAssertEqual(output_2, ProductType.Others)
        XCTAssertEqual(output_3, ProductType.Drug)
        XCTAssertEqual(output_4, ProductType.Food)
    }
    
}
