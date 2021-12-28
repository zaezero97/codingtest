import UIKit



func solution(_ s:String) -> Int {
    var answer = 1
    
    if s.count == 1 {
        return 1
    } else if s == String(s.reversed()) {
        return s.count
    } // 길이가 1 이거나 전체가 펠린드롬일 경우 확인
    
    let checkArray = s.map{String($0)} // [String] 으로 변환
    
    for i in 1 ..< s.count - 1 {
        if checkArray[i-1] == checkArray[i+1] { // 짝수로 판단할지 홀수개로 판달할지 확인
            let palindromeLen = getOddPalindrome(i, checkArray)
            if answer < palindromeLen {
                answer = palindromeLen
            }
        }
        if checkArray[i] == checkArray[i+1] {
            let palindromeLen = getEvenPalindrome(i, checkArray)
            if answer < palindromeLen {
                answer = palindromeLen
            }
        }
    }
    return answer
}

func getOddPalindrome (_ i: Int, _ checkArray: [String]) -> Int {
    var result = 3
    var dis = 2
    while (i+dis < checkArray.count && i-dis >= 0) {
        if checkArray[i - dis] == checkArray [i + dis] {
            result += 2
            dis += 1
        } else {
            break
        }
    }
    
    return result
}

func getEvenPalindrome (_ i: Int, _ checkArray: [String]) -> Int {
    var result = 2
    var dis = 1
    
    while (i+dis+1 < checkArray.count  && i-dis >= 0) {
        if checkArray[i - dis] == checkArray [i + dis + 1] {
            result += 2
            dis += 1
        } else {
            break
        }
    }
    
    return result
}



