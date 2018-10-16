//
//  ViewController.swift
//  Utilites
//
//  Created by jprothwell@gmail.com on 10/16/2018.
//  Copyright (c) 2018 jprothwell@gmail.com. All rights reserved.
//

import UIKit
import Utilites
 


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(type: .custom)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        btn.setTitle("test", for: .normal)
        btn.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func onButton() -> Void {
        self.tabBarController?.replaceViewController(UIViewController(), atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

