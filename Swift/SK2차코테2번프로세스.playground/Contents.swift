import UIKit


struct Job: Comparable {
    static func < (lhs: Job, rhs: Job) -> Bool {
        if lhs.type.rawValue == rhs.type.rawValue {
            return lhs.start < rhs.start
        } else {
            return lhs.type.rawValue < rhs.type.rawValue
        }
    }
    
    let index: Int
    let type: JobType
    let start: Int
    let duration: Int
    let startIndex: Int
    let endIndex: Int
    let value: Int?
}
enum JobType: Int {
    case read = 1
    case write = 0
}

struct PriorityQueue<T: Comparable> {
    
    var arr: Array<T>
    private let sort: (T, T) -> Bool
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        self.arr = elements
        self.sort = sort
    }
    
    var count : Int {
        return arr.count
    }
    var isEmpty : Bool {
        return arr.isEmpty
    }
    
    func top () -> T? {
        return arr.first
    }
    mutating func clear () {
        arr.removeAll()
    }
    
    mutating func push(_ value: T) {
        arr.append(value)
        if arr.count == 1 {
            return
        }
        var valueIndex = arr.count - 1
        var parentIndex = (valueIndex-1) / 2
        while !sort(arr[parentIndex], arr[valueIndex]) {
            arr.swapAt(valueIndex, parentIndex)
            valueIndex = parentIndex
            parentIndex = (valueIndex-1) / 2
            if valueIndex == 0 {
                break
            }
        }
        
    }
    mutating func pop() -> T? {
        if arr.count == 0 {
            return nil
        }
        if arr.count == 1 {
            return arr.removeFirst()
        }
        func isChildEmpty(_ value: Int,_ left: Int,_ right: Int) -> Bool {
            if arr.count <= left {
                return true
            }
            if arr.count > right {
                return false
            }
            if sort(arr[value], arr[left]) {
                return true
            }
            arr.swapAt(value, left)
            return true
        }
        arr.swapAt(0, arr.count-1)
        let answer = arr.removeLast()
        var valueIndex = 0
        var leftIndex = valueIndex * 2 + 1
        var rightIndex = valueIndex * 2 + 2
        if isChildEmpty(valueIndex, leftIndex, rightIndex) {
            return answer
        }
        while !sort(arr[valueIndex], arr[leftIndex]) || !sort(arr[valueIndex], arr[rightIndex]) {
            let index = sort(arr[leftIndex], arr[rightIndex]) ? leftIndex : rightIndex
            arr.swapAt(valueIndex, index)
            valueIndex = index
            leftIndex = valueIndex * 2 + 1
            rightIndex = valueIndex * 2 + 2
            if isChildEmpty(valueIndex, leftIndex, rightIndex) {
                break
            }
        }
        return answer
        
    }
    
}



func solution(_ arr:[String], _ processes:[String]) -> [String] {
    
    var queue = PriorityQueue<Job>([],<)
    var arr = arr
    var jobs = processes.enumerated().map {
        processes -> Job in
        let arr = processes.element.components(separatedBy: " ")
        return Job(
            index: processes.offset,
            type: arr[0] == "read" ? JobType.read : JobType.write,
            start: Int(arr[1])!,
            duration: Int(arr[2])!,
            startIndex: Int(arr[3])!,
            endIndex: Int(arr[4])!,
            value: arr.count > 5 ? Int(arr[5])! : nil
        )
    }
    
    let firstJob = jobs.removeFirst()
    let start = firstJob.start
    var emptyTime = 0
    var curTime = start
    var endTime = 0
    
    queue.push(firstJob)
    var result: [String] = []
    while !queue.isEmpty {
        var currentJob = queue.pop()!
        endTime = curTime + currentJob.duration
        if currentJob.type == .read {
            result.append(arr[currentJob.startIndex ... currentJob.endIndex].joined())
            while !queue.isEmpty, queue.top()!.type == currentJob.type {
                currentJob = queue.pop()!
                result.append(arr[currentJob.startIndex ... currentJob.endIndex].joined())
                if endTime < curTime + currentJob.duration {
                    endTime = curTime + currentJob.duration
                }
            }
        } else {
            arr.replaceSubrange(currentJob.startIndex ... currentJob.endIndex, with: [String](repeating: String(currentJob.value!), count: currentJob.endIndex - currentJob.startIndex + 1))
        }

        
        while jobs.count > 0, jobs.first!.start <= endTime {
            let job = jobs.removeFirst()
            if currentJob.type == .read, job.type == currentJob.type{
                queue.push(job)
                while !queue.isEmpty, queue.top()!.type == currentJob.type {
                    currentJob = queue.pop()!
                    result.append(arr[currentJob.startIndex ... currentJob.endIndex].joined())
                    if endTime < currentJob.start + currentJob.duration {
                        endTime = currentJob.start + currentJob.duration
                    }
                }
            } else {
                queue.push(job)
            }
        }
        
        
        curTime = endTime
        
        if queue.isEmpty, !jobs.isEmpty {
            let job = jobs.removeFirst()
            emptyTime += job.start - curTime
            curTime = job.start
            queue.push(job)
        }
        
    }
    
    return result + ["\(endTime - start - emptyTime)"]
}


solution(["1","1","1","1","1","1","1"], ["write 1 12 1 5 8","read 2 3 0 2","read 5 5 1 2","read 7 5 2 5","write 13 4 0 1 3","write 19 3 3 5 5","read 30 4 0 6","read 32 3 1 5"])
