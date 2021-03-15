//
//  CheckoutOrderTableViewController.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 11/20/20.
//

import UIKit

class CheckoutOrderTableViewController: UIViewController {
    @IBOutlet var tableview:UITableView!
    
 let uiCreation = UICreation()
   
    @IBOutlet weak var CheckOutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        {  tableview.delegate = self
        tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
        
       
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func CheckOut(_ sender: Any) {
        let od = Order()
          
        AppDelegate.inventOrg.nOrder.OrderID = od.CreatenewOrder(AppDelegate.inventOrg.nOrdertuple,AppDelegate.inventOrg)
      //  AppDelegate.inventOrg.nOrdertuple = []
      //  AppDelegate.inventOrg.ProdsForOrder = []
        AppDelegate.inventOrg.nOrdertuple = [] //.append((newProduct,quant))
        AppDelegate.inventOrg.ProdsForOrder = [] //.append(newProduct)
      //  tableview = nil;
       // viewDidLoad()
       // che
        tableview.reloadData();
      //  hghhghghgh
        let alert =  uiCreation.CreateAlert("Alert","Order Created Sucessfully ")
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
        }))
        present(alert, animated: true)
        CheckOutBtn.isEnabled = false
        //  viewMyOrder(sender:sender);
    }

}
extension CheckoutOrderTableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(tableView.cellForRow(at: indexPath)?.textLabel?.text)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        
        vc?.pdName = AppDelegate.inventOrg.products[indexPath.row].vName
      
        let imagename = String(AppDelegate.inventOrg.products[indexPath.row].vID) + ".jpg"
       // vc?.ProdImage.image = UIImage()
        vc?.pdImage =  UIImage(named: imagename)!
        
      
        vc?.pdQuan  =  String(AppDelegate.inventOrg.products[indexPath.row].vAvailableQuantity)
        let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
           vc?.pdSup = "Supplier : " + supname
        vc?.pdID = AppDelegate.inventOrg.products[indexPath.row].vID
        vc?.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
        vc?.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
        vc?.pdCatd = AppDelegate.inventOrg.products[indexPath.row].vCatID
        vc?.pdType = AppDelegate.inventOrg.products[indexPath.row].vType
        vc?.vNewProd = AppDelegate.inventOrg.products[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           var  Cust=Product()
            Cust = AppDelegate.inventOrg.products[indexPath.row] as Product
            AppDelegate.inventOrg.nProduct = Cust
            Cust.Delete(AppDelegate.inventOrg)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CheckoutOrderTableViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return AppDelegate.inventOrg.ProdsForOrder.count
        return AppDelegate.inventOrg.nOrdertuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell =  cell2 as? CellTableViewCell
        //cell.textLabel?.text="helo";
        cell?.imageView?.clipsToBounds = true;//.clipsToBounds = YES;
        //let t = cell?.labl.text
        let imagename = String(AppDelegate.inventOrg.nOrdertuple[indexPath.row].0.vID) + ".jpg"
        cell?.imgg.image = UIImage(named: imagename)
        //cell?.labl = uilable
        cell?.lblName.text = AppDelegate.inventOrg.nOrdertuple[indexPath.row].0.vName
        cell?.lblQuant.text =  String(AppDelegate.inventOrg.nOrdertuple[indexPath.row].1)
        let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
         //  cell?.lblSupl.text = "Supplier : " + supname
        
        cell?.pdIDd = AppDelegate.inventOrg.products[indexPath.row].vID
        cell?.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
        cell?.pdCatId = AppDelegate.inventOrg.products[indexPath.row].vCatID
        cell?.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
        cell?.newprod = AppDelegate.inventOrg.products[indexPath.row]
       // cell?.pdzT
      //  cell?.textLabel?.text = "\(AppDelegate.inventOrg.products[indexPath.row].toString())"
        return cell!;
        
    }
}

