import Foundation

func solution(_ width:Int, _ height:Int, _ diagonals:[[Int]]) -> Int {
    
    // 88C51
    let max = max(width, height)
    var res = 1
    for i in max...(width + height) {
        res *= i
        res %= 10000019
    }
    


    print(res / Factorial(min(width, height)))
    
    return 0
}
func Factorial(_ num: Int) -> Int {
    if num < 2 { return num }
    return (Factorial(num-1) * num) % 10000019
}

solution(51, 37, [[17,19]])
