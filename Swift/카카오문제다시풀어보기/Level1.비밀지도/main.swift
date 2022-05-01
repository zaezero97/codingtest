//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0 ..< n {
        
        var arr1Binary = String(arr1[i], radix: 2).map { Int(String($0))! }
        var arr2Binary = String(arr2[i], radix: 2).map { Int(String($0))! }
        var line = ""
        if arr1Binary.count < n {
            let zeros = [Int](repeating: 0, count: n - arr1Binary.count)
            arr1Binary = zeros + arr1Binary
        }
        
        if arr2Binary.count < n {
            let zeros = [Int](repeating: 0, count: n - arr2Binary.count)
            arr2Binary = zeros + arr2Binary
        }
        for j in 0 ..< n {
            if arr1Binary[j] == 1 || arr2Binary[j] == 1 {
                line += "#"
            } else {
                line += " "
            }
        }
    
        answer.append(line)
    }
    return answer
}
solution(1, [], [])
