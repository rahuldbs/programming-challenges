// Strings.swift

import Foundation

class Search {

    // https://www.hackerrank.com/challenges/sherlock-and-array/problem
    func sherlockAndArray() {
        let total = Int(readLine()!)!
        for _ in 0 ..< total {
            let n = Int(readLine()!)!
            let strArr = readLine()!.components(separatedBy: " ")
            let listA = strArr.map{ Int($0)! }
            // Logic starts here
            var l = 0
            var r = n - 1
            var sum = 0
            while l != r {
                if sum <= 0 {
                    sum += listA[r]
                    r -= 1
                } else {
                    sum -= listA[l]
                    l += 1
                }
            }
            let result = sum == 0 ? "YES" : "NO"
            print(result)
        }
    }

    // https://www.hackerrank.com/challenges/pairs/problem

    func pairs() {
        let arr = readLine()!.components(separatedBy: " ")
        let n = Int(arr[0])!
        let k = Int(arr[1])!
        let strArr = readLine()!.components(separatedBy: " ")
        var dictA = [Int: Bool]()
        let list = strArr.map { (str) -> Int in
            let num = Int(str)!
            dictA[num + k] = true
            return num
        }
        
        var count = 0
        for i in 0 ..< n {
            if let _ = dictA[list[i]] {
                count = count + 1
            }
            
        }
        print(count)
    }

    // https://www.hackerrank.com/challenges/missing-numbers/problem
    func findMissingNumbers() {
        // read input
        let n = Int(readLine()!)!
        let listA = readLine()!.components(separatedBy: " ")
        let m = Int(readLine()!)!
        let listB = readLine()!.components(separatedBy: " ")
        // find missing numbers
        let arrA = listA.map {
            Int($0)!
        }
        let arrB = listB.map {
            Int($0)!
        }
        var dictA = [Int: Int]()
        var dictB = [Int: Int]()
        let len = arrA.count > arrB.count ? arrA.count : arrB.count
        for i in 0 ..< len  {
            if i < arrA.count {
                let num = dictA[arrA[i]] ?? 0
                dictA[arrA[i]] = num + 1
            }
            if i < arrB.count {
                let num = dictB[arrB[i]] ?? 0
                dictB[arrB[i]] = num + 1
            }
        }
        var result = [Int]()
        if dictA.count > dictB.count {
            for (_, e) in dictA.keys.enumerated() {
                if dictA[e] != dictB[e] {
                    result.append(e)
                }
            }
        } else {
            for (_, e) in dictB.keys.enumerated() {
                if dictA[e] != dictB[e] {
                    result.append(e)
                }
            }
        }
        let final = insertionSort(result).map({ String($0) }).joined(separator: " ")
        print(final)
        
    }
    
    func insertionSort(_ list: [Int]) -> [Int] {
        var arr = list
        let len = list.count
        for i in 1 ..< len {
            let num = arr[i]
            var j = i - 1
            while j >= 0 && arr[j] > num {
                arr[j+1] = arr[j]
                j = j - 1
            }
            arr[j+1] = num
        }
        return arr
    }

} // End of class