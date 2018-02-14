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
    
    //スクリーンの情報
    let SCREEN_SIZE = UIScreen.main.bounds.size
    
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
        /*
        //ここでUIKeyboardWillShowという名前の通知のイベントをオブザーバー登録をしている
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //ここでUIKeyboardWillHideという名前の通知のイベントをオブザーバー登録をしている
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)*/
        
    }
    
    //UIKeyboardWillShow通知を受けて、実行される関数
    func keyboardWillShow(_ notification: NSNotification){
        let keyboardHeight = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.height
        var frame: CGRect = textView.frame
        frame.size.height = textView.frame.height-keyboardHeight
        textView.frame = frame
    }
    
    //UIKeyboardWillShow通知を受けて、実行される関数
    func keyboardWillHide(_ notification: NSNotification){
        let keyboardHeight = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.height
        var frame: CGRect = textView.frame
        frame.size.height = textView.frame.height-keyboardHeight
        textView.frame = frame
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
            //重複がなければ実行
            if repeatCheck(){
                //更新の時のみ一旦削除
                if(selectTag != "" && selectTitle != ""){
                    delete(tag: selectTag!, title: selectTitle!)
                }
                //被りがない時だけメモの保存
                write(tag: tagText.text!, title: titleText.text!, text: textView.text!)
            }
            else{
                // 内容の変更が反映されないやつは修復された
                print("タイトルが重複しています")
            }
        }
        else{
            print("タグ，タイトルは空白で保存できません")
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
        defaults.removeObject(forKey: tag+title)
        //タイトル
        if let index = titleList.index(of: title){
            titleList.remove(at: index)
            defaults.set(titleList, forKey: tag)
            //タグの中にタイトルがなければタグを削除
            if(titleList.count == 0){
                if let tagIndex = tagList.index(of: tag){
                    tagList.remove(at: tagIndex)
                    defaults.set(tagList, forKey: "tagList")
                }
            }
        }
    }
    
    //保存するやつ
    func write(tag: String, title: String, text: String){
        print("保存〜")
        //内容
        defaults.set(text, forKey: tag+title)
        //タイトル
        var titleList: Array<String> = []
        if let list = defaults.array(forKey: tag){
            titleList = list as! Array<String>
        }
        titleList.append(title)
        defaults.set(titleList, forKey: tag)
        //タグ
        var tagList: Array<String> = []
        if let list = defaults.array(forKey: "tagList"){
            tagList = list as! Array<String>
        }
        if(tagList.index(of: tag) == nil){
            tagList.append(tag)
            defaults.set(tagList, forKey: "tagList")
        }
    }
    
    //重複確認
    func repeatCheck() -> Bool{
        //タグ内に同じものあったら消さない
        var nextTitleList: Array<String> = []
        if let list = defaults.array(forKey: tagText.text!){
            nextTitleList = list as! Array<String>
        }
        //同じものがあればfalse
        if(nextTitleList.index(of: titleText.text!) != nil){
            return false
        }
        //なければtrue
        return true
    }
    
    //戻る
    @IBAction func backButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        var page: String = ""
        if selectTag == "" && selectTitle == ""{
            page = "toMain"
        }
        else if (selectTitle == ""){
            page = "toTitleList"
        }
        else{
            page = "toView"
        }
        let nextView = storyboard.instantiateViewController(withIdentifier: page)
        present(nextView, animated: true, completion: nil)
    }
    

}
