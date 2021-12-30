//
//  main.swift
//  방 번호
//
//  Created by 재영신 on 2021/12/30.
//

import Foundation

var N = readLine()! //방 번호
var roomNumberArray = Array(N).map{ String($0) }
var numbers = [Int](repeating: 0, count: 10)
for i in 0 ..< roomNumberArray.count {
    numbers[Int(roomNumberArray[i])!] += 1
}

if (numbers[6] == numbers.max()! || numbers[9] == numbers.max()!) , abs(numbers[6]-numbers[9]) > 1{
    let value = Int(floor(Double(abs(numbers[6]-numbers[9])) / 2.0))
    if numbers[6] > numbers[9] {
        numbers[6] -= value
        numbers[9] += value
    } else {
        numbers[6] += value
        numbers[9] -= value
    }
}
print(numbers.max()!)

