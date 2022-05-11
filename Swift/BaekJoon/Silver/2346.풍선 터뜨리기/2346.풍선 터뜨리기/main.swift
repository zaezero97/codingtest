//
//  main.swift
//  2346.풍선 터뜨리기
//
//  Created by 재영신 on 2022/05/11.
//

import Foundation
public struct Deque<T> {
    private var storage: [T] = []
    
    public init() {}
    
    public init(_ elements: [T]){
        storage = elements
    }
    
    public mutating func frontEnqueue(_ element: T) -> Bool{
        storage.insert(element, at: 0)
        return true
    }
    
    public mutating func backEnqueue(_ element: T) -> Bool{
        storage.append(element)
        return true
    }
    
    public mutating func frontDequeue() -> T? {
        return isEmpty ? nil : storage.removeFirst()
    }
    
    public mutating func backDequeue() -> T? {
        return isEmpty ? nil : storage.remove(at: storage.count - 1)
    }
    
    public var isEmpty: Bool {
        return storage.isEmpty
    }
    
    public var frontPeek: T? {
        return storage.first
    }
    
    public var backPeek: T? {
        return storage.last
    }
}
func main() {
    let _ = Int(readLine()!)!
    
    let balloons = readLine()!.split(separator: " ").map { Int(String($0))! }.enumerated().map{ ($0.offset, $0.element)}
    
    var deque = Deque<(Int, Int)>(balloons)
    var result = ""
    
    while true {
        let removeBalloon = deque.frontDequeue()!
        
        result += "\(removeBalloon.0 + 1) "
        if deque.isEmpty { break }
        if removeBalloon.1 > 0 {
            for _ in 0 ..< removeBalloon.1 - 1 {
                _ = deque.backEnqueue(deque.frontPeek!)
                _ = deque.frontDequeue()
            }
        } else {
            for _ in stride(from: removeBalloon.1, to: 0, by: 1) {
                _ = deque.frontEnqueue(deque.backPeek!)
                _ = deque.backDequeue()
            }
        }
    }
    
    print(result)
}

main()
