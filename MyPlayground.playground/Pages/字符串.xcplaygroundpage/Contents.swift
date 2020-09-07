//: [Previous](@previous)

import Foundation
import UIKit

/**
 swift：String：结构体：效率比对象高，一般推荐使用String，支持遍历
 OC：NSString：对象：继承NSObject
 */
var str: String = "你好世界"

// 支持遍历
for cString in str {
    print(cString)
}

// 字符串的拼接
let name: String? = "老王"
let age = 89
let title = "小黑"
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)


print(name ?? "" + String(age) + title)
print((name ?? "") + String(age) + title)

// \(变量名) ：会自动转换并拼接
// 如果是可选的转换，会带上 Option，提示开发人员，值是可选的
// 拼接字符串有一个小陷阱 ？
print("\(name)\(age)\(title) \(rect)")

// 如果真的需要格式怎么办：
let h = 9
let m = 5
let s = 8

let timeStr = "\(h):\(m):\(s)"
// 注意：参数以数组的形式输入 []
let timeStr1 = String(format: "%02d:%02d:%02d", arguments: [h, m, s])
//let timeStr1 = String(format: "%02d:%02d:%02d", h, m, s)

// 在 Swift 语法变迁中，'Range' 的变化非常大，如果碰到 Range，最好把String 改成NSString

// OC
//NSString *str = @"hello world";
//str = [str substringWithRange:NSMakeRange(3, 5)];
//NSLog("%@", str);

// Swift
// 如果碰到 Range，最好把String 改成NSString
//str.substring(with: <#T##Range<String.Index>#>)
(str as NSString).substring(with: NSMakeRange(2, 2))

// 如果碰到 简单的取值 可以如下：
str.substring(from: "你".endIndex)


// endIndex 表示前面字符串的长度的索引 （注：Swift5.1 已经不能使用"1"代表一个字符串的长度）
//str.substring(from: "1".endIndex)

//: [Next](@next)
