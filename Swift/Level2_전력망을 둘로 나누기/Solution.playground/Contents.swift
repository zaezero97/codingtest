import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {

    var tree : [[Int]] = [[Int]].init(repeating: [Int](), count: n)
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: n+1)
    var cut_pylon = 0
    var cur_node = 0
    wires.forEach{
        tree[$0[0]-1].append($0[1])
        tree[$0[1]-1].append($0[0])
    }
    var min = 1000000
    var temp = [[Int]]()
    print(tree)
    
    
    wires.forEach{
        queue.append($0[0])
       
        cut_pylon = 1
        visited[$0[0]] = true
        temp = tree
        temp[$0[0]-1].remove(at: temp[$0[0]-1].firstIndex(of: $0[1])!)
        temp[$0[1]-1].remove(at: temp[$0[1]-1].firstIndex(of: $0[0])!)

        while !queue.isEmpty
        {
            cur_node = queue.removeFirst()
            for node in temp[cur_node-1]
            {
                if(!visited[node])
                {
                    visited[node] = true
                    queue.append(node)
                    cut_pylon += 1
                }
            }

        }
        if min > abs((n - cut_pylon) - cut_pylon)
        {
            min = abs((n - cut_pylon) - cut_pylon)
        }
        visited = [Bool](repeating: false, count: n+1)
    }
    print(min)
    return min
}
   

solution(2, [[1,2]])
