//
//  main.swift
//  4358.생태학
//
//  Created by 재영신 on 2022/05/14.
//

import Foundation
func getPercentage(value: Double, total: Double) -> String {
    let percent = value/total * 100
    let roundPercent = round(percent * 10000) / 10000
    return String(format: "%.4f", roundPercent)
}
func main() {
    var dic = [String: Int]()
    var n = 0
    while true {
        if let input = readLine() {
            n += 1
            dic[input] = (dic[input] ?? 0) + 1
        } else {
            break
        }
    }
    
    for (key, value) in dic.sorted(by: { $0.key < $1.key}) {
        print("\(key) \(getPercentage(value: Double(value), total: Double(n)))")
    }
}

main()
