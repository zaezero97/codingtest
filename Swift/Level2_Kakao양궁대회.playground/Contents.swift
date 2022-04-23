import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var max = -1
    var temp = [[Int]]()
    
    func dfs(arrow: Int, rion:[Int], depth: Int) {
        var newArrow = arrow
        var newRion = rion
        
        if arrow <= 0 || depth == 10 {
            newRion[10] = depth == 10 ? arrow : 0
            let point = getPoint(info: info, rion: rion)
            if max < point {
                max = point
                temp = [newRion]
            } else if max == point {
                temp.append(newRion)
            }
            return
        }
        
        if arrow > info[depth] {
            newArrow -= info[depth] + 1
            newRion[depth] = info[depth] + 1
            dfs(arrow: newArrow, rion: newRion, depth: depth+1)
            newRion[depth] = 0
        }
        dfs(arrow: arrow, rion: newRion, depth: depth+1)
    }
    
    dfs(arrow: n, rion: [Int](repeating: 0, count: 11), depth: 0)
    
    if max < 0 {
        return [-1]
    }
    return sortByMoreLowerScore(temp)
}

func sortByMoreLowerScore(_ temp: [[Int]]) -> [Int]{
    print(temp)
    var answer:[Int] = temp.first!
    var max = 0
    for history in temp {
        let numCount = history.filter{$0 != 0 }.count
        if max < numCount {
            answer = history
            max = numCount
        }
    }
    print(answer)
    return answer
}

func getPoint(info: [Int], rion: [Int]) -> Int {
    var ryan = 0
    var apeach = 0
    for i in 0 ..< info.count {
        if rion[i] == 0 {
            if info[i] != 0 {
                apeach += 10 - i
            }
        } else {
            ryan += 10 - i
        }
    }
    
    return ryan - apeach
}

print(solution(10, [0,0,0,0,0,0,0,0,3,4,3]))
