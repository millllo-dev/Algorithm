//
//  validparentheses_20.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/29/26.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack : [Character] = []

        for chr in s {
            switch chr {
                case "[":
                    stack.append("]")
                    break
                case "(":
                    stack.append(")")
                    break
                case "{":
                    stack.append("}")
                default:
                    if let peek = stack.last, !stack.isEmpty && peek == chr {
                        stack.removeLast()
                    }
                    else {
                        return false
                    }
            }
        }

        return stack.isEmpty
    }
}
