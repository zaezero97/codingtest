//
//  main.swift
//  21610.마법사 상어와 비바라기
//
//  Created by 재영신 on 2022/04/07.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    var stage = 0
    var arr = [[Int]]()
    var moves = [(dir: Int, val: Int)]()
    let dx = [-1,-1,0,1,1,1,0,-1]
    let dy = [0,-1,-1,-1,0,1,1,1]
    
    for _ in 0 ..< N {
        arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for _ in 0 ..< M {
        let input = readLine()!.split(separator: " ").map { Int(String($0))!}
        moves.append((input[0] - 1, input[1]))
    }
    
    var clouds = [(r: Int, c: Int)]()
    clouds.append((N-2,0))
    clouds.append((N-2,1))
    clouds.append((N-1,0))
    clouds.append((N-1,1))
    
    while stage < M {
        let move = moves[stage]
        
        var newClouds = [(r: Int, c: Int)]()
        for i in 0 ..< clouds.count {
            clouds[i].r += move.val * dy[move.dir]
            clouds[i].c += move.val * dx[move.dir]
            if clouds[i].r > N - 1 {
                clouds[i].r %= N
            } else if clouds[i].r < 0 {
                clouds[i].r = (N-1) - (Int(abs(clouds[i].r) - 1 ) % N)
            }
            
            if clouds[i].c > N - 1 {
                clouds[i].c %= N
            } else if clouds[i].c < 0 {
                clouds[i].c = (N-1) - (Int(abs(clouds[i].c) - 1) % N)
            }
            
            arr[clouds[i].r][clouds[i].c] += 1
        }
        
        //물복사 버그
        for cloud in clouds {
            for i in stride(from: 1, to: 8, by: 2) {
                if 0 ..< N ~= cloud.r + dy[i], 0 ..< N ~= cloud.c + dx[i], arr[cloud.r+dy[i]][cloud.c+dx[i]] > 0 {
                    arr[cloud.r][cloud.c] += 1
                }
            }
        }
        
        for i in 0 ..< N {
            for j in 0 ..< N {
                if arr[i][j] >= 2, !clouds.contains(where: { $0 == (i,j)}) {
                    newClouds.append((i,j))
                    arr[i][j] -= 2
                }
            }
        }
        
       clouds = newClouds
        stage += 1
    }
    
    let result = arr.reduce(0) { partialResult, subArr in
        return partialResult + subArr.reduce(0, +)
    }
    print(result)
}

main()

