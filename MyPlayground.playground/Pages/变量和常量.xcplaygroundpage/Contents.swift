//: [Previous](@previous)

import Foundation
import UIKit


var str = "Hello, playground"


// 变量 var = 设置数值之后，可以修改
// 变量 let = 设置数值之后，不可以修改
// 自动推导：根据右侧的数值，推导数据类型
// NSString *str = [NSString stringWithFormat:""];
// NSString *str = [NSMutableString string];

var x = 20
x = 30

let y = 30
//y = 30

let z = x + y

// Swift是一个类型要求特别严格的语音，任何情况下都不会做隐式转换
// 两个值要进行计算，必须是相同的类型
// option + click
// 整数默认的类型是 Int
let num1 = 1
// 小数默认的类型是 Double，OC中小数默认是 float
let num2 = 1.5

// 如果要计算，必须要`显式`转换类型
let num3 = Double(num1) + num2
let num4 = num1 + Int(num2)


// 如果希望自己指定变量类型
//let i: Double = 10
let i: CGFloat = 10.1
//import UIKit
let j = 1.5
//i + j
i + CGFloat(j)









//: [Next](@next)
