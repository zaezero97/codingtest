//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/02.
//

import Foundation

func splitTwoChar(_ s: String) -> [String] {
    
    let count = s.count
    var result = [String]()
    for i in 0 ..< count - 1{
        
        result.append(String(s[s.index(s.startIndex, offsetBy: i) ... s.index(s.startIndex, offsetBy: i+1)]))
    }
    return result
}
func solution(_ str1:String, _ str2:String) -> Int {
    
    let str1N = str1.count
    let str2N = str2.count
    

    let pattern = "[a-zA-Z]+"
    
    if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
        let str1Result = regex.matches(in: str1, options: [], range: NSRange(location: 0, length: str1N))
        let str2Result = regex.matches(in: str2, options: [], range: NSRange(location: 0, length: str2N))
        
        var str1Set = [String]()
        var str2Set = [String]()
        
        str1Set = str1Result.map {
            String(str1[Range($0.range, in: str1)!]).uppercased()
        }.map(splitTwoChar(_:)).flatMap { $0 }
        
        str2Set = str2Result.map {
            String(str2[Range($0.range, in: str2)!]).uppercased()
        }.map(splitTwoChar(_:)).flatMap { $0 }
        
        var n = 0
        str1Set.forEach {
            s in
            if let index = str2Set.firstIndex(where: { $0 == s}) {
                n += 1
                str2Set.remove(at: index)
            }
        }
        print(n, str1Set.count, str2Set.count)
        if str1Set.count + str2Set.count == 0{
            return 65536
        } else if n == 0{
            return 0
        }
        
        return Int((Double(n) / Double((str1Set.count + str2Set.count))) * 65536.0)
    }
    
    return 0
}

print(solution("E=M*C^2", "e=m*c^2"))
