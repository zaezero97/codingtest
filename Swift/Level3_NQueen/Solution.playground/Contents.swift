import Foundation


func solution(_ n:Int) -> Int {
    var answer = 0
    var arr = [Int](repeating: -1, count: n)
    func dfs(_ depth : Int){
        if depth == n
        {
            answer += 1
            return
        }
        for i in 0 ..< n
        {
            arr[depth] = i
            if(is_possible(depth))
            {
                dfs(depth+1)
            }
        }
    }
    func is_possible (_ col : Int) -> Bool{
        for i in 0 ..< col{
            if arr[col] == arr[i]
            {
                return false
            }
            else if abs(arr[col]-arr[i]) == abs(col-i)
            {
                return false
            }
        }
        return true
    }
    dfs(0)
    return answer
}


solution(4)
