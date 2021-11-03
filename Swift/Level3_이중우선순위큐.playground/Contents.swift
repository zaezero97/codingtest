import Foundation


func solution(_ operations:[String]) -> [Int] {
   var split_str = [String]()
    var arr = [Int]()
    for str in operations{
        split_str = str.split(separator:" ").map { String($0)}
        if split_str[0] == "I"{
            arr.append(Int(split_str[1])!)
        }else if !arr.isEmpty
        {
            if split_str[1] == "1"{
                arr.sort(by: >)
                arr.removeFirst()
            }else{
                arr.sort(by: >)
                arr.removeLast()
            }
        }
    }
    arr.sort(by: >)
    if arr.isEmpty{
        return [0,0]
    }else{
        return [arr.first!,arr.last!]
    }
}
Int
solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])

