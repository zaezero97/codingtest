import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {

    let M = key.count
    let N = lock.count

    var key = key
    var Matrix = [[Int]](repeating: [Int](repeating: 0, count:(M*2) + N), count: (M*2)+N) // 자물쇠보다 큰 배열을 선언하여 이 배열에서 키를 돌려가면서 값을 확인
    for x in 0..<N
    {
        for y in 0..<N
        {
            Matrix[y+M][x+M] = lock[y][x] //큰 배열 가운데에 자물쇠를 놓는다.
        }
    }


    for _ in 0..<4
    {
        key = rotate90(key: key, M: M) //키를 90도 씩회전하면서 검사한다.
        for x in 1..<M+N
        {
            for y in 1..<M+N
            {
                attach(x: x, y: y, M: M, key: key, Matrix: &Matrix) // 키를 삽입
                if check_lock(Matrix: Matrix, N: N,M:M)
                {
                    return true
                }
                detach(x: x, y: y, M: M,key: key, Matrix: &Matrix) // 키를 넣고 체크 한 후 맞지 않으면 키를 뺀다.
            }
        }
    }
    return false
}
func attach(x:Int,y:Int,M:Int,key:[[Int]],Matrix : inout [[Int]]){
    for i in 0..<M{
        for j in 0..<M
        {
            Matrix[y+i][x+j] += key[i][j]
        }
    }
}
func detach(x:Int,y:Int,M:Int,key:[[Int]],Matrix : inout [[Int]])
{
    for i in 0..<M{
        for j in 0..<M
        {
            Matrix[y+i][x+j] -= key[i][j]
        }
    }
}
func check_lock(Matrix : [[Int]],N:Int,M:Int) -> Bool{
    for i in 0..<N{
        for j in 0..<N
        {
            if Matrix[i+M][j+M] != 1
            {
                return false
            }
        }
    }
    return true
}
func rotate90(key : [[Int]], M : Int) -> [[Int]]{
    var rotate_arr = [[Int]](repeating: [Int](repeating: 0, count: M), count: M)
    for x in 0..<M
    {
        for y in stride(from: M-1, to: -1, by: -1)
        {
            rotate_arr[x][M-1-y] = key[y][x]
        }
    }
    return rotate_arr
}



solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])


