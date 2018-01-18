//
//  e165712ViewController.swift
//  MyPedia
//
//  Created by 安田圭佑 on 2018/01/16.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class e165712ViewController: UIViewController {

    @IBOutlet weak var tagname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tagname.text = "test"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
