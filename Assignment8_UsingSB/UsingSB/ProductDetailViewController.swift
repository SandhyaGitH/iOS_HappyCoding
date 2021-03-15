//
//  ProductDetailViewController.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 11/19/20.
//

import UIKit

class ProductDetailViewController: UIViewController {

    
    @IBOutlet weak var BuyButton: UIButton!
    @IBOutlet weak var CartButton: UIButton!
    @IBOutlet weak var ProdLeftQuan: UILabel!
    @IBOutlet weak var ProdSuplier: UILabel!
    @IBOutlet weak var ProdImage: UIImageView!
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
        
        ProdLeftQuan.text = "Total Left: " + pdQuan;
        ProdName.text = pdName;
        ProdImage.image =  pdImage
        ProdSuplier.text = pdSup;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButProd(_ sender: Any) {
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "CheckoutOrderTableViewController") as? CheckoutOrderTableViewController
        
    }
    
  /**  func CheckOut(sender:UIButton)
    {    let od = Order()
      
        inventOrg.nOrder.OrderID = od.CreatenewOrder(inventOrg.nOrdertuple,inventOrg)
        viewMyOrder(sender:sender);
        
    }

    
    
    @objc func viewMyOrder(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        if(inventOrg.orders.count>0)
        {
            for index in Range(0...inventOrg.orders.count-1)
            {
                
                
                if(inventOrg.orders[index].OrderID == inventOrg.nOrder.OrderID)
                {
                    for i in Range(0...inventOrg.orders[index].Orderedproducts.count-1)
                    {
                        height = height+80
                        let prod:Product = inventOrg.orders[index].Orderedproducts[i].prod;
                       
                        var Sup = Supplier();
                        Sup = inventOrg.suppliers.FindProfile(String(inventOrg.orders[index].Orderedproducts[i].prod.vSupID));
                        var detail:String = " Product Details: " + prod.toStringForOrder() + " Quantity: " + String(inventOrg.orders[index].Orderedproducts[i].Quantity)
                         + " Supplier: "  + Sup.toString()
                    let text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,detail)
                    // print(inventOrg.suppliers[index].toString())
                    //text.tag = 1
                    view.addSubview(text)
                    }
                }
                
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
  
*/
}
