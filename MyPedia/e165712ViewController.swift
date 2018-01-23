//
//  e165712ViewController.swift
//  MyPedia
//
//  Created by 安田圭佑 on 2018/01/23.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import UIKit

class e165712ViewController: UIViewController, UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    var tags: [String] = []
    @IBOutlet weak var textfield: UITextField!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        //デリゲート先を自分に設定する
        textfield.delegate = self
        
        if (userDefaults.array(forKey:"tagList") != nil){
        //objectsを配列として確定させ、前回の保存内容を格納
            let objects = userDefaults.array(forKey:"tagList")
            //各名前を格納するための変数を宣言
            var name:String!
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for name in objects!{
                //配列に追加していく
                tags.append(String(describing: name))
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // セルの型を作る
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "tagList")
        // セルに表示するテキストを作る
        cell.textLabel?.text = tags[indexPath.row]
        // セルをリターンする
        return cell
    }

    @IBAction func kettei(_ sender: Any) {
        tags.append(String(describing: textfield.text!))
        userDefaults.set(tags, forKey:"tagList")
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