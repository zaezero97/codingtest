import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var answer = 0
    var left = 1
    var right = 200000000
    var mid = 0
    while left <= right {
        mid = (left + right) / 2
        
        if is_Cross(mid: mid, stones: stones, k: k)
        {
            left = mid + 1
            if answer < mid
            {
                answer = mid
            }
        }else{
            right = mid - 1
        }
    }
    return answer
}
func is_Cross(mid : Int, stones : [Int] , k : Int) -> Bool{
    var n = 0
    for i in 0 ..< stones.count{
        if stones[i] - mid <= 0{
            n += 1
        }else{
            n = 0
        }
        
        if n == k{
            return false
        }
    }
    return true
}
solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3)

