//
//  TableViewCell.swift
//  cornerRadius
//
//  Created by mac on 28/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var btn_click: UIButton!
    @IBOutlet weak var lbl_tit: UILabel!
    @IBOutlet weak var lbl_data: UILabel!
    @IBOutlet weak var img_data: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btn_click.layer.cornerRadius = 10.0
        
        self.btn_click.layer.borderWidth = 2.0
        self.btn_click.layer.borderColor = UIColor.black.cgColor
        
        self.btn_click.layer.shadowColor = UIColor.red.cgColor
        self.btn_click.layer.shadowOpacity = 1.0
        self.btn_click.layer.shadowRadius = 1.0
        self.btn_click.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
