//
//  main.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/9/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {

    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func printUsage() {
        
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName)")
        writeMessage("")
        writeMessage("SET <property name> = <value>")
        writeMessage("  Will set the value of <property name>")
        writeMessage("  If <property name> does not exists it is created.")
        writeMessage(" ")
        writeMessage("GET <property name>")
        writeMessage("  Will return the value of <property name>")
        writeMessage(" ")
        writeMessage("GET *")
        writeMessage("  Will return the all property names and their values define in no specific order.")
    }

    
} // ConsoleID


let mainProgram = MainProgram()
mainProgram.interactiveMode()
//let console = RegExTester()
//console.testGet()
