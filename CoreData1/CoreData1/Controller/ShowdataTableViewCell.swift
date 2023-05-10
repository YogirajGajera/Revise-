//
//  ShowdataTableViewCell.swift
//  CoreData1
//
//  Created by mac on 10/05/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ShowdataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblsubject: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
