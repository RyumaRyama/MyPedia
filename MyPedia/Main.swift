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
        /*
        var taglist: Array<String>?
        var titlelist: Array<String>?
        if let aaa = defaults.object(forKey: "tagList") {
            taglist = aaa as! Array<String>
        }
        for tag in taglist!{
            if let aaa = defaults.object(forKey: tag) {
                titlelist = aaa as! Array<String>
            }
            for title in titlelist!{
                defaults.removeObject(forKey: title)
            }
            defaults.removeObject(forKey: tag)
        }
        defaults.removeObject(forKey: "tagList")
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButton(_ sender: Any) {
        defaults5.set("", forKey:"searchTag")
        defaults5.set("", forKey:"searchTitle")
    }
    
}

