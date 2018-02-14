//
//  Show.swift
//  MyPedia
//
//  Created by tanaharayoshiki on 2018/01/23.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import Foundation
import UIKit

class Show: UIViewController {
    let defaults = UserDefaults.standard
    var text:Array<Any>?
    var titles:[String]?
    var titleName:String?
    var tag:String?
    var link:Array<Any>?
    var selectLinkList: Array<String> = []
    
    @IBOutlet weak var linkList: UITableView!
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
        text = defaults.array(forKey: tag! + titleName!)
        link = text![1] as? Array<Any>
        
        tagView.text = tag
        textView.text = text![0] as! String
        label.text = titleName
        
        //関連のタグ，タイトルを表示用にリスト化
        for list in link!{
            let tagTitle = list as! Array<String>
            let tag = tagTitle[0]
            let title = tagTitle[1]
            selectLinkList.append(title+"("+tag+")")
        }
        //print()
        
        //枠づけ
        // 枠のカラー
        textView.layer.borderColor = UIColor.black.cgColor
        linkList.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        textView.layer.borderWidth = 1
        linkList.layer.borderWidth = 1
        // 枠を角丸にする場合
        textView.layer.cornerRadius = 10.0
        textView.layer.masksToBounds = true
        linkList.layer.cornerRadius = 10.0
        linkList.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editButton(_ sender: Any) {
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let alertController: UIAlertController =
            UIAlertController(title: "確認",
                              message: "削除しますか？",
                              preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction) in
            self.delete(tag: self.tag!, title: self.titleName!)
            self.performSegue(withIdentifier: "toMain", sender: nil)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel){
            (action: UIAlertAction) in
            print("Cancel")
        }
        
        // actionを追加
        alertController.addAction(actionOK)
        alertController.addAction(actionCancel)
        
        // UIAlertControllerの起動
        present(alertController, animated: true, completion: nil)
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
                //タイトルがまだあればdefaultsに格納
            else{
                defaults.set(titleList, forKey: tag)
            }
        }
    }
    
    //テーブル
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectLinkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "linkTable", for: indexPath)
        // セルに表示するテキストを作る
        print(selectLinkList)
        cell.textLabel!.text = selectLinkList[indexPath.row]
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // content_showに渡す文字列をセット
        //defaults.set(selectLink[indexPath.row],forKey:"searchTitle")
        
        //押されたセルの選択解除
        if let indexPathForSelectedRow = linkList.indexPathForSelectedRow {
            linkList.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
        // coctetxt_showへ遷移するSegueを呼び出す　""内の名称を変える
        performSegue(withIdentifier: "tocontent_show",sender: nil)
    }
}
