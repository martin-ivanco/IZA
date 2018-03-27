//
//  OllTableViewCell.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 22.3.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class OllTableViewCell: UITableViewCell {
    
    @IBOutlet weak var OllImage: UIImageView!
    @IBOutlet weak var OllAlgorithm: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
