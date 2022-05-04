//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation
func solution(_ files:[String]) -> [String] {
    
    return files.sorted { file1, file2 in
        let file1Index = file1.firstIndex(where: {$0.isNumber})!
        let file1Head = file1[file1.startIndex ..< file1Index]
        let file2Index = file2.firstIndex(where: {$0.isNumber})!
        let file2Head = file2[file2.startIndex ..< file2Index]
        
        if file1Head.uppercased() < file2Head.uppercased() {
            return true
        } else if file1Head.uppercased() > file2Head.uppercased() {
            return false
        }
        
        let removedHeadfile1 = file1[file1Index ..< file1.endIndex]
        let removedHeadfile2 = file2[file2Index ..< file2.endIndex]
        
        let file1Number = removedHeadfile1.prefix(while: { $0.isNumber })
        let file2Number = removedHeadfile2.prefix(while: { $0.isNumber })
        
        return Int(file1Number)! < Int(file2Number)!
        
    }
    
}

print(solution( ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]))
