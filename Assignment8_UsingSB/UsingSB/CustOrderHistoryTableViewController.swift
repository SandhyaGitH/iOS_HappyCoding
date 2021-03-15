//
//  CustOrderHistoryTableViewController.swift
//  UsingSB
//


import UIKit

class CustOrderHistoryTableViewController: UIViewController {
    @IBOutlet var tableview:UITableView!
    var displayitems = [DisplayOrder]()
    var orders = [Order]()
    var DateSelected:Date?
    var customerSelected:Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        {
            tableview.delegate = self
            tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
        let cust = AppDelegate.inventOrg.nCustomer;
        orders = AppDelegate.inventOrg.orders.FindOrdersBYCustID(customerSelected!, DateSelected!)
        var displayOrder = DisplayOrder()
        if(orders.count > 0)
        {
        for index in (0...orders.count-1)
        {
            for item in (0...orders[index].Orderedproducts.count-1)
            {   displayOrder = DisplayOrder()
                displayOrder.vOrderId = orders[index].OrderID
               // displayOrder.dt =
                displayOrder.vPID = orders[index].Orderedproducts[item].0.vID
                displayOrder.vPName = orders[index].Orderedproducts[item].0.vName
                displayOrder.vorderquant = orders[index].Orderedproducts[item].1
             displayitems.append(displayOrder)
            }
        }
        }
        
   }
    
}
extension CustOrderHistoryTableViewController : UITableViewDelegate{
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

extension CustOrderHistoryTableViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return AppDelegate.inventOrg.ProdsForOrder.count
        
        
        return displayitems.count
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell =  cell2 as? CellTableViewCell
        //cell.textLabel?.text="helo";
        cell?.imageView?.clipsToBounds = true;//.clipsToBounds = YES;
        //let t = cell?.labl.text
        let ods = displayitems
        let imagename = String(ods[indexPath.row].vPID) + ".jpg"
        cell?.imgg.image = UIImage(named: imagename)
        //cell?.labl = uilable
        cell?.lblName.text = ods[indexPath.row].vPName
        cell?.lblQuant.text =  "Quantity: " + String(ods[indexPath.row].vorderquant)
        cell?.lblOrderID.text = "Order ID :" + String(ods[indexPath.row].vOrderId)
        //let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
         //  cell?.lblSupl.text = "Supplier : " + supname
        
        //cell?.pdIDd = AppDelegate.inventOrg.products[indexPath.row].vID
      //  cell?.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
      //  cell?.pdCatId = AppDelegate.inventOrg.products[indexPath.row].vCatID
      //  cell?.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
      //  cell?.newprod = AppDelegate.inventOrg.products[indexPath.row]
       // cell?.pdzT
      //  cell?.textLabel?.text = "\(AppDelegate.inventOrg.products[indexPath.row].toString())"
        return cell!;
        
    }
}
