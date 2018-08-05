//
//  FifthViewController.swift
//  時計　コピー
//
//  Created by 目良渉 on 2018/07/28.
//  Copyright © 2018年 Waarum. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Picker Viewの文字を白に変更
        setPickerLetterColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    // Picker Viewの文字を白に変更する関数の宣言
    func setPickerLetterColor() {
        timePicker.setValue(UIColor.white, forKey: "textColor")
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
