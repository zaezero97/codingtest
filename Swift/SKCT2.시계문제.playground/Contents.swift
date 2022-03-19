import UIKit


func solution(_ n:Int, _ clockwise:Bool) -> [[Int]] {
    var square = [[Int]](repeating:[Int](repeating:0, count: n), count: n)
    let num = 1
    let first = 0
    let last = n-1
    func draw(num: Int, first: Int, last: Int) {
    
        square[first][first] = num
        square[first][last] = num
        square[last][last] = num
        square[last][first] = num
        
        var values: [Int] = []
        values.append(contentsOf: stride(from: num+1, through: (num+1)+(last-first-2), by: 1))
        if values.count == 0 {
            return
        }
        let vertex = values[values.index(before: values.endIndex)] + 1
        if !clockwise {
            values.reverse()
        }
        var indexArray: [Int] = []
        indexArray.append(contentsOf: stride(from: first+1, through: last-1, by: 1))
        for (m, a) in indexArray.enumerated() {
            let reversed_a: Int = n-a-1
            square[first][a] = values[m]
            square[a][last] = values[m]
            square[last][reversed_a] = values[m]
            square[reversed_a][first] = values[m]
        }
        draw(num: vertex, first: first+1, last: last-1)
    }
    draw(num: num, first: first, last: last)
    square.forEach {
        print($0)
    }
    return square
}
solution(6, false)
