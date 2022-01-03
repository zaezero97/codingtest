//
//  main.swift
//  촌수계산
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let n = Int(readLine()!)!
let secondInput = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let person1 = secondInput[0]
let person2 = secondInput[1]
let m = Int(readLine()!)!

var relationships = [[Int]](repeating: [Int](), count: n+1)
for _ in 0 ..< m {
    let input = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    relationships[input[0]].append(input[1])
    relationships[input[1]].append(input[0])
}
var visited = [Bool](repeating: false, count: n+1)
var result = [Int]()
visited[person1] = true
dfs(start: person1,n: 0)
print(result.isEmpty ? "-1" : result.min()!)

func dfs(start: Int,n: Int) {
    if relationships[start].isEmpty {
        return
    } else if start == person2{
        result.append(n)
    }
    
    for person in relationships[start] {
        if !visited[person] {
            visited[person] = true
            dfs(start: person, n: n+1)
            visited[person] = false
        }
    }
}
