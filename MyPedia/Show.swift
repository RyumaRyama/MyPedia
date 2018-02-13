//
//  Show.swift
//  MyPedia
//
//  Created by tanaharayoshiki on 2018/01/23.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class Show: UIViewController {
    let defaults = UserDefaults.standard
    var text:String?
    var titles:[String]?
    var titleName:String?
    var tag:String?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tagView: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5.0
        
        
        tag = defaults.string(forKey: "searchTag")
        titles = defaults.object(forKey: tag!) as? [String]
        titleName = defaults.string(forKey: "searchTitle")
        text = defaults.string(forKey: tag! + titleName!)
        
        tagView.text=tag
        textView.text=text
        label.text=titleName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editButton(_ sender: Any) {
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        delete(tag: tag!, title: titleName!)
        /*
        var i: Int = 0
        var deleteNum: Int = -1
        for title in titles!{
            if(title == titleName){
                deleteNum = i
            }
            i += 1
        }
        if(deleteNum != -1){
            defaults.removeObject(forKey: titleName!)
            titles!.remove(at: deleteNum)
            defaults.set(titles!, forKey: tag!)
        }*/
    }
    
    //内容を消すやつ
    func delete(tag: String, title: String){
        //タグリスト，タイトルリスト取得
        var tagList: Array<String> = defaults.array(forKey: "tagList") as! Array<String>
        var titleList: Array<String> = defaults.array(forKey: tag) as! Array<String>
        
        //内容
        defaults.removeObject(forKey: tag+title)
        //タイトル
        if let index = titleList.index(of: title){
            titleList.remove(at: index)
            //タグの中にタイトルがなければタグを削除
            if(titleList.count == 0){
                if let tagIndex = tagList.index(of: tag){
                    tagList.remove(at: tagIndex)
                    defaults.set(tagList, forKey: "tagList")
                }
            }
                //タイトルがまだあればdefaultsに格納
            else{
                defaults.set(titleList, forKey: tag)
            }
        }
    }
}
