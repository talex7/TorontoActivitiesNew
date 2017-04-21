//
//  FacilityTableViewCell.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-17.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import UIKit

class FacilityTableViewCell: UITableViewCell {
    
    
    //Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
