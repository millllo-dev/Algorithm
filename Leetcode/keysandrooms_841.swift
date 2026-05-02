//
//  keysandrooms_841.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/30/26.
//

import Foundation

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited : [Bool] = Array(repeating: false, count: rooms.count)
        var queue : Queue<Int> = Queue()

        func dfs(_ rooms: [[Int]], _ vertex : Int) {
            if(vertex >= rooms.count) {
                return
            }

            visited[vertex] = true
            
            for key in rooms[vertex] {
                if !visited[key] {
                    dfs(rooms, key)
                }
            }
        }

        func bfs(_ vertex : Int) {
            // 첫 노드 방문처리
            visited[vertex] = true
            queue.enqueue(vertex)

            // 큐가 빌 때
            while !queue.isEmpty {
                guard let currVertex = queue.dequeue() else {break}

                //
                for next in rooms[currVertex] {
                    if(!visited[next]) {
                        queue.enqueue(next)
                        visited[next] = true
                    }
                }
            }

        }

        // dfs(rooms, 0);
        bfs(0);

        for v in visited {
            if !v {
                return false
            }
        }

        return true

    }

    // queue 구조체 구현
    struct Queue<T> {
        private var inbox: [T] = []
        private var outbox: [T] = []

        var isEmpty: Bool {
            return inbox.isEmpty && outbox.isEmpty
        }

        mutating func enqueue(_ element: T) {
            inbox.append(element)
        }

        mutating func dequeue() -> T? {
            // 선입선출 특성을 고려, 두 배열을 활용해 reversed를 통해 선입선출에 대응
            if outbox.isEmpty {
                outbox = inbox.reversed()
                inbox.removeAll()
            }
            return outbox.popLast()
        }
    }
}
