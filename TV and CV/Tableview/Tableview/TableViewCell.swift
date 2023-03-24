//
//  TableViewCell.swift
//  Tableview
//
//  Created by mac on 17/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
