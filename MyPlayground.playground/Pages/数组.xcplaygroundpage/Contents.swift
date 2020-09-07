//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

// 使用 [] 定义h数组
// [String] 表示数组是存放字符串的数组
let array = ["张三", "李四"]

// Swift：可以直接将数字放在数组中，不需要包装
// 如果数组中存在的数据类型不一致，自动推导的格式是 [NSObject]
//let array2 = ["张三", 19, UIView()]
// 5.1 是[Any]
let array2 = ["张三", 19, UIView()] as [Any]

// 提问：日常开发中，内容'类型一致'的数组多
// 数组的遍历。是用过下标来访问的

// 遍历数组
for name in array {
    print(name)
}

// 可变 var & 不可变 let

var list = ["zhang", "lisi"]

// 追加元素，必须向可变 var 数组追加元素
list.append("wang")

// 删除
//list.removeFirst()
//list
//
//list.removeLast()
//list

list.remove(at: 1)
list

// 删除所有
//list.removeAll()
//list
print(list.capacity)
list.removeAll(keepingCapacity: true)
print(list.capacity)

// 数组容量的调试
// 1. 定义并且实例化一个只能保存字符串的数组
var arrayM = [String]()

// 2. 追加元素，跟踪容量的把变化
// 跟踪发现，如果数组的容量不够，再添加元素的时候，会在当前容量基础上 * 2
for i in 0...16 {
    arrayM.append("hello \(i)")
    print("数组容量：索引：\(i)：\(arrayM.capacity)")
}

// 定义数组，数组能够保存整数，并且实例化数组对象()
//var arrayM2 = [Int]()
// 定义数组，指定 数组能够保存整数，并没有创建数组对象，无法向数组添加对象
var arrayM2: [Int]
// 创建一个 0 容量的数组
arrayM2 = [Int]()
print(arrayM2.capacity)

arrayM2.append(33)
print(arrayM2.capacity)

// 定义数组，并且指定容量
// repeating：填充数组的内容
// count：数组的容量
var arrayM3 = [Int](repeating: 88, count: 32)
print(arrayM3.capacity)

// 数组的拼接
var arr1 = [1, 2, 3, 4, 5]
var arr2 = [6, 7, 8, 9, 10]

var arr3 = arr1 + arr2


arr1 += arr2

// 注意：拼接的时候，数组的类型必须是一样的
var arr4 = ["11", "12"]
//arr1 += arr4



//: [Next](@next)
