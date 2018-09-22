// Arrays.swift

import Foundation

class Arrays {

    // https://www.hackerrank.com/challenges/array-left-rotation/problem
    func leftRotation() -> Void {
        let input = readLine()!.components(separatedBy: " ")
        let n = Int(input[0])!
        let d = Int(input[1])!
        let str = readLine()!.components(separatedBy: " ")

        func leftRotate(_ arr: [Int], _ d: Int) -> [Int] {
            let len = arr.count
            var result = [Int](repeating: 0, count: len)
            let k = d % len
            for i in 0 ..< len {
                let index = (len + i - k) % len
                result[index] = arr[i]
            }
            return result
        }

        var nums = str.map {
            Int($0)!
        }

        let resultArr = leftRotate(nums, d).map({String($0)}).joined(separator: " ")
        print(resultArr)
    }

    // https://www.hackerrank.com/challenges/sparse-arrays/problem
    func sparseArray() -> Void {
        let n = Int(readLine()!)!
        var strList = [String]()
        for i in 0 ..< n {
            let str = readLine()!
            strList.append(str)
        }
        let q = Int(readLine()!)!
        var queries = [String]()
        for i in 0 ..< q {
            let str = readLine()!
            queries.append(str)
        }
        /////
        let len = queries.count
        var counts = [Int](repeating: 0, count: len)
        for i in 0 ..< len {
            for str in strList {
                if str == queries[i] {
                    counts[i] += 1
                }
            }
        }
        for (_, num) in counts.enumerated() {
            print(num)
        }
    }

    // https://www.hackerrank.com/challenges/crush/problem
    func manipulateArray() {
        let input = readLine()!.components(separatedBy: " ")
        let n = Int(input[0])!
        let m = Int(input[1])!
        var numbers = [Int](repeating: 0, count: n+1)
        for i in 0 ..< m {
            let str = readLine()!.components(separatedBy: " ")
            let a = Int(str[0])! - 1
            let b = Int(str[1])!
            let k = Int(str[2])!
            numbers[a] += k
            numbers[b] -= k
        }
        var maxVal = 0
        var sum = 0
        for (_, num) in numbers.enumerated() {
            sum += num
            maxVal = max(maxVal, sum)
        }
        print(maxVal)
    }

}