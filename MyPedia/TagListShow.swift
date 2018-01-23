//
//  TagListShow.swift
//  MyPedia
//
//  Created by iha moritaka on 2018/01/18.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import Foundation
import UIKit

class TagListShow: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var TableView: UITableView!
    
    let defaults = UserDefaults.standard
    var selectedText: String?
    var taglist: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ここで他からの配列を読み込む
        if let aaa = defaults.object(forKey: "tagList") {
            taglist = aaa as! Array<String>
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taglist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tag_list_show_cell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = taglist[indexPath.row]
        
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        // 8. title_list_showに渡す文字列をセット
        defaults.set(taglist[indexPath.row],forKey:"searchTag")
        
        //押されたセルの選択解除
        if let indexPathForSelectedRow = TableView.indexPathForSelectedRow {
            TableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
        // 8. title_list_showへ遷移するSegueを呼び出す　""内の名称を変える
        performSegue(withIdentifier: "totitle_list_show",sender: nil)
        
    }
    
}


