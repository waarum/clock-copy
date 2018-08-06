//
//  FifthViewController.swift
//  時計　コピー
//
//  Created by 目良渉 on 2018/07/28.
//  Copyright © 2018年 Waarum. All rights reserved.
//

import UIKit

func declarer(times:Int) -> [Int] {
    var timeArray = [Int](repeating: 0, count: times+1)
    for i in 0...times {
        timeArray[i] = i
    }
    return timeArray
}

class FifthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    /*func declarer(times:Int) -> [Int] {
        var timeArray = [Int](repeating: 0, count: times+1)
        for i in 0...times {
            timeArray[i] = i
        }
        return timeArray
    }*/
    
    
    
    
   
    // 列数指定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // 行数指定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
        default:
            return seconds.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(hours[row])"
        case 1:
            return "\(minutes[row])"
        default:
            return "\(seconds[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var data:[Int]
        switch component {
        case 0:
            data = hours
        case 1:
            data = minutes
        default:
            data = seconds
        }
        let titleData = "\(data[row])"
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return myTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
       
        print(hours)
        print(minutes)
        print(seconds)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    let hours:[Int] = declarer(times:23)
    let minutes:[Int] = declarer(times: 59)
    let seconds:[Int] = declarer(times: 59)
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
