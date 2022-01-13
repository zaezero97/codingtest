//
//  main.swift
//  1764.듣보잡
//
//  Created by 재영신 on 2022/01/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let M = input[1]
solve()
func solve() {
    var arr = [String](repeating: "", count: N)
    var result = [String]()
    for i in 0 ..< N {
        arr[i] = readLine()!
    }
    
    arr.sort()
    
    for _ in 0 ..< M {
        let index =  binarySearch(s: readLine()!)
        if index != -1 {
            result.append(arr[index])
        }
    }
    result.sort()
    print(result.count)
    for i in 0 ..< result.count {
        print(result[i])
    }
    func binarySearch(s: String) -> Int{
        var low = 0
        var high = arr.count - 1
        
        while low <= high {
                let mid = (low + high) / 2
                let guess = arr[mid]
                if guess == s {
                    return mid
                } else if guess > s {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        return -1
    }
}



