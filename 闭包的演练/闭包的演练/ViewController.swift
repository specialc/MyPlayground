//
//  ViewController.swift
//  闭包的演练
//
//  Created by 张春咏 on 2019/11/16.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 闭包的演练
//        loadData()
//        loadData3 { () -> () in
//            print("over")
//        }
        
//        loadData3 { (msg: String) in
//            print(msg)
//        }
        
        
        
        // 闭包的返回值的演练
        let rect = CGRect(x: 0, y: 20+44, width: view.bounds.width, height: 44)
        let sv = scrollView(frame: rect, numberOfLabel: { () -> Int in
            return 16
        }) { (index) -> UILabel in
            // 根据 index 创建 label，并且返回
            let label = UILabel()
            label.text = "Hellow \(index)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.sizeToFit()
            
            label.font = UIFont.systemFont(ofSize: 14)
            
            return label
        }
        
        // 在 Swift 中，可以不用写 'self.'
        // 提示：建议一般不要写，在需要的时候再写
        view.addSubview(sv)
    }
    
    // MARK: 闭包的演练
    /*
     加载数据：通过 block 回调异步代码执行的结果
     */
    func loadData() {
        
        DispatchQueue.global().async { () -> Void in
            print("玩命加载中...\(Thread.current)")
            // 主线程回调
            DispatchQueue.main.async { () -> Void in
                print("主线程回调\(Thread.current)")
            }
        }
        
        
        // 代码的简化，如果没有参数、没有返回值，可以省略
        DispatchQueue.global().async {
            print("玩命加载中2...\(Thread.current)")
            
            // 主线程回调
            DispatchQueue.main.async {
                print("主线程回调2\(Thread.current)")
            }
        }
        
    }
    
    
    func loadData2() {
        
        // 尾随闭包
        // 1.闭包是最后一个参数
        // 2.函数的 () 可以提前关闭
        // 3.最后一个参数直接使用： { 代码实现 }
        DispatchQueue.global().async { () -> Void in
            
        }
        
        DispatchQueue.global().async(execute: { () -> Void in
            
        })
    }
    
    // 注：Swift5.1 闭包做参数默认是@noescaping，不再是@escaping。所以如果函数里异步执行该闭包，要添加@escaping。否则报错：Closure use of non-escaping parameter 'xxx' may allow it to escape.
    func loadData3(finished: @escaping(_ msg: String)->()) {
        DispatchQueue.global().async {
            // 耗时操作
            print("玩命加载中")
            
            // 主线程回调 （注：sync：同步）
            DispatchQueue.main.sync {
                print("主线程回调3")
                // 通过闭包回调结果，执行完成回调函数
                finished("我OK")
            }
        }
    }
    
    
    // MARK: 闭包的返回值的演练
    
    /*
     创建 UIScrollView，包含标签
     
     return：UIScrollView
     
     需求：
     标签的个数以及内容，都由闭包来实现
     
     闭包的返回值，用来 接收 闭包执行的结果，继续后续的代码
     闭包的参数，用来将内容传递给闭包内部去执行
     */
    
    
    func scrollView(frame: CGRect, numberOfLabel: () -> Int, labelOfIndex: (_ index: Int) -> UILabel) -> UIScrollView {
        
        // 1. 实例化 ScrollView ，并且指定大小和位置
        let sv = UIScrollView(frame: frame)
        sv.backgroundColor = UIColor.lightGray
        
        
        // 2. 知道标签的数量，执行闭包，获得标签数量
        let count = numberOfLabel()
        print("标签数量：\(count)")
        
        // 3. 知道标签的内容，添加到 ScrollView
        // 遍历 count
        
        let margin:CGFloat = 8
        var x = margin
        
        
        for i in 0..<count {
            // 执行闭包，获得label，已经设置好大小
            let label = labelOfIndex(i)
            
            // 设置 label 的 frame
            label.frame = CGRect(x: x, y: 0, width: label.bounds.width, height: frame.height)
            
            // 添加到 ScrollView
            sv.addSubview(label)
            
            // 递增 x
            x += label.bounds.width
        }
        
        
        // 4. 返回 ScrollView
        sv.contentSize = CGSize(width: x + margin, height: frame.height)
        
        return sv
        
    }
}

