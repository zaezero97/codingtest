import Foundation
/*
 사용한 알고리즘 플로이드 와샬 알고리즘
 다 익스트라 알고리즘은 한 정점에서부터 다른 모든 정점으로부터의 촤단 거리를 구하는 알고리즘이다
 플로이드 와샬 알고리즘은 모든정점으로부터의 모든정점까지의 최단 거리를 구하는 알고리즘이다.
 이 문제에서는 순위를 정하기 위해선 모든 선수와의 패배와 승리를 알 수 있어야 한다 혹은 자신이 승리 혹은 패배한 선수가 다른 모든 선수와의 결과가 정해져 있어야 한다.
 즉 그래프로 따졌을 때 다른 노드와 모두 연결되어 있으면 순위를 정할 수 있다.
 따라서 플로이드 와샬 알고리즘을 통해 모든 정점으로부터 각 정점에 최단 거리를 구하고 거리를 구할 수 없는 정점이 있는 정점은 순위를 정할 수 없다고 판별하여 문제를 해결 한다.
 */
func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var inf = 9999999
    var distance = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
    var answer = [Bool](repeating: false, count: n)
    for i in 0 ..< n
    {
        distance[i][i] = 0
    } //자기 자신의 거리 0으로 지정
    for i in 0 ..< results.count
    {
        distance[results[i].first! - 1][results[i].last! - 1] = 1
    }//results배열에 따라 나와 있는 승리 선수와 패배 선수와의 거리를 1로 설정
    
    for cur_node in 0 ..< n
    {
        for i in 0 ..< n
        {
            for j in 0 ..< n
            {
                distance[i][j] = min(distance[i][j], distance[cur_node][j] + distance[i][cur_node])
            }
        }
    } // 모든 노드를 돌면서 최단 거리 갱신
    
    for i in 0 ..< n
    {
        for j in 0 ..< n
        {
            if answer[i]
            {
                break
            } // 이미 값이 true이면 다른 노드에서 확인했을 때 연결안돼있는 노드가 있다는 소리로 바로 반복문 탈출
            if i == j
            {
                continue
            } // 자기 자신은 패스
            if distance[i][j] == inf , distance[j][i] == inf
            {
                answer[i] = true
                answer[j] = true
                break
            } // 만약 i와j가 연결되어 있지 않다면 즉 모든 선수와의 우위를 가릴 수 없기 때문에 값을 true로 변경하고 break
        }
    }
    
    return answer.filter{!$0}.count // 값이 false 인 배열을 추출해서 갯수 반환
}

solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])
