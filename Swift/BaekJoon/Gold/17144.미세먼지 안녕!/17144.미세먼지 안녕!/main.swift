//
//  main.swift
//  17144.미세먼지 안녕!
//
//  Created by 재영신 on 2022/04/08.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let R = firstInput[0]
    let C = firstInput[1]
    var T = firstInput[2]
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    var map = [[Int]]()
    var airPoint: Int!
    
    for i in 0 ..< R {
        map.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
        if map[i][0] == -1 {
            airPoint = i
        }
    }
    
    while T > 0 {
        
        var tempMap = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
        
        // 미세먼지 확산
        for i in 0 ..< R {
            for j in 0 ..< C {
                if map[i][j] != 0, map[i][j] != -1 {
                    var n = 0
                    for z in 0 ..< 4 {
                        let ny = i+dy[z]
                        let nx = j+dx[z]
                        
                        if ny >= 0, ny < R, nx >= 0, nx < C, map[ny][nx] != -1 {
                            n += 1
                            tempMap[ny][nx] += map[i][j] / 5
                        }
                    }
                    map[i][j] = map[i][j] - (map[i][j] / 5) * n
                }
            }
        }
        
        
        for i in 0 ..< R {
            for j in 0 ..< C {
                map[i][j] += tempMap[i][j]
            }
        }
        
        //공기청정기 작동
        
        map = rotate()
        
        T -= 1
    }

    var result = 0
    for i in 0 ..< R {
        for j in 0 ..< C {
            if map[i][j] != -1 {
                result += map[i][j]
            }
        }
    }
    
    print(result)
    
    func rotate() -> [[Int]] {
        
        var newMap = map
        
        let top = airPoint - 1
        let bottom = airPoint!
        //상단
        
        //아래
        for i in 2 ..< C {
            newMap[top][i] = map[top][i-1]
        }
        newMap[top][1] = 0
        
        // 위
        for i in 0 ..< (C - 1) {
            newMap[0][i] = map[0][i+1]
        }
        
        // 오른쪽
        for i in 0 ..< top {
            newMap[i][C-1] = map[i+1][C-1]
        }
        
        // 왼쪽
        for i in 1 ... top {
            newMap[i][0] = map[i-1][0]
        }
        
        //하단
        
        //아래
        for i in 0 ..< C - 1 {
            newMap[R-1][i] = map[R-1][i+1]
        }
        
        // 위
        for i in 1 ..< C {
            newMap[bottom][i] = map[bottom][i-1]
        }
        newMap[bottom][1] = 0
        
        // 오른쪽
        for i in (bottom+1) ..< R {
            newMap[i][C-1] = map[i-1][C-1]
        }
        
        // 왼쪽
        for i in bottom ..< (R - 1) {
            newMap[i][0] = map[i+1][0]
        }
            
        newMap[top][0] = -1
        newMap[bottom][0] = -1
        return newMap
    }
}


main()
