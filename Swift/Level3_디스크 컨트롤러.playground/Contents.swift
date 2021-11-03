import Foundation

struct Job{
    let reqTime : Int
    let processingTime : Int
}
func solution(_ jobs:[[Int]]) -> Int {
    var totalTime = 0
    var curTime = 0
    var working_queue = [Job]()
    var wating_queue = [Job]()
    var completeN = 0
    for job in jobs{
        wating_queue.append(Job(reqTime: job[0], processingTime: job[1]))
    }
    wating_queue.sort(by: { $0.reqTime < $1.reqTime})
    while completeN != jobs.count{
        while !wating_queue.isEmpty , wating_queue.first!.reqTime <= curTime{
            working_queue.append(wating_queue.removeFirst())
        }
        working_queue.sort(by: {$0.processingTime < $1.processingTime})
        if !working_queue.isEmpty
        {
            let completeJob = working_queue.removeFirst()
            curTime += completeJob.processingTime
            totalTime += curTime - completeJob.reqTime
            completeN += 1
        }else{
            curTime += 1
        }
    }
    return totalTime / jobs.count
}

solution([[0, 3], [4, 3], [8, 3]])
