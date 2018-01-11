//
//  listserch.swift
//  MyPedia
//
//  Created by 澤岻　成弥 on 2018/01/11.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//

import Foundation

import UIKit

class ListViewController: UITableViewController{
    
    //メモNo
    var memoNo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セルの総数を設定するメソッド
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    //セルの値を設定するメソッド
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("MemoListCell")! as UITableViewCell
        
        cell.textLabel!.text = saves.stringForKey("myText"+String(indexPath.row))
        return cell
    }
    
    //セルがタップされた時に呼び出されるメソッド
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.memoNo = String(indexPath.row)
        performSegueWithIdentifier("toView",sender: nil)
    }
    
    // Segue設定
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toView") {
            let subVC: ViewController = (segue.destinationViewController as? ViewController)!
            subVC.memoNo = self.memoNo
        }
    }
    
    
}
