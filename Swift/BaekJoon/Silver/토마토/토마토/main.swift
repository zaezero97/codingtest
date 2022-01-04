//
//  main.swift
//  토마토
//
//  Created by 재영신 on 2022/01/04.
//

import Foundation

func main() {
    let firstLineInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let M = firstLineInput[0]
    let N = firstLineInput[1]
    
    var boxes = [[Int]]()
    // 1: 익은 토마토, 0: 익지 않은 토마토 , -1: 토마토가 없는 칸
    
    var queue = [(x:Int, y:Int)]()
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var max = 0
    for i in 0 ..< N {
        boxes.append(readLine()!.split(separator: " ").map{ Int(String($0))!})
        for j in 0 ..< M {
            if boxes[i][j] == 1 {
                queue.append((x: j, y: i))
            }
        }
    }
    
    var index = 0
    while queue.count > index {
        let ripeTomato = queue[index]
        for i in 0 ..< 4 {
            let nx = ripeTomato.x + dx[i]
            let ny = ripeTomato.y + dy[i]
            if 0 ..< M ~= nx , 0 ..< N ~= ny , boxes[ny][nx] == 0{
                boxes[ny][nx] = boxes[ripeTomato.y][ripeTomato.x] + 1
                queue.append((x: nx, y: ny))
            }
        }
        index += 1
    }
    
    for i in 0 ..< N {
        for j in 0 ..< M {
            if boxes[i][j] == 0 {
                print("-1")
                exit(EXIT_SUCCESS)
            }
            
            if max < boxes[i][j] {
                max = boxes[i][j]
            }
        }
    }
    
    print(max - 1)
}

main()


