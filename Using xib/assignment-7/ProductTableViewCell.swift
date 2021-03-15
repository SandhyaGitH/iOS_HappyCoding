//
//  ProductTableViewCell.swift
//  assignment-7
//


import UIKit

class ProductTableViewCell: UITableViewCell {
@IBOutlet weak var prodName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var ProdDept: UILabel!
    @IBOutlet weak var ProdCat: UILabel!
    @IBOutlet weak var ProdSupID: UILabel!
    @IBOutlet weak var ProdQuant: UILabel!
    @IBOutlet weak var ProdType: UILabel!
   
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
