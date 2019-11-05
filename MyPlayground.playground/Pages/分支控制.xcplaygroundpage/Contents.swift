//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


let num = 20

/*
 1. 没有()
 2. 必须有{}
 3. 没有非零即真，swift中只有 true/false
 */
if num > 10 {
    print("大于10")
}

// 错误写法
//if num > 10 print("大于10")

/**
     if !_dataList {
         
     }
     if _dataList == nil {
         
     }
 */

// 条件必须指明逻辑结果
if num > 5 {
    print("哈哈")
}


// 三目 和 OC 中的写法一致
let a = 80
let b = 20

let c = a > b ? 100 : -100

// 在 swift 中，如果不注意，会让代码写的非常深、丑陋




//: [Next](@next)
