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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagText.text = defaults.string(forKey: "searchTag")
        titleText.text = defaults.string(forKey: "searchTitle")
        if(tagText.text != "" && titleText.text != ""){
            textView.text = defaults.string(forKey: titleText.text!)
            textView.text = defaults.string(forKey: titleText.text!)
            tagText.isEnabled = false
            titleText.isEnabled = false
        }
        else{
            add = true
            textView.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func decision(_ sender: Any) {
        if(tagText.text != "" && titleText.text != ""){
            if(add){
                //タグ追加
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
               
                
                //タイトルの追加
                let addTitle: String = titleText.text!
                var titleList: Array<String> = []
                if let titles = defaults.object(forKey: tagText.text!) {
                    titleList = titles as! Array<String>
                }
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
                
            }
            else{
                defaults.set(textView.text, forKey: titleText.text!)
            }
        }
    }
    
    // タグリストの配列とテキストボックスの内容が一致すればfalseを返し、同じ内容は追加されずアラートが発生する。
    func tag_judgment(addTag: String , tagList: Array<String>) -> Bool {
        for data in tagList{
            if (addTag == String(describing: data)){
                // UIAlertController
                let alertController: UIAlertController =
                    UIAlertController(title: "Alert",
                                      message: "すでに同じ名前のタグが存在します",
                                      preferredStyle: .alert)
                
                let actionOK = UIAlertAction(title: "OK", style: .default){
                    action in
                    print("OK")
                }
                
                // actionを追加
                alertController.addAction(actionOK)
                
                // UIAlertControllerの起動
                //present(alertController, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    // タイトルリストの配列とテキストボックスの内容が一致すればfalseを返し、同じ内容は追加されずアラートが発生する。
    func title_judgment(addTitle: String , titleList: Array<String>) -> Bool {
        for data in titleList{
            if (addTitle == String(describing: data)){
                // UIAlertController
                let alertController: UIAlertController =
                    UIAlertController(title: "Alert",
                                      message: "すでに同じ名前のタイトルが存在します",
                                      preferredStyle: .alert)
                
                let actionOK = UIAlertAction(title: "OK", style: .default){
                    action in
                    print("OK")
                }
                
                // actionを追加
                alertController.addAction(actionOK)
                
                // UIAlertControllerの起動
                //present(alertController, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
}
