//
//  ShowDataTableViewCell.swift
//  DBApplication
//
//  Created by mac on 13/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ShowDataTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_mobile: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
