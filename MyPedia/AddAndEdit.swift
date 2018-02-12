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
    
    var selectTag: String?
    var selectTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //タグ，タイトルの読み込み
        selectTag = defaults.string(forKey: "searchTag")!
        selectTitle = defaults.string(forKey: "searchTitle")!
        
        //タグ，タイトル，内容の画面表示
        tagText.text = selectTag
        titleText.text = selectTitle
        textView.text = defaults.string(forKey: tagText.text! + titleText.text!)
        
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
        //var tagList: Array<String> = []
        //var titleList: Array<String> = []
        //空白はNG
        if(tagText.text != "" && titleText.text != ""){
            //更新の時のみ一旦削除
            if(selectTag != "" && selectTitle != ""){
                delete(tag: selectTag!, title: selectTitle!)
            }
            
            
        }
        
        
        // 遷移後に表示させる
        defaults.set(tagText.text, forKey: "searchTag")
        defaults.set(titleText.text, forKey: "searchTitle")
    }
    
    //内容を消すやつ
    func delete(tag: String, title: String){
        //タグリスト，タイトルリスト取得
        var tagList: Array<String> = defaults.array(forKey: "tagList") as! Array<String>
        var titleList: Array<String> = defaults.array(forKey: tag) as! Array<String>
        
        //内容
        defaults.removeObject(forKey: title)
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
