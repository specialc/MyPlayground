//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// C-style for statement has been removed in Swift 3
// 没有 ()
// 循环索引需要用 var
//for var i = 0; i < 10; i++ {
//    print(i)
//}

// Swift for
// 0..<10： 从0~9
for i in 0..<10 {
    print(i)
}

print("-----")
// 0...10： 从0~10
for i in 0...10 {
    print(i)
}

// Range<Int> 泛型
let range = 0...10
let range1 = 0..<10

print("-----")
for i in range {
    print(i)
}



//: [Next](@next)
