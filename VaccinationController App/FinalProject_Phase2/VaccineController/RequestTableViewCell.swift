//
//  RequestTableViewCell.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/9/20.
//

import UIKit

class RequestTableViewCell: UITableViewCell {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var ItemQuantity: UILabel!
    @IBOutlet weak var ItemName: UILabel!
    
    
    @IBOutlet weak var RejectBtn: UIButton!
    @IBOutlet weak var ApprovalBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var providerObj:DB_Hospital?
    var requestObj:Db_InventoryRequest?
    var requestID:Int16?
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var providerAddress: UILabel!
    @IBOutlet weak var ProviderName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func RejectAction(_ sender: Any) {
        // send pvdr n other deatails tp app delegate which will return true n false
        guard let req = requestObj , let provider =  providerObj else {
            return
        }
        appDelegate.RejectRequestInventory(req,  provider)
        RejectBtn.isHidden = true
        ApprovalBtn.isHidden = true
        self.backgroundColor = UIColor.red
       // print("\(ItemQuantity.text)")
    }
    @IBAction func ApprovalAction(_ sender: Any) {
        
        guard let req = requestObj , let provider =  providerObj else {
            return
        }
        appDelegate.ApproveRequestInventory(req,  provider)
        RejectBtn.isHidden = true
        ApprovalBtn.isHidden = true
        self.backgroundColor = UIColor.green
    }
    
}
