// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Matrix, Simulation
//
//Given a 2D integer array matrix, return the transpose of matrix.
//
//The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.
//
//Example 1:
//Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
//Output: [[1,4,7],[2,5,8],[3,6,9]]
//
//Example 2:
//Input: matrix = [[1,2,3],[4,5,6]]
//Output: [[1,4],[2,5],[3,6]]

class Solution {
    @_optimize(speed)
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else { return [] }
        let columns = matrix.count, rows = matrix[0].count
        
        var res: [[Int]] = Array(repeating: [], count: rows)
        
        var currentRow = 0
        
        while currentRow < rows {
            
            for i in 0..<columns {
                res[currentRow].append(matrix[i][currentRow])
            }
            currentRow += 1
            
        }
        
        return res
    }
}
