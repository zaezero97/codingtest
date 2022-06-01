//
//  main.swift
//  18258.큐 2
//
//  Created by 재영신 on 2022/06/01.
//

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    var first: T? {
        return queue.first
    }
    
    var last: T? {
        return queue.last
    }
    
    public mutating func dequeue() -> T? {
        guard head <= queue.count else { return nil }
        let element = queue[head]
        head += 1
        
        if head > 100000 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

func main() {
    let n = Int(readLine()!)!
    var queue = Queue<String>()
    
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        switch input[0] {
        case "push":
            queue.enqueue(input[1])
        case "front":
            print(queue.isEmpty ? "-1" : queue.first!)
        case "back":
            print(queue.isEmpty ? "-1" : queue.last!)
        case "size":
            print(queue.count)
        case "empty":
            print(queue.isEmpty ? "1" : "0")
        case "pop":
            print(queue.isEmpty ? "-1" : queue.dequeue()!)
        default:
            break
        }
    }
}

main()

