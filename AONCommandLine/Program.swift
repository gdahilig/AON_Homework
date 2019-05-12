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
        while input != "quit" {
            
            print("> ")
            
            if let _input = readLine() {
                print("output :",input)
                input = _input
            } else {
                continue
            }
        }
        print("exiting...")
    }
    
    

}

