//
//  GetCommand.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/12/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Cocoa

class GetCommand: CommandBase {
    
    override init() {
        super.init()
    }
    
    override class func Parse(cmd sCmd : String) -> CommandBase? {
        
        guard let _varName = GetCommand.getName(sCmd) else {
            return nil
        }
        let cmd = GetCommand()
        cmd.varName = _varName
        return cmd
    }
    
    private class func getName(_ cmdline: String) -> String? {
        let pattern =
//#"""
//(?xi)
//(?<command>
//(?i)(get)
//)?(?-x: )
//(?<name>
//(\w+|\*)$
//)
//"""#
#"""
(?xi)
(?<command>
(?i)(get)
)\s+
(?<name>
(\w+|\*)
)\s*$
"""#
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            let nsrange = NSRange(cmdline.startIndex..<cmdline.endIndex,
                                  in: cmdline)
            if let match = regex.firstMatch(in: cmdline,
                                            options: [],
                                            range: nsrange)
            {
                let nsrangeCmd = match.range(withName: "command")
                if nsrangeCmd.location == NSNotFound {
                    return nil
                }
                
                let nsrange = match.range(withName: "name")
                if nsrange.location != NSNotFound,
                    let range = Range(nsrange, in: cmdline)
                {
                    return "\(cmdline[range])"
                }
            }
        }
        catch {
            print("Error")
            return nil
        }
        
        return nil
    }
    
    override func Execute(store data : inout [String:ObjectModel]) {
        guard let name = self.varName else {
            print("Error")
            return
        }
        if name == "*" {
            // Print map
            self.printMap(data)
        }
        else if let obj = data[name] {
            print("\(name) = \(obj.value)")
        }
        else {
            print("variable '\(name)' does not exist.")
        }
    }
    
    private func printMap(_ data : [String:ObjectModel]) {
        if data.count == 0 {
            print("No values stored")
        }
        else {
            for (_, obj) in data {
                print(obj.describe())
            }
        }
    }
}
