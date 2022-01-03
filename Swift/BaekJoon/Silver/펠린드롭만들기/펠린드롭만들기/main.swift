//
//  main.swift
//  펠린드롭만들기
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let S = readLine()!

if S == String(S.reversed()) {
    print(S.count)
    exit(EXIT_SUCCESS)
}

var len = S.count // 붙혀서 만드는 펠린드롭 길이를 저장할 변수
var input = Array(S)

while true {
    len += 1
    if len % 2 == 1 {
        let index = len / 2
        if checkOddPalindrome(index: index) {
            print(len)
            exit(EXIT_SUCCESS)
        }
    } else {
        let index = len / 2 - 1
        if input[index] != input[index+1] {
            continue
        }
        if checkEvenPalindrome(index: index) {
            print(len)
            exit(EXIT_SUCCESS)
        }
    }
}

func checkOddPalindrome(index: Int) -> Bool {
    var i = 1
    while index - i >= 0 , index + i <= input.count - 1 {
        if input[index-i] != input[index+i] {
            return false
        }
        i += 1
    }
    return true
}

func checkEvenPalindrome(index: Int) -> Bool {
    var i = 1
    while index - i >= 0 , index + i + 1 <= input.count - 1 {
        if input[index-i] != input[index+1+i] {
            return false
        }
        i += 1
    }
    return true
}
