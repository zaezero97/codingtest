import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted { $0 < $1 }
    var low = 0
    var high = times[times.endIndex-1] * n
    var mid = 0
    while high != low{
        var passN = 0
        mid = (low + high) / 2
        for i in times.indices{
            passN += mid / times[i]
        }
        if passN >= n
        {
            high = mid
        }else{
            low = mid + 1
        }
    }
    
    return Int64(low)
}

solution(6, [7,10])
