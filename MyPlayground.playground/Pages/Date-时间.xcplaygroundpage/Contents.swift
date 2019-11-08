//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


// 创建一个 Date 的 Extension，代码如下
extension Date {
    
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    
    /// 获取当前 原始 时间戳
    var originStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        return "\(timeInterval)"
    }
}



// 使用
print("当前原始时间戳 origin == ", Date().originStamp)
let millisecond = Date().milliStamp
print("当前毫秒级时间戳是 millisecond == ",millisecond)
let timeStamp = Date().timeStamp
print("当前秒级时间戳是 timeStamp == ",timeStamp)

/**
 输出结果
 当前毫秒级时间戳是 millisecond ==  1524801851988
 当前秒级时间戳是 timeStamp ==  1524801851
 */





//: [Next](@next)
