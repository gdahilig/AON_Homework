//
//  TestSetCommand.swift
//  UnitTests
//
//  Created by Gene Dahilig on 5/14/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class TestSetCommand: XCTestCase {

    var  dataStore  : [String:ObjectModel] = [:]
    
    func testSetCommand_Parse() {
        var cmd = SetCommand.Parse(cmd: "set name=19") as! SetCommand
        XCTAssert(cmd.varName != nil)
        XCTAssert(cmd.obj != nil)
        XCTAssert(cmd.obj?.name == "name")
        XCTAssert(cmd.obj?.value == "19")
        XCTAssert(cmd.obj?.type == .TypeNumber)

        cmd = SetCommand.Parse(cmd: "set name2=efadfed") as! SetCommand
        XCTAssert(cmd.varName != nil)
        XCTAssert(cmd.obj != nil)
        XCTAssert(cmd.obj?.name == "name2")
        XCTAssert(cmd.obj?.value == "efadfed")
        XCTAssert(cmd.obj?.type == .TypeString)
        
        let cmdNil = SetCommand.Parse(cmd: "set name2=efadfed invalid")
        XCTAssert(cmdNil == nil)
    }
    
    func testSetCommand_WhiteSpace() {
        let cmd = SetCommand.Parse(cmd: "set name  =  19")  as! SetCommand
        XCTAssert(cmd.varName != nil)
        XCTAssert(cmd.obj != nil)
        XCTAssert(cmd.obj?.name == "name")
        XCTAssert(cmd.obj?.value == "19")
        XCTAssert(cmd.obj?.type == .TypeNumber)
    }

}
