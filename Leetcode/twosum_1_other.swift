//
//  twosum_1_other.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/29/26.
//

// 기존 딕셔너리를 활용한 두 요소의 차를 통한 풀이법이 아닌
// 투 포인터 개념으로 풀이
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var bucket : [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: nums.count)

        for i in 0..<nums.count {
            bucket[i][0] = nums[i]
            bucket[i][1] = i
        }

        bucket.sort { (o1, o2) in
            return o1[0] < o2[0]
        }

        var left = 0
        var right = nums.count - 1

        while(left < right) {
            if bucket[left][0] + bucket[right][0] < target {
                left += 1
            }
            else if bucket[left][0] + bucket[right][0] > target {
                right -= 1
            }
            else {
                return [bucket[left][1], bucket[right][1]]
            }
        }
        
        print(bucket)

        return [-1, -1]
    }
}
