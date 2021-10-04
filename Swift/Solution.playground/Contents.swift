func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0,+)
}


solution([1,2,3,4,6,7,8,0])
