//
//  main.swift
//  9466.텀프로젝트
//
//  Created by 재영신 on 2022/04/25.
//

import Foundation

func main() {
    let T = Int(readLine()!)!
    var done: [Bool]!
    var visited: [Bool]!
    var people: [Int]!
    var count = 0
    for _ in 0 ..< T {
        let n = Int(readLine()!)!
        people = [Int]()
        count = 0
        done = [Bool](repeating: false, count: n+1)
        visited = [Bool](repeating: false, count: n+1)
        people.append(0)
        people.append(contentsOf: readLine()!.split(separator: " ").map{ Int(String($0))!})
        
        for i in 1 ... n {
            if !visited[i] {
                dfs(i)
            }
        }
        print(n - count)
    }
    
    func dfs(_ n: Int) {
        visited[n] = true
        
        let next = people[n]
        
        if !visited[next] {
            dfs(next)
        } else if !done[next] {
            var node = next
            while node != n {
                count += 1
                node = people[node]
            }
            count += 1
        }
        
        done[n] = true
    }
    
    
}

main()

