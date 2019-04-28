//
//  ViewController.swift
//  Alarm
//
//  Created by EunSeok SONG on 28/04/2019.
//  Copyright © 2019 SONG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alarmTime: String = ""
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var switchState: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(currentTime), userInfo: nil, repeats: true)
    }
    
    @objc func currentTime(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh : mm : ss"
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "hh : mm : 00"
        currentTimeLabel.text = "현재 시간 : " + formatter.string(from: date)
        if switchState.isOn {
            if formatter3.string(from: date) == alarmTime {
                view.backgroundColor = UIColor.red
            } else {
                view.backgroundColor = UIColor.white
            }
        } else {
            if view.backgroundColor == UIColor.red {
                view.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let date = sender.date
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "hh : mm : 00"
        alarmTime = formatter2.string(from: date)
        alarmTimeLabel.text = "알람 시간 : " + alarmTime
    }
}
