//
//  main.swift
//  20437.문자열 게임
//
//  Created by 재영신 on 2022/05/06.
//

import Foundation

func main() {
    let T = Int(readLine()!)!
    
    for _ in 0 ..< T {
        let w = readLine()!
        let k = Int(readLine()!)!
        
        print(solve(w, k))
        
    }
}

func solve(_ w: String, _ k: Int) -> String {
    
    
    
    var dic = [Int:[Int]]()
    
    for (i, char) in w.enumerated() {
        dic[Int(char.asciiValue!) - 97] = (dic[Int(char.asciiValue!) - 97] ?? []) + [i]
    }
    
    var minL = Int.max
    var maxL = 0
    for i in 0 ... 26 {
        if dic[i]?.count ?? 0 < k {
            continue
        }
        
        for j in 0 ... dic[i]!.count - k {
            minL = min(minL, dic[i]![j+k-1] - dic[i]![j] + 1)
            maxL = max(maxL, dic[i]![j+k-1] - dic[i]![j] + 1)
        }
    }
    return minL == Int.max || maxL == 0  ? "-1" : "\(minL) \(maxL)"
}
main()

