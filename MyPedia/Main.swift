//
//  ViewController.swift
//  MyPedia
//
//  Created by 眞榮城隆守 on 12/14/29 H.
//  Copyright © 29 Heisei jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class Main: UIViewController {
    let defaults5 = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set("", forKey:"searchTag")
        defaults.set("", forKey:"searchTitle")
        /*
        defaults.set(["タグ1", "タグ2"], forKey: "tagList")
        defaults.set(["タイトル1", "タイトル2", "タイトル3"], forKey: "タグ1")
        defaults.set(["タイトル1"], forKey: "タグ2")
        defaults.set("タイトル1だよ〜", forKey: "タグ1タイトル1")
        defaults.set("タイトル2だよ〜", forKey: "タグ1タイトル2")
        defaults.set("タイトル3だよ〜", forKey: "タグ1タイトル3")
        defaults.set("フハハ\nタイトル1だよ〜", forKey: "タグ2タイトル1")
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func allDelete(_ sender: Any) {
        if let bundleId = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleId)
        }
        defaults.set("", forKey:"searchTag")
        defaults.set("", forKey:"searchTitle")
    }
    
}

