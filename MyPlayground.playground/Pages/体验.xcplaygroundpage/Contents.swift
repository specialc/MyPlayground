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


// MARK: 富文本
let userAgreementLabel = UILabel()
let tipString = "注册/登录代表您已阅读并同意"
let attrString = NSMutableAttributedString(string: tipString)
attrString.setAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], range: NSMakeRange(0, tipString.count))
let agreementAttrString = NSMutableAttributedString(string: "用户协议", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
attrString.append(agreementAttrString)
userAgreementLabel.attributedText = attrString
// FIXME: 添加标记2
