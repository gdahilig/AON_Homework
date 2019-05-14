//
//  SetCommand.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Cocoa

class SetCommand: CommandBase {
    var obj : ObjectModel?
    
    override init() {
        super.init()
        self.obj = nil
    }
    
    
    class func parse(cmd sCmd : String) -> CommandBase? {
        
        guard let params = SetCommand.getParameters(sCmd) else {
            return nil
        }
        let cmd = SetCommand()
        cmd.varName = params.0
        cmd.obj = ObjectModel(name: params.0, value: params.1)
        
        return cmd
    }
    
    class func getParameters(_ cmdline: String) -> (String, String)? {
        let _pattern =
#"""
(?xi)
(?<command>
(?i)(set)\s*
),?(?-x: )
(?<name>
(\w+|\*)
)\s*=\s*
(?<value>
(\w+|\*)
)
"""#

        do {
            let regex = try NSRegularExpression(pattern: _pattern, options: [])
            
            let nsrange = NSRange(cmdline.startIndex..<cmdline.endIndex,
                                  in: cmdline)
            if let match = regex.firstMatch(in: cmdline,
                                            options: [],
                                            range: nsrange)
            {
                var varName :String?
                var value : String?
                
                var nsrange = match.range(withName: "name")
                
                guard nsrange.location != NSNotFound,
                    let range = Range(nsrange, in: cmdline) else {
                      return nil
                }
                varName = "\(cmdline[range])"
                
                nsrange = match.range(withName: "value")
                if nsrange.location != NSNotFound,
                   let range = Range(nsrange, in: cmdline)
                {
                    value = "\(cmdline[range])"
                }
                else {
                    return nil
                }
                
                return (varName!, value!)
            }
        }
        catch {
            print("Error")
            return nil
        }
        
        return nil
    }
    
    private func isNumeric(a: String) -> Bool {
        return Double(a) != nil
    }
    
    override func execute(store data : inout [String:ObjectModel]) {
        guard let name = self.varName else {
            print("Error")
            return
        }
        data[name] = self.obj
    }
}
