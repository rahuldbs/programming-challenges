// Sorting.swift

import Foundation

open class Sorting {

    // https://www.hackerrank.com/challenges/insertionsort1/problem
    func insertionSort1() {
        let length = Int(readLine()!)!
        let input = readLine()!
        let strArray = input.components(separatedBy: " ")
        var numbers: [Int] = strArray.map {
            Int($0)!
        }
        let e = numbers[length - 1]
        var i = length - 2
        while i >= 0 && numbers[i] > e {
            numbers[i+1] = numbers[i]
            i = i - 1
            let myStr = numbers.map({String($0)}).joined(separator: " ")
            print(myStr)
        }
        numbers[i+1] = e
        let myStr = numbers.map({String($0)}).joined(separator: " ")
        print(myStr)
    }

    // https://www.hackerrank.com/challenges/insertionsort2/problem
    func insertionSort2() {
        let length = Int(readLine()!)!
        let input = readLine()!
        let strArray = input.components(separatedBy: " ")
        var numbers: [Int] = strArray.map {
            Int($0)!
        }
        for i in 1 ..< length {
            let e = numbers[i]
            var j = i - 1
            while j >= 0 && numbers[j] > e {
                numbers[j+1] = numbers[j]
                j = j - 1
            }
            numbers[j+1] = e
            let myStr = numbers.map({String($0)}).joined(separator: " ")
            print(myStr)
        }
    }

    // https://www.hackerrank.com/challenges/runningtime/problem
    func runtimeOfInsertionSort() {
        let length = Int(readLine()!)!
        let input = readLine()!
        let strArray = input.components(separatedBy: " ")
        var numbers: [Int] = strArray.map {
            Int($0)!
        }
        var count = 0
        for i in 1 ..< length {
            let e = numbers[i]
            var j = i - 1
            while j >= 0 && numbers[j] > e {
                numbers[j+1] = numbers[j]
                j = j - 1
                count += 1
            }
            numbers[j+1] = e
        }
        print(count)
    }

} // End of class