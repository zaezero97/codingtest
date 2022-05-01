//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ new_id:String) -> String {
    
    var id = new_id
    
    //1단계
    id = id.lowercased()
    
    //2단계
    var result = ""
    for char in id {
        if char.isLowercase || char.isNumber || char == "-" || char == "_" || char == "." {
            result += String(char)
        }
    }
    id = result
    
    //3단계
    while true {
        let newId = id.replacingOccurrences(of: "..", with: ".")
        if newId == id {
            break
        }
        id = newId
    }
    
    //4단계
    if let first = id.first, first == "." {
        id.removeFirst()
    }
    if let last = id.last, last == "." {
        id.removeLast()
    }
    
    //5단계
    if id.isEmpty {
        id = "a"
    }
    
    //6단계
    if id.count >= 16 {
        id = String(id[id.startIndex ..< id.index(id.startIndex, offsetBy: 15)])
    }
    if let last = id.last, last == "." {
        id.removeLast()
    }
    
    //7단계
    if id.count <= 2 {
        while id.count < 3 {
            id += String(id.last!)
        }
    }
    
    
    return id
}
