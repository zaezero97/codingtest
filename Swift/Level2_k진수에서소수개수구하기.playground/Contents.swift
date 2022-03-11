import UIKit

func solution(_ n:Int, _ k:Int) -> Int {
    
    let kNum = String(n,radix: k)
    
    var nums = kNum.components(separatedBy: "0")
    nums.removeAll(where: { $0 == ""})
    var answer = 0
    for num in nums {
        let n = Int(num)!
        if isPrime(num: n) {
            answer += 1
        }
    }
    
    return answer
}

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

solution(110011, 10)
