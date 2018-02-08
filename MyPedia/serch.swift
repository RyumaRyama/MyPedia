//
//  serch.swift
//  MyPedia
//
//  Created by 澤岻　成弥 on 2018/01/25.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//  puched2/1

import Foundation
import UIKit

//元々の配列
var list = ["a","c","w","r","t","lll"]
//検索結果の配列
var searchResult = [String]()
class TableViewController: UITableViewController, UISearchBarDelegate{
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var searchMemo: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //結果表示用のビューコントローラーに自分を設定する。
        searchMemo.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        searchMemo.enablesReturnKeyAutomatically = false
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if( searchMemo.text != "" ) {
            return searchResult.count
        } else {
            return(list.count)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        if( searchMemo.text != "" ) {
            cell.textLabel?.text = searchResult[indexPath.row]
        } else {
            cell.textLabel?.text = list[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMemo.endEditing(true)
        
        //検索文字列を含むデータを検索結果配列に格納する。
        searchResult = list.filter { data in
            return data.contains(searchMemo.text!)
        }
        
        //テーブルを再読み込みする。
        myTableView.reloadData()
    }
}
