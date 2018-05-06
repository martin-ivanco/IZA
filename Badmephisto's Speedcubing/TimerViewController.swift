//
//  TimerViewController.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 9.4.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var TimerButton: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    
    var hundreths = 0
    var seconds = 0
    var minutes = 0
    var currentState = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 70.0, weight: UIFont.Weight.regular)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        if (currentState == 0) {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
                self.hundreths += 1
                if (self.hundreths == 100) {
                    self.hundreths = 0
                    self.seconds += 1
                    if (self.seconds == 60) {
                        self.seconds = 0
                        self.minutes += 1
                    }
                }
                self.TimerLabel.text = String(format: "%02d:%02d.%02d", self.minutes, self.seconds, self.hundreths)
            })
            TimerButton.setTitle("Stop", for: UIControlState.normal)
            currentState = 1
        }
        else if (currentState == 1) {
            timer.invalidate()
            TimerButton.setTitle("Save & Reset", for: UIControlState.normal)
            currentState = 2
        }
        else {
            let solveTime = hundreths + seconds*100 + minutes*60*100
            
            hundreths = 0
            seconds = 0
            minutes = 0
            TimerLabel.text = "00:00.00"
            TimerButton.setTitle("Start", for: UIControlState.normal)
            currentState = 0
            
            let userDefaults = UserDefaults.standard
            var solveTimes = userDefaults.object(forKey: "solveTimes") as? [Int] ?? [Int]()
            solveTimes.insert(solveTime, at: 0)
            userDefaults.set(solveTimes, forKey: "solveTimes")
            userDefaults.synchronize()
        }
    }
    
}
