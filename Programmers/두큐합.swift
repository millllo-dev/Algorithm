//
//  두큐합.swift
//  algorithm-swift
//
//  Created by 정종찬 on 5/2/26.
//

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    // 제네릭 Queue 구조체 활용
    var que1: Queue<Int> = Queue()
    var que2: Queue<Int> = Queue()
    
    let n = queue1.count
    
    // 각 큐 원소의 합
    var q1sum = 0
    var q2sum = 0
    
    // 큐 구성 및 각 큐 원소 총합
    for value in queue1 {
        que1.enqueue(value)
        q1sum += value
    }
    
    for value in queue2 {
        que2.enqueue(value)
        q2sum += value
    }
    
    // 3n까지 체크
    // - queue1 -> queue2 / queue2 -> queue1 (n + n = 2n)
    // - 같은 원소가 2번 이동할 수 있음 (같은 원소가 다시 돌아오는 상황 발생)
    // - 최대 2n보다 커질 수 있으므로, 3n으로 범위를 설정한다
    // - 즉, 한 바퀴(2n) + 추가 조정 구간 = 3n
    // - 정확한 경계값이 아닌, 논리적 상한임
    for i in 0..<n*3 {
        if q1sum == q2sum {
            return i
        }
        else if q1sum > q2sum {
            guard let value = que1.dequeue() else {return -1}
            que2.enqueue(value)
            
            q1sum -= value
            q2sum += value
        }
        else {
            guard let value = que2.dequeue() else {return -1}
            que1.enqueue(value)
            
            q1sum += value
            q2sum -= value
        }
    }
    
    return -1;
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
