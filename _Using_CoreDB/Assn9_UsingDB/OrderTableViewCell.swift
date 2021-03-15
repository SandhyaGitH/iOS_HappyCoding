//
//  OrderTableViewCell.swift
//  assignment-7
//
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var OrderID: UILabel!
    @IBOutlet weak var ProdSup: UILabel!
    @IBOutlet weak var NoOfOrdered: UILabel!
    @IBOutlet weak var ProdType: UILabel!
    @IBOutlet weak var ProdName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
