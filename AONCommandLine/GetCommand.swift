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
    
    class func parse(cmd sCmd : String) -> CommandBase? {
        
        guard let _varName = GetCommand.getName(sCmd) else {
            return nil
        }
        let cmd = GetCommand()
        cmd.varName = _varName
        return cmd
    }
    
    private class func getName(_ cmdline: String) -> String? {
        let pattern =
#"""
(?xi)
(?<command>
(?i)(get)
)?(?-x: )
(?<name>
(\w+|\*)$
)
"""#
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            let nsrange = NSRange(cmdline.startIndex..<cmdline.endIndex,
                                  in: cmdline)
            if let match = regex.firstMatch(in: cmdline,
                                            options: [],
                                            range: nsrange)
            {
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
}
