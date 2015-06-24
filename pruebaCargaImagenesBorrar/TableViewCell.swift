//
//  TableViewCell.swift
//  pruebaCargaImagenesBorrar
//
//  Created by guitarrkurt on 23/06/15.
//  Copyright (c) 2015 BUAP. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
