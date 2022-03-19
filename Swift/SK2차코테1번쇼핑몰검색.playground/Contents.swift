import UIKit

func solution(_ goods:[String]) -> [String] {
    
    var answer: [String] = []
    
    for i in 0 ..< goods.count {
        let target = goods[i]
        var result: [String] = []
        var count = 0
        
        while result.isEmpty {
            for j in 0 ..< (target.count - count){
                let startIndex = target.index(target.startIndex, offsetBy: j)
                let endIndex = target.index(target.startIndex, offsetBy: j+count)
                let searchWord = target[startIndex...endIndex]
                if goods.filter({ $0.contains(searchWord) }).count == 1 {
                    result.append(String(searchWord))
                }
            }
            if result.isEmpty {
                count += 1
            } else {
                let tempSet = Set(result)
                let deduplicationArr = Array(tempSet)
                answer.append(deduplicationArr.sorted(by: <).joined(separator: " "))
                break
            }
            
            if count == target.count {
                answer.append("None")
                break
            }
            
          
        }
    }
    return answer
}

solution(["abcdeabcd","cdabe","abce","bcdeab"])
