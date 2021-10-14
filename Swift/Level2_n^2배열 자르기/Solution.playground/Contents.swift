func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var arr = [Int]()
    var row = (Int(left)) / n
    var start = 0
    start = (Int(left) % n) > row ? (Int(left) % n) + 1 : row+1
    arr.append(start)
    for i in (Int(left)+1) ... Int(right)
    {
        if i % n == 0
        {
            row += 1
        }
        arr.append((i % n) > row ? (i % n) + 1 : row+1);
    }

    return arr
}

solution(4,7,14)
