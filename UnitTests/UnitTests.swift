//
//  UnitTests.swift
//  UnitTests
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class UnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCmd() {
        var name : String?
        let getCommand = GetCommand()
        name = getCommand.getName("get *")
        XCTAssert(name == "*")
        
        name = getCommand.getName("get myVar")
        XCTAssert(name == "myVar")
        
        name = getCommand.getName("get invalid command")
        XCTAssert(name == nil)
    }

    func testGetCommand_WhiteSpace() {
        let getCommand = GetCommand()
        var name = getCommand.getName("get    *")
        XCTAssert(name == "*")

        name = getCommand.getName("get *    ")
        XCTAssert(name == "*")
    }
    
    
    func testSetCommand() {
        var cmd = SetCommand()
        var params = cmd.getParameters("set name=19")
        XCTAssert(params != nil)
        XCTAssert(params?.0 == "name")
        XCTAssert(params?.1 == "19")
        
        cmd = SetCommand()
        params = cmd.getParameters("set name2=efadfed")
        XCTAssert(params != nil)
        XCTAssert(params?.0 == "name2")
        XCTAssert(params?.1 == "efadfed")
        
        cmd = SetCommand()
        params = cmd.getParameters("set name2=efadfed invalid")
        XCTAssert(params != nil)
        XCTAssert(params?.0 == "name2")
        XCTAssert(params?.1 == "efadfed")
    }
    
    func testSetCommand_WhiteSpace() {
        let cmd = SetCommand()
        let params = cmd.getParameters("set name  =  19")
        XCTAssert(params != nil)
        XCTAssert(params?.0 == "name")
        XCTAssert(params?.1 == "19")
    }
}
