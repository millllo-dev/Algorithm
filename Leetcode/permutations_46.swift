//
//  permutations_46.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/29/26.
//

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var list: [Int] = []
        // 결과값
        var results: [[Int]] = []
        // 방문 여부 확인
        var isVisited : [Bool] = Array(repeating: false, count: nums.count)

        func permutation(_ nums : [Int], _ idx : Int) {
            if(idx >= nums.count) {
                results.append(list)
                return
            }

            for i in 0..<nums.count {
                // 중복 요소가 있으면 안되니, isVisited를 통해 체크
                if(isVisited[i]) { continue }
                
                // 방문 처리 진행 + 값 추가
                list.append(nums[i])
                isVisited[i] = true

                // 재귀함수 호출
                permutation(nums, idx + 1)

                // 방문 처리 해제 + 값 제거
                isVisited[i] = false
                list.removeLast()
            }
        }

        permutation(nums, 0)

        return results
    }
}
