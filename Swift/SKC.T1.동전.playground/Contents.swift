import Foundation

//1원, 5원, 10원, 50원, 100원, 500원
func solution(_ money:Int, _ costs:[Int]) -> Int {
    
    let sortedCosts = sortCosts(costs)
    var result = 0
    var money = money
    for i in 0 ..< sortedCosts.count {
        result += (money / sortedCosts[i].cost) * costs[sortedCosts[i].index]
        money %= sortedCosts[i].cost
        if money == 0 {
            return result
        }
       
    }
    
    return result
}

func sortCosts(_ arr: [Int]) -> [(index: Int, cost: Int)] {
    
    var temp = arr
    var mul = 500
    for i in 0 ..< arr.count - 1 {
        temp[i] = arr[i] * mul
        mul /= i % 2 == 0 ?  5 : 2
    }
    
    return temp.enumerated().sorted(by: { $0.element < $1.element}).map{ ($0.offset, convertToMoney($0.offset))}
}

func convertToMoney(_ index: Int) -> Int {
    switch index {
    case 0:
        return 1
    case 1:
        return 5
    case 2:
        return 10
    case 3:
        return 50
    case 4:
        return 100
    case 5:
        return 500
    default:
        return 0
    }
}
solution(4578, [1, 4, 99, 35, 50, 1000])
