import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parent = [Int]()
    var answer = 0
    for i in 0..<n
    {
        parent.append(i)
    }
    let sorted_costs = costs.sorted{ $0[2] < $1[2]}
    for edge in sorted_costs{
        let cost = edge[2]
        if find(&parent,edge[0]) != find(&parent,edge[1])
        {
            
            print(edge[0],edge[1])
            union(&parent,edge[0], edge[1])
            answer += cost
        }
    }
    return answer
}

func find(_ parent:inout [Int],_ x : Int) -> Int{
    if parent[x] == x
    {
        return x
    }
    parent[x] = find(&parent,parent[x])
    return parent[x]
}

func union(_  parent:inout [Int],_ x:Int,_ y:Int){
    let p1 = find(&parent,x)
    let p2 = find(&parent,y)
    
    if p1 > p2
    {
        parent[p1] = p2
    }else {
        parent[p2] = p1
    }
}

solution(5,  [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4], [2, 4, 6], [4, 0, 7]])

