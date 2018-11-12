//
//  VcontrollerCell.swift
//  WITSDemo
//
//  Created by Kondya on 12/11/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

import UIKit

class VcontrollerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var accesoryImgView: UIImageView!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var autherNameLbl: UILabel!
}
