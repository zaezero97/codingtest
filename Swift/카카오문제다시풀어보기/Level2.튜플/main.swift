//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//


import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    s.removeFirst()
    s.removeLast()
    var result = [Int]()
    var splitedStr = s.split(whereSeparator: { $0 == "{" || $0 == "}"}).map { String($0)}
    splitedStr.removeAll(where: { $0 == ","})
    let sortedStr = splitedStr.sorted(by: { $0.count < $1.count})
    sortedStr.forEach { str in
        let intArr = str.split(separator: ",").map { Int(String($0))! }
        for i in 0 ..< intArr.count {
            if !result.contains(intArr[i]) {
                result.append(intArr[i])
            }
        }
    }
    return result
}

print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
