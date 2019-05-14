//
//  TestObjectModel.swift
//  UnitTests
//
//  Created by Gene Dahilig on 5/14/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class TestObjectModel: XCTestCase {

    func testObjectModel_init() {
        var obj = ObjectModel(name: "name1", value: "text")
        XCTAssert(obj.name == "name1")
        XCTAssert(obj.value == "text")
        XCTAssert(obj.type == .TypeString)
 
        obj = ObjectModel(name: "number", value: "12342345")
        XCTAssert(obj.name == "number")
        XCTAssert(obj.value == "12342345")
        XCTAssert(obj.type == .TypeNumber)
    }

    func testObjectModel_describe() {
        var obj = ObjectModel(name: "name1", value: "text")
        XCTAssert(obj.describe() == "'name1' = 'text'")
        
        obj = ObjectModel(name: "number", value: "12342345")
        XCTAssert(obj.describe() == "'number' = 12342345")
    }
}
