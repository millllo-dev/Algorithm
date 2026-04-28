//
//  피로도.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var count : Int = 0
    var isVisited : [Bool] = Array(repeating: false, count: dungeons.count)
    
    func isValid(_ currK : Int, _ dungeonsK : Int) -> Bool {
        if(currK >= dungeonsK) {
            return true
        }
        
        return false
    }
    
    func search(_ n : Int, _ currK : Int) {
        count = max(count, n)
        
        for i in 0..<dungeons.count {
            if(!isVisited[i] && isValid(currK, dungeons[i][0])) {
                isVisited[i] = true
                search(n + 1, currK - dungeons[i][1])
                isVisited[i] = false
            }
        }
    }
    
    search(0, k)
    
    return count
}
