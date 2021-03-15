//
//  SerchTableTableViewCell.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//

import UIKit

class SerchTableTableViewCell: UITableViewCell {

    @IBOutlet weak var lblProviderName : UILabel!
    @IBOutlet  var ImageView: UIImageView!
    @IBOutlet weak var lblProviderAddress : UILabel!
    var providerObj:DB_Hospital?
    var patientObj:DB_Patient?
    var distance:String?
    var time:String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIImageView {

   func setRounded() {
    //let radius = self.frame.width / 2
      self.layer.cornerRadius = 55 //radius
   // self.layer.ra
      //self.layer.masksToBounds = true
      self.clipsToBounds = true
   }
}
