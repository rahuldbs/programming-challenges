// JourneyToMoon.swift

import Foundation

// https://www.hackerrank.com/challenges/journey-to-the-moon/problem
class JourneyToMoon {

    let input = readLine()!.components(separatedBy: " ")
    let n = Int(input[0])!
    let p = Int(input[1])!
    var list = [[Int]](repeating: [Int](), count: n)
    var Q = [Int]()
    var visited = [Int](repeating: 0, count: n)

    func bfs(_ src: Int, _ graph: [[Int]]) -> Int {
        visited[src] = 1
        Q.append(src)
        var count = 1
        while !Q.isEmpty {
            let u = (Q.first)!
            Q.remove(at: 0)
            for (_ , ele) in graph[u].enumerated() {
                if visited[ele] == 0 {
                    visited[ele] = 1
                    count += 1
                    Q.append(ele)
                }
            }
        }
        return count
    }
    
    func waysOfPairSelestion(_ n:Int, _ people:[[Int]]) -> Int {
        var result = 0
        var sum = 0
        for i in 0 ..< n {
            if visited[i] == 0 {
                let fellow = bfs(i, people)
                result += sum * fellow
                sum += fellow
            }
        }
        
        return result
    }

    for _ in 0 ..< p {
        let str = readLine()!.components(separatedBy: " ")
        let a = Int(str[0])!
        let b = Int(str[1])!
        list[a].append(b)
        list[b].append(a)
    }
    print(waysOfPairSelestion(n, list))

}