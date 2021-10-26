import Foundation

func solution(_ a:[Int]) -> Int {
    var left = 0
    var right = a.count - 1
    var left_min = a[left]
    var right_min = a[right]
    var answer = 0
    while left < right{
        if a[left]>a[right]
        {
            left += 1
            if a[left] < left_min
            {
                answer += 1
                left_min = a[left]
            }
        }else
        {
            right -= 1
            if a[right] < right_min
            {
                answer += 1
                right_min = a[right]
            }
        }
    }
    
    return answer+1
}

solution([-16,27,65,-2,58,-92,-71,-68,-61,-33])
