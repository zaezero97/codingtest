import UIKit


public func solution(_ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let str = String(N, radix: 2).map { String($0) }

    var point: Int = Int(str.firstIndex(where: { $0 == "1"})!)
    let start = point + 1
    var result = 0
    for i in start ..< str.count {
        if str[i] == "1" {
            if result < i - point {
                result = i - point
            }
            point = i
        }
    }
    
    return result
}

solution(9)
