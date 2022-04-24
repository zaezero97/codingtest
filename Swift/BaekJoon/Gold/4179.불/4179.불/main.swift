//
//  main.swift
//  4179.불
//
//  Created by 재영신 on 2022/04/24.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let R = firstInput[0]
    let C = firstInput[1]
    
    var map = [[String]]()
    var jihunQueue = [(x: Int, y: Int, min: Int)]()
    var fireQueue = [(x: Int, y: Int, min: Int)]()
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    for i in 0 ..< R {
        let input = readLine()!.map { String($0) }
        map.append(input)
        
        if let jihunIndex = input.firstIndex(of: "J") {
            jihunQueue.append((jihunIndex, i, 0))
        }
        
        if let fireIndex = input.firstIndex(of: "F") {
            fireQueue.append((fireIndex, i, 0))
        }
    }
    
    
    var jihunVisited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    var fireVisited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    
    while !jihunQueue.isEmpty {
        
        var newJihunQueue = [(x: Int, y: Int, min: Int)]()
        var newFireQueue = [(x: Int, y: Int, min: Int)]()
        //fire
        
        for i in 0 ..< fireQueue.count {
            let firePoint = fireQueue[i]
            for i in 0 ..< 4 {
                let nx = firePoint.x + dx[i]
                let ny = firePoint.y + dy[i]
                
                if nx < 0 || nx >= C || ny < 0 || ny >= R || map[ny][nx] == "#" || fireVisited[ny][nx] {
                    continue
                }
                
                fireVisited[ny][nx] = true
                newFireQueue.append((nx,ny, firePoint.min + 1))
                map[ny][nx] = "F"
            }
        }
        
        // jihun
        for i in 0 ..< jihunQueue.count {
            let jihunPoint = jihunQueue[i]
            
            for i in 0 ..< 4 {
                let nx = jihunPoint.x + dx[i]
                let ny = jihunPoint.y + dy[i]
                
                if nx < 0 || nx >= C || ny < 0 || ny >= R {
                    print("\(jihunPoint.min + 1)")
                    exit(EXIT_SUCCESS)
                }
                
                if map[ny][nx] != "." || jihunVisited[ny][nx]{
                    continue
                }
                
                jihunVisited[ny][nx] = true
                map[ny][nx] = "J"
                newJihunQueue.append((nx,ny, jihunPoint.min + 1))
            }
        }
        fireQueue = newFireQueue
        jihunQueue = newJihunQueue
    }
    
    print("IMPOSSIBLE")
}

main()
