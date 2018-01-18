//
//  ViewController.swift
//  MyPedia
//
//  Created by 眞榮城隆守 on 12/14/29 H.
//  Copyright © 29 Heisei jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButton(_ sender: Any) {
        let searchTag = UserDefaults.standard
        let searchTitle = UserDefaults.standard
        searchTag.set("", forKey:"タグ")
        searchTitle.set("", forKey:"タイトル")
    }
    
    
}

