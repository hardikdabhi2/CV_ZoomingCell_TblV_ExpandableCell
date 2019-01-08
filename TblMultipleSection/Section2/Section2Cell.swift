//
//  Section2Cell.swift
//  TblMultipleSection
//
//  Created by Hardik on 07/01/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

class Section2Cell: UITableViewCell {

    @IBOutlet weak var labelTitle:UILabel!
    @IBOutlet weak var labelValue:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
