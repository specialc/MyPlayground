//
//  DDD_LabelScrollView.swift
//  闭包的演练
//
//  Created by 张春咏 on 2019/11/16.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

// 当前类就是为纯代码开发准备的，包括很多公司的纯代码开发的视图中，有很多自定义控件
class DDD_LabelScrollView: UIScrollView {
    
    // 在 Swift 中，函数支持'重载'：参数的数量和类型 可以不同
    // initWithFrame 函数，使用纯代码开发的时候，会被调用，跟 'required init?(coder: NSCoder) {' 是二选一
    
    /*
     重构步骤：
     1. 复制代码（即已经创建好的可用视图代码）
     2. 修改参数和返回值
     3. 调整代码内部的调用
     */
    init(frame: CGRect, numberOfLabel: () -> Int, labelOfIndex: (_ index: Int) -> UILabel) {
        super.init(frame: frame)
        
        
        // 1. 实例化 ScrollView ，并且指定大小和位置
        backgroundColor = UIColor.lightGray
        
        
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
            addSubview(label)
            
            // 递增 x
            x += label.bounds.width
        }
        
        
        // 4. 返回 ScrollView
        contentSize = CGSize(width: x + margin, height: frame.height)
        
        // 在 Swift 中，构造函数不需要返回值，直接设置 contentSize即可
//        return sv
    }
    
    // UIViewController 有一个函数：initWithCoder()，使用 Storyboard、XIB 开发的时候，会被调用
    // 自定义视图中，必须要实现的方法：目的是让开发者开发的时候，强行使用纯代码开发
    required init?(coder: NSCoder) {
        // fatalError 函数会让用 storyboard 开发直接崩掉！
        fatalError("init(coder:) has not been implemented")
    }
    
}
