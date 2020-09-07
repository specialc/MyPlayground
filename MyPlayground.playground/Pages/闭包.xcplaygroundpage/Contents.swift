//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// 可以暂时理解成 OC 中的 Block
/**
 1. 一组预先准备好的代码
 2. 可以当做参数传递
 3. 在需要的时候执行
 
 OC 中的 Block 类似于匿名函数
 */

// Swift：闭包：定义：
func sum(num1 x: Int, num2 y: Int) -> Int {
    return x + y
}

//sum(x: 10, y: 22)
sum(num1: 10, num2: 22)

// 以下两句代码仅供体验
// Swift 中，变量能够直接记录函数
let sunmFunc = sum
// 执行
//sunmFunc(5, 6)
sunmFunc(15, 16)

// 闭包的定义
/*
 1. 形参、返回值、代码 都包含在 {} 中
 */

// 最简单的闭包：如果没有参数/返回值，统统(包括in) 都可以省略
// { 代码实现 }
let demoFunc = {
    print("hello")
}
// 执行闭包
demoFunc()


func sum2(num1 x: Int, num2 y: Int) -> Int {
    return x + y
}


// in 就是区分函数定义和代码实现的关键字
// 格式： { (带外部参数的形参列表) -> 返回值类型 in 代码实现 }

//let demoFunc2 = { (num1 x: Int, num2 y: Int) -> Int in   (注：swift5.1：closure cannot have keyword arguments：闭包不能有关键字参数)
let demoFunc2 = { (x: Int, y: Int) -> Int in
    return x + y
}
demoFunc2(10, 20)



//: [Next](@next)
