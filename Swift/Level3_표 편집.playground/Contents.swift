import Foundation
var linkedList = [[Int]]()
var point = 0
var removedRow = [Int]()
func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    point = k
    linkedList = makeLinkedList(n: n)
    var move = ""
    for i in 0 ..< cmd.count{
        move = String(cmd[i].split(separator: " ").first!)
        if move == "U"{
            pointMove(n: Int(cmd[i].split(separator: " ").last!)!, isUp: true)
        }else if move == "D"{
            pointMove(n: Int(cmd[i].split(separator: " ").last!)!, isUp: false)
        }else if move == "C"{
            removeRow()
        }else{
            restoreRow()
        }
    }

    
    var answer = [String](repeating: "O", count: n)
    while !removedRow.isEmpty{
        answer[removedRow.removeLast()] = "X"
    }
    return answer.joined()
}
func past(_ n: Int) -> Int{
    return linkedList[n][0]
}
func next(_ n: Int) -> Int{
    return linkedList[n][2]
}
func pointMove(n:Int,isUp:Bool){
    for _ in 0 ..< n{
        if isUp{
            point = past(point)
        }else{
            point = next(point)
        }
    }
}
func removeRow(){
    if past(point) >= 0 {
        linkedList[past(point)][2] = next(point)
    }
    if next(point) <= linkedList.count - 1{
        linkedList[next(point)][0] = past(point)
    }
    removedRow.append(linkedList[point][1])
    if next(point) == linkedList.count{
        point = past(point)
    }else{
        point = next(point)
    }
}
func restoreRow(){
    let row = removedRow.removeLast()
    if past(row) >= 0 {
        linkedList[past(row)][2] = row
    }
    if next(row) <= linkedList.count - 1{
        linkedList[next(row)][0] = row
    }
}
func makeLinkedList( n: Int)-> [[Int]]{
    var linkedList = [[Int]]()
    for i in 0 ..< n{
        linkedList.append([i-1,i,i+1])
    }
    return linkedList
}
solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"])
// 0 2 3 5 6
