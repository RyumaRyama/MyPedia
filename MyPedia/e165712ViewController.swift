//
//  e165712ViewController.swift
//  MyPedia
//
//  Created by 安田圭佑 on 2018/01/23.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class e165712ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲート先を自分に設定する
        textfield.delegate = self
        
        //文字列が保存されている場合はラベルに文字列を設定する。
        if let tagList = userDefaults.string(forKey:"tagList") {
            label.text = tagList
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func kettei(_ sender: Any) {
        //テキストフィールドの文字列をラベルに設定する。
        label.text = textfield.text
        
        //ラベルの文字列を保存する。
        userDefaults.set(label.text, forKey:"tagList")
        
        //plistファイルへの出力と同期する。
        userDefaults.synchronize()
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
