//
//  main.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

import Foundation

var nums = readLine()!.split(separator: " ").map { Int($0)! }
var target = Int(readLine()!)!

var results: [Int] = []
var bucket : [Int] = []

func find(res : [Int]) -> [Int] {
    var b = res
    var maps : [Int:Int] = [:]
    
    for i in 0..<nums.count {
        let diff = target - nums[i]
        
        if let value = maps[diff] {
            b.append(value)
            b.append(i)
            break
        }
        maps[nums[i]] = i
    }
    
    return b
}

results = find(res: bucket)
print(results)
