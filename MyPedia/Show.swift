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
        
        textView.text=text
        label.text=titleName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editButton(_ sender: Any) {
    }
    
    @IBAction func deleteButton(_ sender: Any) {
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
        }
        */
        
        var i: Int = 0
        var deleteNum: Int = -1
        for title in titles!{
            if(title == titleName){
                deleteNum = i
            }
            i += 1
        }
        if(deleteNum != -1){
            // UIAlertController
            let alertController: UIAlertController =
                UIAlertController(title: "確認",
                                  message: "削除しますか？",
                                  preferredStyle: .alert)
            
            let actionOK = UIAlertAction(title: "OK", style: .default){
                (action: UIAlertAction) in
                print("OK")
                self.defaults.removeObject(forKey: self.titleName!)
                self.titles!.remove(at: deleteNum)
                self.defaults.set(self.titles!, forKey: self.tag!)
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
        
    }

}
