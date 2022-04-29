//
//  main.swift
//  18513.샘터
//
//  Created by 재영신 on 2022/04/29.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    ///샘터 개수
    let _ = firstInput[0]
    /// 집 개수
    var K = firstInput[1]
    
    let sites = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result: UInt64 = 0
    var queue = [(x: Int, d: UInt64)]()
    var visited = [Bool](repeating: false, count: 200300001)
    
    sites.forEach { site in
        let newSite = site + 100100000
        
        queue.append((newSite, 0))
        visited[newSite] = true
    }
    
    var index = 0
    let dx = [1,-1]
    
    while queue.count > index {
        let site = queue[index]
        
        for i in 0 ..< 2 {
            
            let nx = site.x + dx[i]
            
            if nx > 200300000 || nx < 0 || visited[nx] {
                continue
            }
           
            K -= 1
            result += site.d + 1
            if K == 0 {
                print(result)
                exit(EXIT_SUCCESS)
            }
            
            visited[nx] = true
            queue.append((nx, site.d + 1))
           
        }
        
        index += 1
    }
    
}

main()

