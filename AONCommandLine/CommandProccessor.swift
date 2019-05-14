//
//  CommandProccessor.swift
//  AONCommandLine
//
//  Converts input into a command object,
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation
import Cocoa

class CommandProccessor : NSObject {
    var  dataStore  : [String:ObjectModel] = [:]
    
    override init () {
        let testObj =  ObjectModel(name: "me", type: .TypeString, value: "This is a TEST!")
        dataStore[testObj.name] = testObj
        
        let testObj2 =  ObjectModel(name: "a number", type: .TypeNumber, value: "1234.232")
        dataStore[testObj2.name] = testObj2
    }
    
    func Process(_ strCmd :String) -> CommandParseResult {

        if let _cmd = GetCommand.parse(cmd: strCmd) {
            _cmd.execute(store: &dataStore)
        }
        else if let _cmd = SetCommand.parse(cmd: strCmd) {
            _cmd.execute(store: &dataStore)
        }
        else  {
            return .Parse_Error_General
        }
        
        return .Parse_Success
    }
    
}
