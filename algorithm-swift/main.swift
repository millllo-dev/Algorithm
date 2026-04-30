//
//  main.swift
//  algorithm-swift
//
//  Created by 정종찬 on 4/28/26.
//

import Foundation

var s = ""

var stack : [Character] = []
for c in s {
    switch c {
    case "[":
        stack.append("]")
        break
    case "(":
        stack.append(")")
        break
    case "{":
        stack.append("}")
    default:
        if let peek = stack.last, !stack.isEmpty && peek == c {
            stack.removeLast()
        }
    }
}

stack.popLast()
