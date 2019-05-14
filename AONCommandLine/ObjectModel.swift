//
//  ObjectModel.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/13/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Cocoa
enum ValueType {
    case TypeNumber
    case TypeString
}
    

class ObjectModel: NSObject {
    var name : String
    var type : ValueType
    var value : String
    
    init(name _name: String,
         value _value: String) {
        
        self.name = _name
        self.type = Double(_value) != nil ? .TypeNumber : .TypeString
        self.value = _value
        super.init()
    }
    
    init(name _name: String,
         type _type: ValueType,
         value _value: String) {
        self.name = _name
        self.type = _type
        self.value = _value
    }
    
    /// Prints the value of the object
    /// Strings values are quoted.
    func describe() -> String {
        if self.type == .TypeString {
            return "'\(name)' = '\(self.value)'"
        }
        else {
            return "'\(name)' = \(self.value)"
        }
    }
}
