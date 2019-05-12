//
//  RegExTest.swift
//  AONCommandLine
//
//  Created by Gene Dahilig on 5/11/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//
// This code is base on https://nshipster.com/swift-regular-expressions/

import Foundation

class RegExTester {
    
    func respond(to invitation: String) {
        if let range = invitation.range(of: #"\bClue(do)?™?\b"#,
                                        options: .regularExpression) {
            switch invitation[range] {
            case "Cluedo":
                print("I'd be delighted to play!")
            case "Clue":
                print("Did you mean Cluedo? If so, then yes!")
            default:
                fatalError("(Wait... did I mess up my regular expression?)")
            }
        } else {
            print("Still waiting for an invitation to play Cluedo.")
        }
    }
    
    func testGet(cmd: String) {
        if let range = cmd.range(of: #"(?i)(get) (\w+|\*)"#,
                                 options: .regularExpression) {
            switch cmd[range] {
            case "Cluedo":
                print("I'd be delighted to play!")
            case "Clue":
                print("Did you mean Cluedo? If so, then yes!")
            default:
                fatalError("(Wait... did I mess up my regular expression?)")
            }
        } else {
            print("Still waiting for an invitation to play Cluedo.")
        }
    }
    
    //-----------------------------------------------------------------------
    
    func test () {
        
        let suggestion = """
        I suspect it was Professor Plum, \
        in the Dining Room, \
        with the Candlestick.
        """
        
        let pattern = #"""
        (?xi)
        (?<suspect>
            ((Miss|Ms\.) \h Scarlett?) |
            ((Colonel | Col\.) \h Mustard) |
            ((Reverend | Mr\.) \h Green) |
            (Mrs\. \h Peacock) |
            ((Professor | Prof\.) \h Plum) |
            ((Mrs\. \h White) | ((Doctor | Dr\.) \h Orchid))
        ),?(?-x: in the )
        (?<location>
            Kitchen        | Ballroom | Conservatory |
            Dining \h Room      |       Library      |
            Lounge         | Hall     | Study
        ),?(?-x: with the )
        (?<weapon>
              Candlestick
            | Knife
            | (Lead(en)?\h)? Pipe
            | Revolver
            | Rope
            | Wrench
        )
        """#
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])

            let nsrange = NSRange(suggestion.startIndex..<suggestion.endIndex,
                                  in: suggestion)
            if let match = regex.firstMatch(in: suggestion,
                                            options: [],
                                            range: nsrange)
            {
                for component in ["suspect", "location", "weapon"] {
                    let nsrange = match.range(withName: component)
                    if nsrange.location != NSNotFound,
                        let range = Range(nsrange, in: suggestion)
                    {
                        print("\(component): \(suggestion[range])")
                    }
                }
            }
            // Prints:
            // "suspect: Professor Plum"
            // "location: Dining Room"
            // "weapon: Candlestick"
        }
        catch {
            print ("error")
        }
    }
    
    func getCommandName(_ cmdline: String) -> String? {
        let pattern = #"""
            (?xi)
            (?<command>
                (?i)(get)
            ),?(?-x: )
            (?<name>
                (\w+|\*)
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
    
    func testGet() {
        guard let varName = getCommandName("get myVar") else {
            print("error")
            return
        }
        print("var: \(varName)")
    }
}
