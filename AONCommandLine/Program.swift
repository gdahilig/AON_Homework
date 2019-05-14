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
    
    func interactiveMode() {
        var input = ""
        let cmdProcessor = CommandProccessor()
        
        while input != "quit" {
            
            print("> ")
            
            if let _input = readLine() {
                input = _input
            } else {
                continue
            }
            
            // Process Command
            let result = cmdProcessor.Parse(input)
            if result != .Parse_Success {
                print("Command error: \(result)")
            }
            
        }
        print("exiting...")
    }
}

