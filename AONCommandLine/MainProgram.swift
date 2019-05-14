//
//  Program.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/9/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

class MainProgram {
    
    /// main command loop
    /// reads in a command, sends it out to get process.
    func interactiveMode() {
        var input = "quit"
        let cmdProcessor = CommandProcessor()
        printUsage()
        print(">")
        if let _input = readLine() {
            input = _input
        }
        
        while input != "quit" && input.count > 0 {
            // Process Command
            let result = cmdProcessor.Process(input)
            if result != .Parse_Success {
                print("Command error: \(result)")
            }
            
            print("> ")
            if let _input = readLine() {
                input = _input
            } else {
                continue
            }
        }
        print("exiting...")
    }
    
    func printUsage() {
        
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName)")
        print("")
        print("SET <property name> = <value>")
        print("  Will set the value of <property name>")
        print("  If <property name> does not exists it is created.")
        print(" ")
        print("GET <property name>")
        print("  Will return the value of <property name>")
        print(" ")
        print("GET *")
        print("  Will return the all property names and their values define in no specific order.")
    }
}

