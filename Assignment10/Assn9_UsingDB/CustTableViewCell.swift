//
//  CustTableViewCell.swift
//  Assn9_UsingDB
//
//  Created by Samarth chaturvedi on 12/2/20.
//

import UIKit

class CustTableViewCell: UITableViewCell {

    @IBOutlet var Fnlbl : UILabel?
    @IBOutlet var Lnlbl : UILabel?
    @IBOutlet var addLbl : UILabel?
    @IBOutlet var emailLbl : UILabel?
    @IBOutlet var phoLbl : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
