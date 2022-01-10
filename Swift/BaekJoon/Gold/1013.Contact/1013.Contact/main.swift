//
//  main.swift
//  1013.Contact
//
//  Created by 재영신 on 2022/01/07.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0 ..< T {
    let input = readLine()!
    print(isValidPattern(input) ? "YES": "NO")
}

func isValidPattern(_ pattern: String) -> Bool {
    var state = 0
    for char in pattern {
        if let nextState = next(ch: char, from: state) {
            state = nextState
        } else {
            return false
        }
    }
    
    return [0,2,6,7].contains(state)
}

func next(ch: Character, from state: Int) -> Int? {
    if ch == "0" {
         switch state {
             case 0: return 1
             case 1: return nil
             case 2: return 1
             case 3: return 4
             case 4: return 5
             case 5: return 5
             case 6: return 1
             case 7: return 4
             case 8: return 5
             default: return nil
         }
     } else {
         switch state {
             case 0: return 3
             case 1: return 2
             case 2: return 3
             case 3: return nil
             case 4: return nil
             case 5: return 6
             case 6: return 7
             case 7: return 7
             case 8: return 0
             default: return nil
         }
     }
}
