//
//  main.swift
//  1753.최단경로
//
//  Created by 재영신 on 2022/05/08.
//

import Foundation

public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: <)
    }
}

struct EdgeData : Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
        
    }
    var cost : Int
    var node : Int
    
}



func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let v = firstInput[0]
    let e = firstInput[1]
    let k = Int(readLine()!)!
    
    let inf = 88888
    
    var paths = Array(repeating: [(Int,Int)]() , count: v)
    
    for _ in 0 ..< e {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        paths[input[0] - 1].append((input[1] - 1,input[2]))
    }
    
    var allDistance = [Int](repeating: inf, count: v)
    var priorityQueue = Heap<EdgeData>()
    priorityQueue.insert(EdgeData(cost: 0, node: k))
    allDistance[k] = 0
    
    
    while !priorityQueue.isEmpty {
        
        let curNode = priorityQueue.delete()!
        
        if curNode.cost > allDistance[curNode.node] {
            continue
        }
        
        for node in paths[curNode.node] {
            if node.1 + curNode.cost < allDistance[node.0] {
                allDistance[node.0] = node.1 + curNode.cost
                priorityQueue.insert(EdgeData(cost: node.1 + curNode.cost, node: node.0))
            }
        }
    }
    
    
    
    for d in allDistance {
        print(d == inf ? "INF" : d)
    }
}

main()
