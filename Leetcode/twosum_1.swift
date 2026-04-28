//
//  twosum_1.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var maps : [Int:Int] = [:]
        var result : [Int] = []

        func find() {
            for i in 0..<nums.count {
                let diff = target - nums[i]

                if let v = maps[diff] {
                    result.append(v)
                    result.append(i)
                    break
                }

                maps[nums[i]] = i
            }
        }

        find()

        return result
    }
}
