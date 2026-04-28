//
//  wordsearch_79.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        // x, y 좌표 이동값 (상하좌우)
        var dx : [Int] = [1, -1, 0, 0]
        var dy : [Int] = [0, 0, 1, -1]

        // 방문 여부 확인
        var isVisited : [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)

        func backtracking(_ word : String, _ idx : Int, _ row : Int, _ col : Int) -> Bool {
            // 현재 인덱스가 비교군 단어 크기랑 같으면 return
            if(idx == word.count) {
                return true
            }

            // 1. 유효한 격자 좌표인지 확인
            // 2. 이미 방문한 격자인지
            // 3. 격자의 문자가 현재 인덱스의 문자와 같은지
            if(!isValid(row, col) || isVisited[row][col] || board[row][col] != charAt(word, idx)) {
                return false
            }

            // 방문처리
            isVisited[row][col] = true

            // 이동한 좌표의 문자 비교
            for i in 0..<4 {
                let xpos = row + dx[i]
                let ypos = col + dy[i]

                if(backtracking(word, idx + 1, xpos, ypos)) {
                    return true
                }
            }

            isVisited[row][col] = false

            return false
        }

        func isValid(_ x : Int, _ y : Int) -> Bool {
            if(x >= 0 && x < board.count && y >= 0 && y < board[0].count) {
                return true
            }
            return false
        }

        func charAt(_ str : String, _ idx : Int) -> Character {
            let index = str.index(str.startIndex, offsetBy: idx)
            return str[index]
        }

        for x in 0..<board.count {
            for y in 0..<board[0].count {
                if(backtracking(word, 0, x, y)) {
                    return true
                }
            }
        }
        
        return false
    }
}
