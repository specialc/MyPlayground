//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// 格式：func 函数名(形参列表) -> 返回值类型 { // 代码实现 }
func sum(x: Int, y:Int) -> Int {
    return x + y
}

// 调用函数：函数名(值1, 参数名：值2)
// Swift 5.1 之后
// 调用函数：函数名(参数名：值1, 参数名：值2)
sum(x: 10, y: 20)


// 外部参数：numb1、numb2 是供外部调用的程序员的参考的，保证函数的语义更加清晰
func sum1(numb1 x: Int, numb2 y:Int) -> Int {
    return x + y
}

sum1(numb1: 10, numb2: 2)

// 返回值 '->'
/**
 没有返回值：有三种写法，主要是为了闭包
 1. 直接省略
 2. -> Void
 3. -> ()
 */
func demo() {
    print("haha")
}
demo()


func demo1() -> Void {
    print("haha")
}
demo1()

func demo2() -> () {
    print("haha")
}
demo2()



//: [Next](@next)
