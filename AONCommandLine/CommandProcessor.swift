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

class CommandProcessor : NSObject {
    var  dataStore  : [String:ObjectModel] = [:]
    
    override init () {
    }
    
    func Process(_ strCmd :String) -> CommandParseResult {

        if let _cmd = GetCommand.Parse(cmd: strCmd) {
            _cmd.Execute(store: &dataStore)
        }
        else if let _cmd = SetCommand.Parse(cmd: strCmd) {
            _cmd.Execute(store: &dataStore)
        }
        else  {
            return .Parse_Error_General
        }
        
        return .Parse_Success
    }
    
}
