//
//  main.swift
//  1068.트리
//
//  Created by 재영신 on 2022/04/08.
//

import Foundation

func main() {
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    let deleteNum = Int(readLine()!)!
    let DELETE = 99
    var result = 0
    var tree = [[Int]](repeating: [Int](), count: N)
    var rootNode: Int!
    
    for i in 0 ..< N {
        for j in 0 ..< arr.count {
            if arr[j] == i {
                tree[i].append(j)
            }
            
            if arr[j] == -1 {
                rootNode = j
            }
        }
    }
    
    delete(deleteNum)
    dfs(rootNode)
    print(result)
    
    func delete(_ num: Int) {
        
        if tree[num].isEmpty {
            tree[num].append(DELETE)
            return
        }
        
        for node in tree[num] {
            delete(node)
        }
        
        tree[num] = [DELETE]
    }

    func dfs(_ num: Int) {
        if tree[num].isEmpty {
            result += 1
            return
        }
        
        if tree[num][0] == DELETE {
            return
        }
        
        if tree[num].filter({!tree[$0].isEmpty && tree[$0][0] == DELETE }).count == tree[num].count {
            result += 1
            return
        }
        
        for node in tree[num] {
            dfs(node)
        }
        
    }
    
}

main()

