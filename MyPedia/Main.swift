//
//  ViewController.swift
//  MyPedia
//
//  Created by 眞榮城隆守 on 12/14/29 H.
//  Copyright © 29 Heisei jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class Main: UIViewController {
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //defaults.set(["title1", "title2"], forKey: "tag")
        //defaults.set("内容", forKey:"title1")
        //defaults.set("内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n", forKey:"title2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("", forKey:"searchTag")
        defaults.set("", forKey:"searchTitle")
    }
    
}

