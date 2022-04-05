//
//  main.swift
//  16234.인구 이동
//
//  Created by 재영신 on 2022/04/05.
//

import Foundation


func main() {
    let input = readLine()!.components(separatedBy: " ")
    let N = Int(input[0])!
    let L = Int(input[1])!
    let R = Int(input[2])!
    
    var result = 0
    var flag = false
    var arr = [[Int]]()
    var temp = [[(Int,Int)]]()
    
    for _ in 0 ..< N {
        arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    
    while !flag {
        for i in 0 ..< N {
            for j in 0 ..< N {
                if !visited[i][j] {
                    temp.append(bfs(i,j))
                }
            }
        }
        
        temp.forEach { teams in
            let sum = teams.reduce(0, { $0 + arr[$1.0][$1.1]})
            teams.forEach { point in
                arr[point.0][point.1] = (sum / teams.count)
            }
        }
        
        print(temp)
        
        if temp.count == N * N {
            break
        }
        
        if flag {
            result += 1
            flag = false
        } else {
            flag = true
        }
        temp = [[(Int,Int)]]()
        visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    }
    print(result)
    
    func bfs(_ i: Int, _ j: Int) -> [(Int,Int)] {
        var queue = [(Int,Int)]()
        var store = [(Int,Int)]()
        queue.append((i,j))
        visited[i][j] = true
        while !queue.isEmpty {
            let point = queue.removeFirst()
            store.append(point)
            if point.0 + 1 < N, !visited[point.0 + 1][point.1], L ... R ~= abs(arr[point.0][point.1] - arr[point.0 + 1][point.1]) {
                queue.append((point.0+1,point.1))
                visited[point.0+1][point.1] = true
            }
            
            if point.1 + 1 < N, !visited[point.0][point.1 + 1],  L ... R ~= abs(arr[point.0][point.1] - arr[point.0][point.1+1])  {
                queue.append((point.0,point.1+1))
                visited[point.0][point.1+1] = true
            }
            
            if point.0 - 1 > 0, !visited[point.0-1][point.1],  L ... R ~= abs(arr[point.0][point.1] - arr[point.0-1][point.1])  {
                queue.append((point.0-1,point.1))
                visited[point.0-1][point.1] = true
            }
            
            if point.1 - 1 > 0, !visited[point.0][point.1 - 1],  L ... R ~= abs(arr[point.0][point.1] - arr[point.0][point.1-1])  {
                queue.append((point.0,point.1-1))
                visited[point.0][point.1-1] = true
            }
        }
        
        if store.count > 1 {
            flag = true
        }
        
        return store
    }
}


main()

