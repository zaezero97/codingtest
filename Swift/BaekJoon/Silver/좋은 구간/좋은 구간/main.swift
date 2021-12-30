//
//  main.swift
//  좋은 구간
//
//  Created by 재영신 on 2021/12/30.
//

import Foundation

let L = Int(readLine()!)! // 집합의 크기
var S = readLine()!.components(separatedBy: " ").map{ Int($0)! } // 집합
let n = Int(readLine()!)!

S.sort()


let min = S.last { $0 < n }
let max = S.first { $0 > n }


if S.contains(n) {
    print(0)
} else if min == nil { // 집합의 값이 다 n보다 클 때 max가 nil인경우를 체크 안한 이유는 1<= n <= 집합에서 가장 큰 값 이기떄문에 max가 nil이면 집합에서 가장 큰 값과 일치한단 말이기 때문에 위에 if문에서 체크 된다.
  print(n*(max! - n) - 1)
} else {
    print((n - (min ?? n))*((max ?? n) - n) - 1) // 자기를 기준으로 왼쪽에서 뽑는 경우의 수 와 자기를 기준으로 오른쪽에서 하나를 뽑는 경우를 수를 구하고 곱한다. 자기 자신을 두번 동시에 뽑는 경우가 있을 수 있기 때문에 -1 를 했다.
}





