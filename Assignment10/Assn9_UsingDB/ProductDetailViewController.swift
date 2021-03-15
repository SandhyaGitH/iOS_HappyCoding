//
//  ProductDetailViewController.swift
//  assignment-7
//


import UIKit

class ProductDetailViewController: UIViewController {
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
    
   // @IBOutlet weak var CartBtn: UIButton!
    @IBOutlet weak var AddBTn: UIButton!
    @IBOutlet weak var GoToCart: UIButton!
  var  loginCust =  ECustomer()// appDelecate.fetchRecords().first!
    @IBOutlet weak var ProdCat: UILabel!
    @IBOutlet weak var ProdDept: UILabel!
    @IBOutlet weak var ProdSup: UILabel!
    @IBOutlet weak var ProdType: UILabel!
    @IBOutlet weak var ProdQuant: UILabel!
    @IBOutlet weak var ProdName: UILabel!
   
    @IBOutlet weak var imageview: UIImageView!
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
    var vNewProd = EProduct()
    //var pdName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCust = appDelecate.fetchRecords().first!
        ProdQuant.text = "Total Left: " + String(vNewProd.prodQuantity);
        ProdName.text = vNewProd.prodName;
      //  ProdImage.image =  pdImage
        ProdSup.text = pdSup;
        ProdType.text = vNewProd.prodType;
        ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(vNewProd.deptID)).vName
        ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(vNewProd.catID)).vName
        if(vNewProd.prodImage != nil)
        {imageview.image = UIImage(data: vNewProd.prodImage!)}
        
        // Do any additional setup after loading the view.
    }

    @IBAction func AddToCart(_ sender: Any) {
       /* let p  = EProduct();
        p.prodQuantity = Int32(Int(pdQuan)!)
        p.prodName = pdName
       // p.vID = pdID
        p.catID = Int16(pdCatd)
        p.deptID = Int16(pdDepId)
        p.supID = Int16(pdSupd)
        p.prodType = pdType
       //= ProdImage.image =  pdImage */
       // p.vSupID = ProdSuplier.text = pdSup;
      //  AppDelegate.addToOrder(vNewProd)
       // appDelecate.addToCart(1, p, 10, 1)
        appDelecate.InsertProductToOrder(vNewProd, loginCust)
        let alert =  uiCreation.CreateAlert("Alert","Added to Cart")
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                    
                }))
               present(alert,animated: true)
    }
 
    @IBAction func GoToCart(_ sender: Any) {
       /* let vc = CheckOutTableViewController(nibName: "CheckOutTableViewController", bundle: nil)
          
        //   vc.CallingParend = Parent
          self.navigationController!.pushViewController(vc, animated: true) */
        
       
    }

}
