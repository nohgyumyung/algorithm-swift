// https://leetcode.com/problems/plus-one/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var idx = digits.count - 1

        while idx >= 0 {
            if digits[idx] == 9 {
                digits[idx] = 0
                idx -= 1
            } else {
                break
            }
        }

        if idx == -1 {
            digits.insert(1, at: 0)
        } else {
            digits[idx] += 1
        }

        return digits
    }
}