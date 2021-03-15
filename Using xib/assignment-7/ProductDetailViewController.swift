//
//  ProductDetailViewController.swift
//  assignment-7
//


import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var CartBtn: UIButton!
    @IBOutlet weak var AddBTn: UIButton!
    @IBOutlet weak var GoToCart: UIButton!
   
    @IBOutlet weak var ProdCat: UILabel!
    @IBOutlet weak var ProdDept: UILabel!
    @IBOutlet weak var ProdSup: UILabel!
    @IBOutlet weak var ProdType: UILabel!
    @IBOutlet weak var ProdQuant: UILabel!
    @IBOutlet weak var ProdName: UILabel!
   
    let uiCreation = UICreation()
    var pdImage = UIImage();
    var pdName = ""
    var pdQuan = ""
    var pdSup = ""
    var pdID :Int = 0
    var pdDepId = 0
    var pdSupd = 0
    var pdCatd = 0
    var pdType = ""
    var vNewProd = Product()
    //var pdName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProdQuant.text = "Total Left: " + String(vNewProd.vAvailableQuantity);
        ProdName.text = vNewProd.vName;
      //  ProdImage.image =  pdImage
        ProdSup.text = pdSup;
        ProdType.text = vNewProd.vType;
        ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(vNewProd.vDeptID)).vName
        ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(vNewProd.vCatID)).vName
        // Do any additional setup after loading the view.
    }

    @IBAction func AddToCart(_ sender: Any) {
        let p  = Product();
        p.vAvailableQuantity = Int(pdQuan)!
        p.vName = pdName
        p.vID = pdID
        p.vCatID = pdCatd
        p.vDeptID = pdDepId
        p.vSupID = pdSupd
        p.vType = pdType
       //= ProdImage.image =  pdImage
       // p.vSupID = ProdSuplier.text = pdSup;
        AppDelegate.addToOrder(vNewProd)
        
        let alert =  uiCreation.CreateAlert("Alert","Added to Cart")
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                    
                }))
               present(alert,animated: true)
    }
 
    @IBAction func GoToCart(_ sender: Any) {
        let vc = CheckOutTableViewController(nibName: "CheckOutTableViewController", bundle: nil)
          
        //   vc.CallingParend = Parent
          self.navigationController!.pushViewController(vc, animated: true)
        
       
    }

}
