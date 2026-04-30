//
//  dailytemperatures_739.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/30/26.
//

import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result : [Int] = Array(repeating: 0, count: temperatures.count)
        var stack : [Int] = []

        for idx in 0..<temperatures.count {
            while let last = stack.last, temperatures[last] < temperatures[idx] {
                    let prevIdx = stack.removeLast()
                    result[prevIdx] = idx - prevIdx
                    
                }
            
            stack.append(idx)
        }

        return result
    }
}
