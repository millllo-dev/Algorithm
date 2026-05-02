//
//  main.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    var que1 = queue1
    var que2 = queue2
    
    let n = queue1.count
    
    var q1sum = queue1.reduce(0, +)
    var q2sum = queue2.reduce(0, +)
    
    for i in 0..<n*3 {
        if q1sum == q2sum {
            return i
        }
        else if q1sum > q2sum {
            let value = que1.removeFirst()
            que2.append(value)
            
            q1sum -= value
            q2sum += value
        }
        else {
            let value = que2.removeFirst()
            que1.append(value)
            
            q1sum += value
            q2sum -= value
        }
    }
    
    return -1;
}
