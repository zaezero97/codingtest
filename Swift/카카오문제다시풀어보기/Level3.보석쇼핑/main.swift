//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/05.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    var left = 0
    var right = 0
    
    var dic = [String: Int]()
    dic[gems[0]] = 1
    
    let gemKind = Set(gems)
    var min = Int.max
    var result = [Int]()
    
    while left < gems.count || right < gems.count {
        
        if gemKind.count == dic.count {
            
            if (right - left) < min{
                min = right - left
                result = [left+1,right+1]
            }
            if let value = dic[gems[left]] {
                if value - 1 == 0 {
                    dic.removeValue(forKey: gems[left])
                } else {
                    dic[gems[left]] = value - 1
                }
            }
            left += 1
        } else {
            right += 1
            if right == gems.count {
                break
            }
            dic[gems[right]] = (dic[gems[right]] ?? 0) + 1
        }
    }
    
    
    return result.isEmpty == true ? [1, gems.count] : result
}

print(solution(    ["AA", "AB", "AC", "AA", "AC"]))
