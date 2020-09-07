//
//  ViewController.swift
//  网络访问
//
//  Created by 张春咏 on 2019/11/17.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let session = URLSession.shared
//        session.dataTask(with: URL(string: "")) { (data, _, _) in
//
//        }
        
        print("网络请求")
        // App Transport Security：Xcode7开始
        URLSession.shared.dataTask(with: URL(string: "http://localhost")!) { (data, _, _) in
            
            // 将二进制数据转成 JSON
            
            let result = try! JSONSerialization.jsonObject(with: data!, options: [])
            print(result)
        }
        
        
        
    }


}

