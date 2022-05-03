//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//

import Foundation


func solution(_ relation:[[String]]) -> Int {
    
    var candiKeys = [[Int]]()
    var keys = Set<[Int]>()
    func comb(n: Int, r: Int, start: Int, key: [Int]) {
        
        if r == 0 {
            candiKeys.append(key)
            return
        }
        
        for i in start ..< n {
            comb(n: n, r: r - 1, start: i + 1, key: key + [i])
        }
    }
    
    for i in 1 ... relation[0].count {
        comb(n: relation[0].count, r: i, start: 0, key: [])
    }
    
    var index = 0
    
    print(candiKeys)
    while candiKeys.count > index {
        let temp = relation.map { strArr -> [String] in
            var result = [String]()
            for j in 0 ..< candiKeys[index].count {
                result.append(strArr[candiKeys[index][j]])
            }
            return result
        }
        
        if Set(temp).count == temp.count {
            keys.insert(candiKeys[index])
            let keySet = Set(candiKeys[index])
            candiKeys.removeAll {  key in
                Set(key).isSuperset(of: keySet)
            }
            continue
        }
        index += 1
    }

    return keys.count
}
print(solution([["a","1","aaa","c","ng"],
    ["a","1","bbb","e","g"],
    ["c","1","aaa","d","ng"],
    ["d","2","bbb","d","ng"]]
))
