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
    
    // 選択された秒数の保存
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            setTime.setValue(hours[row], forKey: "hourKey")
            hourValue = setTime.integer(forKey: "hourKey")
            print("\(hourValue)時間")
        case 1:
            setTime.setValue(minutes[row], forKey: "minuteKey")
            minuteValue = setTime.integer(forKey: "minuteKey")
            print("\(setTime.integer(forKey: "minuteKey"))分")
        default:
            setTime.setValue(seconds[row], forKey: "secondKey")
            secondValue = setTime.integer(forKey: "secondKey")
            print("\(setTime.integer(forKey: "secondKey"))秒")
        }
    }
    
    // ピッカー初期設定
    func initialSet(time: [Int], component: Int, value:Int) {
        for row in 0..<time.count {
            if time[row] == value {
                timePicker.selectRow(row, inComponent: component, animated: true)
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        hourValue = setTime.integer(forKey: "hourKey")
        minuteValue = setTime.integer(forKey: "minuteKey")
        secondValue = setTime.integer(forKey: "secondKey")
        
        initialSet(time: hours, component: 0, value: hourValue)
        initialSet(time: minutes, component: 1, value: minuteValue)
        initialSet(time: seconds, component: 2, value: secondValue)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var remainTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let hours:[Int] = declarer(times:23)
    let minutes:[Int] = declarer(times: 59)
    let seconds:[Int] = declarer(times: 59)
    let setTime = UserDefaults.standard
    var hourValue:Int = 0
    var minuteValue:Int = 0
    var secondValue:Int = 0
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
