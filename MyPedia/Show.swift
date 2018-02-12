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
        textView.layer.cornerRadius = 5.0;
        
        
        tag = defaults.string(forKey: "searchTag")
        titles = defaults.object(forKey: tag!) as? [String]
        titleName = defaults.string(forKey: "searchTitle")
        text = defaults.string(forKey: titleName!)
        
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
        }
    }
}
