//
//  AllRequestsTblViewCell.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/17/20.
//

import UIKit

class AllRequestsTblViewCell: UITableViewCell {

    @IBOutlet weak var RequestStatus: UILabel!
    @IBOutlet weak var RequestDetails: UILabel!
    @IBOutlet weak var providerName: UILabel!
    
    @IBOutlet weak var ItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
