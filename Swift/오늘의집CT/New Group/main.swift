//
//  main.swift
//  오늘의집CT
//
//  Created by 재영신 on 2022/04/09.
//

import Foundation

func solution(_ tstring: String, _ variables: [[String]]) -> String {
    
    var visited: [Bool]!
    var tstring = tstring
    
    for i in 0 ..< variables.count {
        let variable = variables[i][0]
        let value = variables[i][1]
        visited = [Bool](repeating: false, count: variables.count)
        if value.isVariable() {
            let str = dfs(value)
            if str != nil {
                tstring = tstring.replacingOccurrences(of: "{\(variable)}", with: str!)
            }
        } else {
            tstring = tstring.replacingOccurrences(of: "{\(variable)}", with: value)
        }
    }
    
    func dfs(_ value: String) -> String? {
        var value = value
        
        if let index = variables.firstIndex(where: { $0[0] == value.unWrapping()}) {
            
            
            if !variables[index][1].isVariable() {
                return variables[index][1]
            }
            
            if visited[index] == true {
                return nil
            } else {
                visited[index] = true
                print(value)
                return dfs(value.unWrapping())
            }
        }
        
        if variables.contains(where: { $0[0] == value }) == false {
            print(value)
            return value.wrapping()
        }
            return nil
    }
    
    return tstring
}

extension String {
    func isVariable() -> Bool {
        return self.first == "{" ? true : false
    }
    
    mutating func unWrapping() -> String {
        if !self.isVariable() {
            return self
        } else {
            self.removeFirst()
            self.removeLast()
            return self
        }
    }
    
    mutating func wrapping() -> String {
        if self.isVariable() {
            return self
        } else {
            return "{\(self)}"
        }
    }
}

print(solution("this is {template} {template} is {state}",[["template", "{state}"], ["state", "{templates}"]]))

