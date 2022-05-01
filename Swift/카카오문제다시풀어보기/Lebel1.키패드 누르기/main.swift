//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var result = ""
    var leftPos = (x: 0, y: 3)
    var rightPos = (x: 2, y: 3)
    
    var keypad = [[Int]]()
    keypad.append([1,2,3])
    keypad.append([4,5,6])
    keypad.append([7,8,9])
    keypad.append([10,0,11])
    
    
    for i in 0 ..< numbers.count {
        if numbers[i] == 1 || numbers[i] == 4 || numbers[i] == 7 {
            result += "L"
            leftPos = (x: 0, y: (numbers[i] - 1)/3)
        } else if numbers[i] == 3 || numbers[i] == 6 || numbers[i] == 9 {
            result += "R"
            rightPos = (x: 2 ,y: (numbers[i] - 3)/3)
        } else {
            if numbers[i] == 0 {
                let leftDistance = abs(1 - leftPos.x) + abs(3 - leftPos.y)
                let rightDistance = abs(1 - rightPos.x) + abs(3 - rightPos.y)
                if leftDistance < rightDistance {
                    result += "L"
                    leftPos = (x: 1, y: 3)
                } else if leftDistance > rightDistance {
                    result += "R"
                    rightPos = (x: 1, y: 3)
                } else {
                    if hand == "left" {
                        result += "L"
                        leftPos = (x: 1, y: 3)
                    } else {
                        result += "R"
                        rightPos = (x: 1, y: 3)
                    }
                }
            } else {
                let numPos = (x: 1, y: numbers[i] / 3)
                let leftDistance = abs(1 - leftPos.x) + abs(numPos.y - leftPos.y)
                let rightDistance = abs(1 - rightPos.x) + abs(numPos.y - rightPos.y)
                if leftDistance < rightDistance {
                    result += "L"
                    leftPos = numPos
                } else if leftDistance > rightDistance {
                    result += "R"
                    rightPos = numPos
                } else {
                    if hand == "left" {
                        result += "L"
                        leftPos = numPos
                    } else {
                        result += "R"
                        rightPos = numPos
                    }
                }
            }
        }
    }
    
    return result
}
