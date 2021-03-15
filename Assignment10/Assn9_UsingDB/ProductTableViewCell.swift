//
//  ProductTableViewCell.swift
//  assignment-7
//


import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var ImageBtn: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBAction func ImgBtn(_ sender: Any) {
        
       // print("Hi")
      //  let vc = storyboard?.instantiateViewController(withIdentifier: "CommonTableViewController") as? CommonTableViewController
        
       
    }
    var prodObj = EProduct();
   // var prodObj:EProduct
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var ProdDept: UILabel!
    @IBOutlet weak var ProdCat: UILabel!
    @IBOutlet weak var ProdSupID: UILabel!
    @IBOutlet weak var ProdQuant: UILabel!
    @IBOutlet weak var ProdType: UILabel!
   
    func showPhotoMenu() {
      let alert = UIAlertController(title: nil, message: nil,
                           preferredStyle: .actionSheet)

      let actCancel = UIAlertAction(title: "Cancel", style: .cancel,
                                  handler: nil)
      alert.addAction(actCancel)

      let actPhoto = UIAlertAction(title: "Take Photo",
                                   style: .default, handler: nil)
      alert.addAction(actPhoto)

      let actLibrary = UIAlertAction(title: "Choose From Library",
                                     style: .default, handler: nil)
      alert.addAction(actLibrary)
        
    ///  present(alert, animated: true, completion: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
