//
//  AddAndEdit.swift
//  MyPedia
//
//  Created by 眞榮城隆守 on 1/25/30 H.
//  Copyright © 30 Heisei jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class AddAndEdit: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var tagText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var add: Bool = false
    var titleList: Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //タグ，タイトルの読み込み
        tagText.text = defaults.string(forKey: "searchTag")
        titleText.text = defaults.string(forKey: "searchTitle")
        //タグ，タイトルの表示
        textView.text = defaults.string(forKey: titleText.text!)
        textView.text = defaults.string(forKey: titleText.text!)
        
        //タイトルリストを読み込んで，一時的にタイトルを削除
        if let titles = defaults.object(forKey: "serchTag") {
            titleList = titles as! Array<String>
        }
        
        var i: Int = 0
        var deleteNum: Int = -1
        for title in titleList{
            if(title == titleText.text){
                deleteNum = i
            }
            i += 1
        }
        if(deleteNum != -1){
            defaults.removeObject(forKey: titleText.text!)
            titleList.remove(at: deleteNum)
            defaults.set(titleList, forKey: tagText.text!)
        }
        
        // 枠のカラー
        textView.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        textView.layer.borderWidth = 1.0
        // 枠を角丸にする場合
        textView.layer.cornerRadius = 10.0
        textView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func decision(_ sender: Any) {
        //リストからタイトルとその内容を削除
        defaults.removeObject(forKey: "sarchTitle")
        
        //タグにタイトルを追加
        let addTag: String = tagText.text!
        var tagList: Array<String> = []
        if let tags = defaults.object(forKey: "tagList") {
            tagList = tags as! Array<String>
        }
        if(tagList.count == 0){
            tagList.append(addTag)
            defaults.set(tagList, forKey: "tagList")
        }
        else if(tagList.index(of: addTag) == nil){
            tagList.append(addTag)
            defaults.set(tagList, forKey: "tagList")
        }
        
        //内容の追加
        let addTitle: String = titleText.text!/*
        if let titles = defaults.object(forKey: tagText.text!) {
            titleList = titles as! Array<String>
        }*/
        if(titleList.count == 0){
            titleList.append(addTitle)
            defaults.set(titleList, forKey: addTag)
            defaults.set(textView.text, forKey: addTitle)
        }
        else if(titleList.index(of: addTitle) == nil){
            titleList.append(addTitle)
            defaults.set(titleList, forKey: addTag)
            defaults.set(textView.text, forKey: addTitle)
        }
        else{
            print("Title collide")
        }
        
        // 遷移後に表示させる
        defaults.set(tagText.text, forKey: "searchTag")
        defaults.set(titleText.text, forKey: "searchTitle")
    }
    
}
