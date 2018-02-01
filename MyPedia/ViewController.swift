//
//  ViewController.swift
//  MyPedia
//
//  Created by 澤岻　成弥 on 2018/02/01.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var input: UITextField!
    
    @IBAction func saveItem(_ sender: Any) {
        if (input.text != "") {
            list.append(input.text!)
            input.text = ""
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
