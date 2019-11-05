//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
// Optional 可选的，可以有值，可以为nil
// init? 说明可能无法实例化 url
let url = NSURL(string: "https://www.baidu.com")
// ! 强行解包，程序员认为这里 url 一定有值，一旦程序崩溃，就会停止此处
// 错误提示 是让程序员思考一下是否有值，代码的安全性会更好
//let request = NSURLRequest(url: url! as URL)


// 更安全的写法
//if url != nil {
//    let request = NSURLRequest(url: url! as URL)
//}

// if let ：判断并且设置数值
// 确保 myUrl 一定有值，才会进入分支
if let myUrl = url {
    // myUrl 一定有值
    print(myUrl)
}

var oName:String? = "张三"
//var oName:String? = nil
var oAge:Int? = 19

// swift 5.1 这么写会报错 // CYTest
// 多值之间使用 , 分隔
//if let name = oName, age = oAge {
//    print(name + String(age))
//}
if let name = oName {
    print(name)
}

// ?? 操作符
// 如果 oName 为 nil，则用 ?? 后面的字符串，f否则使用 oName 的结果
let cName = oName ?? "abc"


var dName: String
if oName == nil {
    dName = "abc"
}
else {
    dName = oName!
}

// ?? 常见的应用场景，表格要返回数据数量
var dataList:[String]?

//dataList = ["张三", "李四"]

// OC 中给 nil 发任何消息，什么也不会执行，不会有错误
// dataList? 表示 dataList 可能为 nil
// 如果为 nil，.count 不会报错，仍然返回 nil
// 如果不为 nil，.count 执行，并且返回数组计数
let count = dataList?.count ?? 0

// ! 表示程序员来承诺 dataList 一定有值，为 nil 就崩。
// 每一次写 ! 强行解包，一定要思考。
let count1 = dataList!.count






// 提示：可选项是所有 OC 程序员开始最痛苦的一关
// 1、利用 Xcode的提示
// 2、多思考



//: [Next](@next)
