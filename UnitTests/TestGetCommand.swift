//
//  TestGetCommand.swift
//  UnitTests
//
//  Created by Gene Dahilig on 5/14/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class TestGetCommand: XCTestCase {

    func testGetCmd() {
        var getCmd = GetCommand.Parse(cmd: "get *")
        XCTAssert(getCmd != nil)
        XCTAssert(getCmd?.varName == "*")
        
        getCmd = GetCommand.Parse(cmd: "get myVar")
        XCTAssert(getCmd != nil)
        XCTAssert(getCmd?.varName == "myVar")
    }
    
    func testInvalidCommand() {
        let getCmd = GetCommand.Parse(cmd: "geet invalidcommand")
        XCTAssert(getCmd == nil)
    }
    
    func testGetCommand_WhiteSpace() {
        var getCmd = GetCommand.Parse(cmd: "get    *")
        XCTAssert(getCmd?.varName == "*")
        
        getCmd = GetCommand.Parse(cmd: "get *    ")
        XCTAssert(getCmd?.varName == "*")
    }
}
