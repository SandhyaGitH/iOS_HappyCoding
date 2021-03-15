//
//  CheckOutTableViewController.swift
//  assignment-7
//



import UIKit

class CheckOutTableViewController: UIViewController {
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
    var loginCust = ECustomer()
    let uiCreation = UICreation()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var CheckoutBtn: UIButton!
    var orders = [ProdToOrder]()
    override func viewDidLoad() {
        super.viewDidLoad()
       // var arr = set.allObjects
        loginCust = appDelecate.fetchRecords().first!
        CheckoutBtn.isEnabled = false
        if(loginCust.cart != nil)
        {
            if((loginCust.cart?.products!.count)! > 0)
            {
                orders = loginCust.cart?.products?.allObjects as! [ProdToOrder]
                CheckoutBtn.isEnabled = true
             // orders = (appDelecate.fetachCart().first?.products?.allObjects) as! [ProdToOrder]
            }
        }
       // orders = (appDelecate.fetchRecords().first?.cart?.products?.allObjects) as! [ProdToOrder]
       // orders = ord
         if(self.tableView != nil)
         {
             self.tableView.delegate = self
             self.tableView.dataSource = self
         }
        // Do any additional setup after loading the view.
    }

    @IBAction func CheckOut(_ sender: Any) {
        let od = EOrder()
          
     /*   AppDelegate.inventOrg.nOrder.OrderID = od.CreatenewOrder(AppDelegate.inventOrg.nOrdertuple,AppDelegate.inventOrg)
     AppDelegate.inventOrg.nOrdertuple = [] //.append((newProduct,quant))
        AppDelegate.inventOrg.ProdsForOrder = [] //.append(newProduct)
     */
        var pto = [ProdToOrder]()
       // pto = orders.
        appDelecate.InsertToOrder(orders, 10)
       // appDelecate.UpdateCart(<#T##cart: ECart##ECart#>, <#T##vprod: ProdToOrder##ProdToOrder#>, <#T##TotalintoCart: Int##Int#>, <#T##Cust: ECustomer##ECustomer#>)
        appDelecate.EmptyCustomerCart()
        orders = [ProdToOrder]()
        if(loginCust.cart != nil)
        {
            if((loginCust.cart?.products!.count)! > 0)
            {
                orders = loginCust.cart?.products?.allObjects as! [ProdToOrder]
             // orders = (appDelecate.fetachCart().first?.products?.allObjects) as! [ProdToOrder]
            }
        }
        tableView.reloadData();
        appDelecate.EmptyEntity("ProdToOrder")
        CheckoutBtn.isEnabled = false;
       
        
        let alert =  uiCreation.CreateAlert("Alert","Order Created Sucessfully ")
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
        }))
        present(alert, animated: true)
    }
    
   

}
extension CheckOutTableViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //  String(AppDelegate.inventOrg.products
       
       
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
             /*  var  prod=Order()
                prod = AppDelegate.inventOrg.nOrdertuple as Order
               AppDelegate.inventOrg.nProduct = prod
                prod.Delete(AppDelegate.inventOrg) */
           
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
extension CheckOutTableViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return  orders.count
     
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
       // let orders = appDelecate.fetachCart().first
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductTableViewCell  else {
                    fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
                }
        cell2.prodName.text = orders[indexPath.row].product?.prodName
        cell2.ProdQuant.text = String(orders[indexPath.row].quantity)
       /* cell2.ProdType.text = orders[indexPath.row].0.vType
        cell2.ProdQuant.text = String(orders[indexPath.row].0.vAvailableQuantity)
        cell2.ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(orders[indexPath.row].0.vCatID)).vName
        cell2.ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(orders[indexPath.row].0.vDeptID)).vName
        cell2.ProdSupID.text = AppDelegate.inventOrg.suppliers.FindProfile(String(orders[indexPath.row].0.vSupID)).vName
       */
 return cell2
        
       
        
    }

}
