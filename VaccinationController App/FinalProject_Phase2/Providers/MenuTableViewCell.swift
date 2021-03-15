//
//  MenuTableViewCell.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

   // @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var imaegView: UIImageView!
    
    @IBOutlet weak var menuTittleBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
