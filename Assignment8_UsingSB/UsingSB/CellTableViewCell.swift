//
//  CellTableViewCell.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 11/18/20.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuant: UILabel!
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblSupl: UILabel!
    @IBOutlet weak var imagebtn: UIButton!
    var pdSupd = 0
    var pdDepId = 0
    var pdCatId = 0
    var pdIDd = 0
    var newprod = Product()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
