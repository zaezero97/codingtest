import Foundation

func solution(_ x:Int) -> Bool {
    
    var n = 0
    var testN = x
    while testN > 0
    {
         n += (testN % 10)
        testN /= 10
    }
    
    guard x % n == 0 else{
        return false
    }
    return true
        
}


solution(10)
