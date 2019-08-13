//
//  ResultTableViewCell.swift
//  ReaderQR
//
//  Created by Alexandr on 8/13/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
