//
//  CommandBase.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Cocoa

enum CommandParseResult {
    case Parse_Success
    case Parse_Error_General
    case Parse_Error_Invalid_Value
    case Parse_Error_Invalid_Command
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .Parse_Success: return "Parse Success!"
        case .Parse_Error_General: return "General Error"
        case .Parse_Error_Invalid_Value: return "Invalid Value"
        case .Parse_Error_Invalid_Command: return "Invalid Command"
        }
    }
}

class CommandBase: NSObject {
    var varName : String?
    var pattern : String?
    var data  : [String:ObjectModel] = [:]
    
    func execute(store data : inout [String:ObjectModel]) {
        // NOP
    }
}

