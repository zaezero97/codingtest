import Foundation

//기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var result = [(num:String, duration: Int)]()
    for i in 0 ..< records.count {
        let record = records[i]
        let splitedRecord = record.components(separatedBy: " ")
        let num = splitedRecord[1]
        //let time = splitedRecord[0]
        
        if !result.contains(where: { $0.num == num}) {
            let filteredRecords = records.filter { $0.contains(num) }
            var duration = 0
            if filteredRecords.count != 1 {
                for i in stride(from: 0, to: filteredRecords.count - 1, by: 2) {
                    duration += calcTime(filteredRecords[i].components(separatedBy: " ")[0],filteredRecords[i+1].components(separatedBy: " ")[0])
                }
            }
            if filteredRecords.count % 2 != 0 {
                let last = filteredRecords.last!.components(separatedBy: " ")[0].components(separatedBy: ":")
                let res = 1439 - (Int(last[0])! * 60 + Int(last[1])!)
                duration += res
            }
            result.append((num: num, duration: duration))
        }
    }
    result.sort{ $0.num < $1.num }
    let answer = result.map {
        result -> Int in
        if result.duration < fees[0] {
            return fees[1]
        } else {
            let excessTime = result.duration - fees[0]
            let n = ceil(Double(excessTime) / Double(fees[2]))
            return fees[1] + Int(n) * fees[3]
        }
    }
    print(answer)
    return answer
}

func calcTime(_ time1: String,_ time2: String) -> Int {
    
    let splitedtime2 = time2.components(separatedBy: ":")
    let n2 = Int(splitedtime2[0])! * 60 + Int(splitedtime2[1])!
    
    let splitedtime1 = time1.components(separatedBy: ":")
    let n1 = Int(splitedtime1[0])! * 60 + Int(splitedtime1[1])!
    
    return n2 - n1
}

solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])

