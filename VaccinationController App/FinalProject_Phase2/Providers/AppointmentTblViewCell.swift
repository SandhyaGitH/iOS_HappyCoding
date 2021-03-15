//
//  AppointmentTblViewCell.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/17/20.
//

import UIKit

class AppointmentTblViewCell: UITableViewCell {

    @IBOutlet weak var PatientName: UILabel!
    
    @IBOutlet weak var DateTime: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    var patientObj:DB_Patient?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
