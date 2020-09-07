//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


/**
 OC 中 switch 的特点：
    1.值有要求，表达式必须是一个整数
    2.如果内部不定义变量，需要使用 {} 指明作用域
    3.每一个 case 都需要 break
 */

//float i = 4
//
//switch (i) {
//case 5: {
//    print("张三")
//    }
//default:
//
//}

/**
 Swift 中 Switch 的特点：
    1. 值可以是任何类型学
    2. 作用域，仅在 case 内部
    3. 不需要break
    4. 每一个 case 都要有代码（可以是break）
 */
//float i = 4
let name = "老王123"
switch (name) {
case "老王":
    let age = 80
    print("hi\(name) age:\(age)")
    
case "老李", "老方": break
default:
    print("other")
}


//: [Next](@next)
