//
//  DetailViewController.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 27.3.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var DetailComment: UILabel!
    @IBOutlet weak var DetailAlgorithm: UILabel!
    @IBOutlet weak var DetailImage: UIImageView!
    var algType: String?
    var algIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let algType = algType {
            if let algIndex = algIndex {
                switch(algType) {
                case "oll":
                    DetailAlgorithm.text = OllTableViewController.ollAlgorithmList[algIndex]
                    DetailComment.text = OllTableViewController.ollCommentList[algIndex]
                    DetailImage.image = UIImage(named: "oll" + String(format: "%02d", algIndex + 1))
                case "pll":
                    DetailAlgorithm.text = PllTableViewController.pllAlgorithmList[algIndex]
                    DetailComment.text = PllTableViewController.pllCommentList[algIndex]
                    DetailImage.image = UIImage(named: "pll" + String(format: "%02d", algIndex + 1))
                default:
                    fatalError("Unexpected algorithm type")
                }
            }
        }
        
        DetailComment.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
