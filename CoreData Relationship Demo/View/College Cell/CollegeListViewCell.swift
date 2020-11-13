//
//  CollegeListViewCell.swift
//  CoreData Relationship Demo
//
//  Created by Adwait Barkale on 13/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeListViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
