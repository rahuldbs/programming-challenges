// Strings.swift

import Foundation

class Strings {

    // https://www.hackerrank.com/challenges/reduced-string/problem
    func superReduced() {
        var final = readLine()!
        var i = 1
        while i < final.characters.count && i >= 0 {
            let current = final.index(final.startIndex, offsetBy: i)
            let previous = final.index(final.startIndex, offsetBy: i - 1)
            let end = final.index(final.startIndex, offsetBy: i + 1)
            if final[current] == final[previous] {
                final.removeSubrange(previous..<end)
                if i > 1 {
                    i -= 1
                }
            } else {
                i += 1
            }
        }
        
        if final.characters.count == 0 {
            print("Empty String")
        } else {
            print(final)
        }
    }

    https://www.hackerrank.com/challenges/camelcase/problem
    func camelCase() {
        let str = readLine()!
        let charSet = CharacterSet.uppercaseLetters
        var count = 1
        var i = 0
        var start = str.index(str.startIndex, offsetBy: i)
        let len = str.characters.count
        for char in str.unicodeScalars {
            if charSet.contains(char) {
                count += 1
            }
            i += 1
        }
        print(count)
    }

    https://www.hackerrank.com/challenges/caesar-cipher-1/problem
    func caesarCipher() {
        let n = Int(readLine()!)!
        let s = readLine()!
        let k = Int(readLine()!)!

        var final = ""
        let letters = CharacterSet.letters
        for char in s.unicodeScalars {
            if letters.contains(char) {
                var ascii = char.hashValue
                let Z: UnicodeScalar = "Z"
                let z: UnicodeScalar = "z"
                let A: UnicodeScalar = "A"
                let a: UnicodeScalar = "a"
                if ascii >= A.hashValue && ascii <= Z.hashValue {
                    let mod = k % 26
                    ascii += mod
                    if ascii > Z.hashValue {
                        ascii = A.hashValue + (ascii - Z.hashValue) - 1
                    }
                } else {
                    let mod = k % 26
                    ascii += mod
                    if ascii > z.hashValue {
                        ascii = a.hashValue + (ascii - z.hashValue) - 1
                    }
                }
                let encryptedChar = UnicodeScalar(ascii)
                final.unicodeScalars.append(encryptedChar!)
            } else {
                final.unicodeScalars.append(char)
            }
        }
        print(final)
    }

    https://www.hackerrank.com/challenges/mars-exploration/problem
    func marsExploration() {
        let str = readLine()!

        let msg = "SOS"
        let len = str.characters.count
        let k = len / 3
        var count = 0
        var i = 0
        while i < len {
            var j = 0
            while j < msg.characters.count {
                let s = str.index(str.startIndex, offsetBy: i+j)
                let m = msg.index(msg.startIndex, offsetBy: j)
                if str[s] != msg[m] {
                count += 1
                }
                j += 1
            }
            i += 3
        }
        print(count)
    }

    // https://www.hackerrank.com/challenges/hackerrank-in-a-string/problem
    func findHackerRank() {
        let len = Int(readLine()!)!
        for _ in 0 ..< len {
            let str = readLine()!
            let result = containsSubsequence(str, "hackerrank")
            print(result)
        }
    }

    func containsSubsequence(_ str: String, _ sequence: String) -> String {
        var seqList = [Character]()
        var strList = [Character]()
        for (_, c) in sequence.characters.enumerated() {
            seqList.append(c)
        }
        for (_, c) in str.characters.enumerated() {
            strList.append(c)
        }
        let length = strList.count
        var k = 0
        sequenceLoop: for j in 0 ..< seqList.count {
            while k < length {
                if seqList[j] == strList[k] {
                    k += 1
                    if j == seqList.count-1 {
                        return "YES"
                    }
                    break
                } else if k == length-1 {
                    k += 1
                    return "NO"
                }
                k += 1
            }
        }
        
        return "NO"
    }

    // https://www.hackerrank.com/challenges/funny-string/problem
    func funnyString() {
        let len = Int(readLine()!)!

        for i in 0 ..< len {
            let str = readLine()!
            let result = containsFunnySequence(str)
            print(result)
        }
    }

    func containsFunnySequence(_ s: String) -> String {
        var values = [Int]()
        var reversed = [Int]()

        let count = s.characters.count

        for (_, c) in s.characters.enumerated() {
            values.append(Int((String(c).unicodeScalars.first?.value)!))
        }

        for (_, c) in s.characters.reversed().enumerated() {
            reversed.append(Int((String(c).unicodeScalars.first?.value)!))
        }

        var isFunny = true
        for i in 1..<count {
            if abs(values[i] - values[i-1]) != abs(reversed[i] - reversed[i-1]) {
                isFunny = false
                break
            }
        }

        if isFunny {
            return("Funny")
        } else {
            return("Not Funny")
        }

    }

} // End of Strings class