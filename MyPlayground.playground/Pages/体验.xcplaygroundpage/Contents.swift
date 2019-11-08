import UIKit

// Playground：
// 不需要项目
// 直接写代码，立刻看结果
// 学习语音，测试代码

var str = "Hello, playground"

// OC [[UIView alloc] initWithFrame:CGRectMake...]
// initWithXXX -> (XXX)
let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

// OC [UIColor redColr] 类方法 -> 直接点
v.backgroundColor = UIColor.red

// OC
let btn = UIButton(type: .contactAdd)
btn.center = v.center
v.addSubview(btn)


// MARK: 说明
// FIXME: 添加标记2
