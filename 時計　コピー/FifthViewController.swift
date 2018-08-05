//
//  FifthViewController.swift
//  時計　コピー
//
//  Created by 目良渉 on 2018/07/28.
//  Copyright © 2018年 Waarum. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController/*, UIPickerViewDelegate, UIPickerViewDataSource */{
    
    func declarer(times:Int) -> [Int] {
        var timeArray = [Int](repeating: 0, count: times)
        for i in 0...times-1 {
            timeArray[i] = i
        }
        return timeArray
    }
    
    
    
   /*
    // 列数指定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // 行数指定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    */
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let hours:[Int] = declarer(times:24)
        print(hours)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
