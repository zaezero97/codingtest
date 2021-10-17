import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    let edge = edge.sorted(by: {$0[0]<$1[0]})
    var visited = [Bool](repeating: false, count: n+1)
    var result = [Int:[Int]]()
    func dfs(_ node : Int,_ depth : Int)
    {
        for eg in edge
        {
            if eg[0] == node , !visited[eg[1]]
            {
                visited[eg[1]] = true
                dfs(eg[1],depth+1)
            }
        }
        if var arr = result[depth]
        {
            arr.append(node)
            result.updateValue(arr, forKey: depth)
        }else{
            result.updateValue([node], forKey: depth)
        }
    }
    dfs(1,0)
    print(result)
    return 0
}

solution(6,[[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])



