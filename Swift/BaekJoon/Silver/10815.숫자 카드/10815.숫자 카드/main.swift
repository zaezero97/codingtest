//
//  main.swift
//  10815.숫자 카드
//
//  Created by 재영신 on 2022/05/17.
//

import Foundation



func main() {
    _ = Int(readLine()!)!
    let cards = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)
    let m = Int(readLine()!)!
    let testCards = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    func binary_search(testCard: Int) -> Bool {
        var start = 0
        var end = cards.count - 1
        
        while end >= start {
            let mid = (end + start) / 2
            if cards[mid] == testCard {
                return true
            }
            
            if cards[mid] > testCard {
                end = mid - 1
            } else {
                start = mid + 1
            }
            
        }
        
        return false
    }
    
    var result = ""
    for i in 0 ..< m {
        result += binary_search(testCard: testCards[i]) ? "1 " : "0 "
    }
    print(result)
}

main()

