import UIKit

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    let set = Set<String>(report)
    var reports = [String: [String]]()
    var result = [String: Int]()
    id_list.forEach { id in
        reports[id] = [String]()
        result[id] = 0
    }
    
    for str in set {
        let report = str.components(separatedBy: " ")
        reports[report[1]]!.append(report[0])
    }
    
    reports.forEach { reciver, reporters in
        if reporters.count >= k {
            reporters.forEach { reporter in
                result[reporter]! += 1
            }
        }
    }
    
    var answer: [Int] = []
    id_list.forEach { id in
        answer.append(result[id]!)
    }
    return answer
}


solution(["muzi", "frodo", "apeach", "neo"],["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"],2)
