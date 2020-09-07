//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// 定义字典 []
// [String : NSObject]：即[key: value]

// swift 5.1 之后
// [String : Any]：即[key: value]
// key 通常都是字符串
// value 可以是任意类型学
var dict = ["name": "zhangsan", "age": 18] as [String : Any]

// 可变 var & 不可变 let
// 如果给字典设置值，直接用 ["key"] = value
// 给字典设置数值的时候，如果 key 不存在，会新建
dict["height"] = 1.5
dict

// 给字典设置数值的时候，如果 key 已存在，会被覆盖为新值
dict["name"] = "lisi"
dict


// 遍历
// k, v 是随便写，但是前面是key，后面是value
for (k, v) in dict {
    print("key：\(k)，value：\(v)")
}

for (key, value) in dict {
    print("key：\(key)，value：\(value)")
}

// 合并
let dict2 = ["title":"老板", "name":"老王"]
// 遍历
for (k, v) in dict2 {
    // 依次设置 dict 的内容
    dict[k] = v
}
dict2
dict



//: [Next](@next)
