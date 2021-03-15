//
//  ProvidersTableViewCell.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/9/20.
//

import UIKit

class ProvidersTableViewCell: UITableViewCell {

    @IBOutlet weak var ProviderPhone: UILabel!
    @IBOutlet weak var providerAddressLbl: UILabel!
    @IBOutlet weak var ProviderTestKitCountLbl: UILabel!
    @IBOutlet weak var ProviderVaccineslbl: UILabel!
    @IBOutlet weak var ProviderImageview: UIImageView!
    @IBOutlet weak var ProviderCitylbl: UILabel!
    @IBOutlet weak var ProviderNameLbl: UILabel!
    var provider:DB_Hospital?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
