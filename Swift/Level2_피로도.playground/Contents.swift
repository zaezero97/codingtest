import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var visited = [Bool](repeating: false, count: dungeons.count)
    var max = -1
    
    func dfs(n:Int,k:Int){
        if n == dungeons.count
        {
            max = n
            return
        }
        if dungeons.enumerated().filter({ (index,element) in
            visited[index] == false && k >= element[0]
        }).count == 0
        {
            if max < n
            {
                max = n
            }
            return
        }
        for i in dungeons.indices {
            if !visited[i] , k >= dungeons[i][0]
            {
                visited[i] = true
                dfs(n: n+1, k: k-dungeons[i][1])
                visited[i] = false
            }
        }
        
    }
    dfs(n: 0,k: k)
    return -1
}

solution(80, [[80,20],[50,40],[30,10]])


