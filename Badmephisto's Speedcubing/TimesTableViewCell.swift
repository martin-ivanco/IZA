//
//  TimesTableViewCell.swift
//  Badmephisto's Speedcubing
//
//  Created by Martin Ivančo on 14.4.18.
//  Copyright © 2018 martinivanco. All rights reserved.
//

import UIKit

class TimesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
