// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Hash Table, String, Backtracking
//
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//
//A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

//Example 1:
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//
//Example 2:
//Input: digits = ""
//Output: []
//
//Example 3:
//Input: digits = "2"
//Output: ["a","b","c"]


class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        var result: [String] = []
        let map: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        func backtrack(_ path: [Character], _ input: [Character]) {
            if path.count >= digits.count { result.append(String(path)); return }
            let index = path.count
            let digit = input[index]
            var path = path
            for c in map[digit]! {
                path.append(c)
                backtrack(path, input)
                path.remove(at: path.count - 1)
            }
        }
        
        backtrack([], Array(digits))
        
        return result
    }
}
