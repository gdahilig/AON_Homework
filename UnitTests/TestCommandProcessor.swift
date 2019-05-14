//
//  TestCommandProcessor.swift
//  UnitTests
//
//  Created by Gene Dahilig on 5/13/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class TestCommandProcessor: XCTestCase {
    func testProcess() {
        let cmdProcessor = CommandProcessor()
        
        var result = cmdProcessor.Process("get *")
        XCTAssert(result == .Parse_Success)
        
        result = cmdProcessor.Process("set x=123")
        XCTAssert(result == .Parse_Success)
    }
    
    func testProcess_Error() {
        let cmdProcessor = CommandProcessor()
        var result = cmdProcessor.Process("this is not a command")
        XCTAssert(result == .Parse_Error_General)
        
        result = cmdProcessor.Process("get ")
        XCTAssert(result == .Parse_Error_General)
        
        result = cmdProcessor.Process("SEEET x1=2")
        XCTAssert(result == .Parse_Error_General)
        
        result = cmdProcessor.Process("Geet * ")
        XCTAssert(result == .Parse_Error_General)
    }
}
