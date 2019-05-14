//
//  Program.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/9/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

class MainProgram {
    
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        consoleIO.printUsage()
    }
    /// main command loop
    /// reads in a command, sends it out to get process.
    func interactiveMode() {
        var input = "quit"
        let cmdProcessor = CommandProccessor()
        print("Enter command ")
        print("or 'quit' to exit")
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
}

