//
//  SpringExt.swift
//  mbti
//
//  Created by dgsw8th71 on 12/21/23.
//

extension String {
    subscript(range: CountableClosedRange<Int>) -> String? {
        let start = range.lowerBound
        let end = range.upperBound

        guard start >= 0, start < count, end >= start, end < count else {
            return nil
        }

        let startIndex = index(self.startIndex, offsetBy: start)
        let endIndex = index(self.startIndex, offsetBy: end)

        return String(self[startIndex...endIndex])
    }
}
