//
//  CommandProccessor.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation
import Cocoa

class CommandProccessor : NSObject {
    var  map  : [String:ObjectModel] = [:]
    
    override init () {
        let testObj =  ObjectModel(name: "me", type: .TypeString, value: "This is a TEST!")
        map[testObj.name] = testObj
        
        let testObj2 =  ObjectModel(name: "a number", type: .TypeNumber, value: "1234.232")
        map[testObj2.name] = testObj2
    }
    
    func Parse(_ strCmd :String) -> CommandParseResult {

        if let _cmd = GetCommand.parse(cmd: strCmd) {
            self.executeGetCmd(_cmd as! GetCommand)
        }
        else if let _cmd = SetCommand.parse(cmd: strCmd) {
            self.executeSetCmd(_cmd as! SetCommand)
        }
        else  {
            return .Parse_Error_General
        }
        
        return .Parse_Success
    }
    
    private func executeGetCmd(_ cmd : GetCommand) {

        guard let name = cmd.varName else {
            print("Error")
            return
        }
        if name == "*" {
            // Print map
            self.printMap()
        }
        else if let obj = map[name] {
            print("\(name) = \(obj.value)")
        }
        else {
            print("variable '\(name)' does not exist.")
        }
    }
    
    private func executeSetCmd(_ cmd : SetCommand ) {
        guard let name = cmd.varName else {
            print("Error")
            return
        }
        map[name] = cmd.obj
    }
    
    private func printMap() {
        if map.count == 0 {
            print("No values stored")
        }
        else {
            for (_, obj) in map {
                print(obj.describe())
            }
        }
    }
    
}
