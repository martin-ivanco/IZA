//
//  StatisticsViewController.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 14.4.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TimesTable: UITableView!
    @IBOutlet weak var Avg5Label: UILabel!
    @IBOutlet weak var AvgLabel: UILabel!
    @IBOutlet weak var BestLabel: UILabel!
    
    var solveTimes = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimesTable.delegate = self
        TimesTable.dataSource = self
        let userDefaults = UserDefaults.standard
        solveTimes = userDefaults.object(forKey: "solveTimes") as? [Int] ?? [Int]()
        
        Avg5Label.text = getAvgFive(times: solveTimes)
        AvgLabel.text = getAverageTime(times: solveTimes)
        BestLabel.text = getBestTime(times: solveTimes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return solveTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "time_cell", for: indexPath) as! TimesTableViewCell
        cell.TimeLabel.text = getTimeString(timeVal: solveTimes[indexPath.row])
        return cell
    }
    
    func getTimeString(timeVal: Int) -> String {
        if (timeVal == 0) {
            return "N/A"
        }
        var hundreths = timeVal
        let minutes = hundreths / 6000
        hundreths %= 6000
        let seconds = hundreths / 100
        hundreths %= 100
        return String(format: "%02d:%02d.%02d", minutes, seconds, hundreths)
    }
    
    func getAverageTime(times: [Int]) -> String {
        if (times.count == 0) {
            return "N/A"
        }
        var average = 0
        for t in times {
            average += t
        }
        average /= times.count
        return getTimeString(timeVal: average)
    }
    
    func getAvgFive(times: [Int]) -> String {
        let lastFive = Array(times.prefix(5))
        return getAverageTime(times: lastFive)
    }
    
    func getBestTime(times: [Int]) -> String {
        if (times.count == 0) {
            return "N/A"
        }
        var best = Int.max
        for t in times {
            if best > t {
                best = t
            }
        }
        return getTimeString(timeVal: best)
    }
    
    @IBAction func resetTimes(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set([Int](), forKey: "solveTimes")
        userDefaults.synchronize()
        solveTimes = [Int]()
        
        Avg5Label.text = getAvgFive(times: solveTimes)
        AvgLabel.text = getAverageTime(times: solveTimes)
        BestLabel.text = getBestTime(times: solveTimes)
        TimesTable.reloadData()
    }
    
}
