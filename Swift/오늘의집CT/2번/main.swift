//
//  main.swift
//  오늘의집CT
//
//  Created by 재영신 on 2022/04/09.
//

import Foundation

func solution(_ call: String) -> String {
    
    var removeArr = [String]()
    let callArr = Array(call).map { String($0) }
    let length = call.count
    var max = 0
    
    for i in 0 ..< length {
        for j in i ..< length {
            let subStr = callArr[i...j].joined().lowercased()
            var num = 0
            
            if (j - i + 1) < length - j {
                for z in j+1 ... length - (j - i + 1) {
                    if subStr == callArr[z..<z+(j-i+1)].joined().lowercased() {
                        num += 1
                    }
                }
            }
            if num == max {
                removeArr.append(subStr)
            } else if num > max {
                max = num
                removeArr = [subStr]
            }
        }
    }
    
    print(removeArr)
    var call = call
    removeArr.sorted(by: { $0.count > $1.count }).forEach { removeStr in
        let regex = try! NSRegularExpression(
            pattern: removeStr,
            options: .caseInsensitive
        )
        let result = regex.matches(in: call, options: [], range: NSRange(location: 0, length: call.count))
        result.map {
            element -> String in
            let range = Range(element.range, in: call)!
            return String(call[range])
        }.forEach {
            call = call.replacingOccurrences(of: $0, with: "")
        }
    }
    return call
}

print(solution("ABCdABCds"))
