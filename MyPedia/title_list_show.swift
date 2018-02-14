//
//  title_list_show.swift
//  MyPedia
//
//  Created by iha moritaka on 2018/01/11.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import Foundation
import UIKit

class title_list_show: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var title_TableView: UITableView!
    
    let defaults = UserDefaults.standard
    var selectTag=""
    var titlelist: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //前の画面でセットされた文字を呼び出してtextにいれる
        if let text = defaults.string(forKey: "searchTag") {
            selectTag = text
        }
        
        //textつまり前の画面で選択されたワードのリストを持ってきてtitlelistにいれる
        
        if let list = defaults.object(forKey: selectTag) {
            titlelist = list as! Array<String>
        }
        
        //ラベルに前画面で選択されたワード表示
        Label.text = selectTag
        
        
        //枠づけ
        // 枠のカラー
        title_TableView.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        title_TableView.layer.borderWidth = 1
        // 枠を角丸にする場合
        title_TableView.layer.cornerRadius = 10.0
        title_TableView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "title_list_show_cell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = titlelist[indexPath.row]
        
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // content_showに渡す文字列をセット
        defaults.set(titlelist[indexPath.row],forKey:"searchTitle")
        
        //押されたセルの選択解除
        if let indexPathForSelectedRow = title_TableView.indexPathForSelectedRow {
            title_TableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
        // coctetxt_showへ遷移するSegueを呼び出す　""内の名称を変える
        performSegue(withIdentifier: "tocontent_show",sender: nil)
    }
    
    
    @IBAction func addTitle(_ sender: Any) {
        defaults.set("", forKey: "searchTitle")
    }
    
    
    /*
    //シュッてやつ
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(tag: selectTag, title: titlelist[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    //内容を消すやつ
    func delete(tag: String, title: String){
        //タグリスト，タイトルリスト取得
        //var tagList: Array<String> = defaults.array(forKey: "tagList") as! Array<String>
        var titleList: Array<String> = defaults.array(forKey: tag) as! Array<String>
        
        //内容
        defaults.removeObject(forKey: tag+title)
        //タイトル
        if let index = titleList.index(of: title){
            titleList.remove(at: index)
            defaults.set(titleList, forKey: tag)
            /*
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
            }*/
        }
    }
    */
}

