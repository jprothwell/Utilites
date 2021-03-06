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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resizeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(type: .custom)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        btn.setTitle("test", for: .normal)
        btn.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        //btn.cornerRadius = 5
        btn.backgroundColor = .green
        btn.roundCorner(rectCorner:[.topLeft,.topRight], radius: 10)

        self.view.addSubview(btn)
        
        let image = UIImage(named: "返回")?.withInsets(insetDimen: 10)
        self.imageView.image = image
        
        resizeImageView.image = UIImage(named: "添加")!.resizeToFit(in: CGSize(width: 140, height: 5))
    }
    
    @objc func onButton() -> Void {
        //self.tabBarController?.tabBar.hideTopLine()
        
        //self.navigationController?.navigationBar.hideBottomLine()
        
        //self.tabBarController?.replaceViewController(UIViewController(), atIndex: 0)
        
        //self.tabBarController?.insertViewController(UIViewController(), atIndex: 0)
        
        self.tabBarController?.removeViewController(atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

