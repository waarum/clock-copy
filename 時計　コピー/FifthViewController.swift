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
    
    // ピッカーの列数指定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // ピッカーの行数指定
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
    
    // ピッカーの表示値設定
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
    
    // ピッカーの文字色指定
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
    
    // ピッカーで選択された秒数の保存
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
        nowValue = hourValue * 3600 + minuteValue * 60 + secondValue
        labelUpDate(nowValue)
    }
    
    // ピッカー初期設定
    func initialSet(time: [Int], component: Int, value:Int) {
        for row in 0..<time.count {
            if time[row] == value {
                timePicker.selectRow(row, inComponent: component, animated: true)
            }
        }
    }
    
    // 残り時間の更新
    func labelUpDate(_ value:Int) {
        var labelHour:String
        var labelMinute:String
        var labelSecond:String
        let nowHour = value / 3600
        let nowMinute = value / 60 - nowHour * 60
        let nowSecond = value - nowMinute * 60 - nowHour * 3600
        switch nowHour {
        case 0:labelHour = ""
        default:labelHour = "\(nowHour):"
        }
        switch nowMinute {
        case 0:
            labelMinute = "00"
        case 1...9:
            labelMinute = "0\(nowMinute)"
        default:
            labelMinute = "\(nowMinute)"
        }
        switch nowSecond {
        case 0:
            labelSecond = "00"
        case 1...9:
            labelSecond = "0\(nowSecond)"
        default:
            labelSecond = "\(nowSecond)"
        }
        remainTimeLabel.text = labelHour + labelMinute +  ":" + labelSecond
    }
    // カウント更新
    func upDater() -> Int {
        remainCount = nowValue - count
        labelUpDate(remainCount)
        return remainCount
    }
    
    // 毎秒の操作
    @objc func timerAction(timer:Timer) {
        count += 1
        if upDater() == 0 {
            timer.invalidate()
        } 
    }
    
    
    // 画面読み込み時
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ピッカーを使うためのコード
        timePicker.delegate = self
        timePicker.dataSource = self
        // 保存された値の読み込み
        hourValue = setTime.integer(forKey: "hourKey")
        minuteValue = setTime.integer(forKey: "minuteKey")
        secondValue = setTime.integer(forKey: "secondKey")
        // ピッカーのセット
        initialSet(time: hours, component: 0, value: hourValue)
        initialSet(time: minutes, component: 1, value: minuteValue)
        initialSet(time: seconds, component: 2, value: secondValue)
        // 設定時間のセット
        nowValue = hourValue * 3600 + minuteValue * 60 + secondValue
        // 残り時間表示ラベルの初期設定
        remainTimeLabel.isHidden = true
        remainTimeLabel.textColor = UIColor.white
        labelUpDate(nowValue)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var remainTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    // スタートボタンを押した後の操作
    @IBAction func startButton(_ sender: Any) {
        // 設定時間を残り時間に代入
        remainCount = nowValue
        // ボタンを隠す
        startButton.isHidden = true
        // pickerを隠す
        timePicker.isHidden = true
        // ラベルを出す
        remainTimeLabel.isHidden = false
        // タイマースタート
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction(timer:)), userInfo: nil, repeats: true)
        
    }
    @IBAction func stopButton(_ sender: Any) {
    }
    
    let hours:[Int] = declarer(times:23)
    let minutes:[Int] = declarer(times: 59)
    let seconds:[Int] = declarer(times: 59)
    let setTime = UserDefaults.standard
    var hourValue:Int = 0
    var minuteValue:Int = 0
    var secondValue:Int = 0
    var count:Int = 0
    var nowValue:Int = 0
    var timer:Timer?
    var remainCount:Int = 0
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
