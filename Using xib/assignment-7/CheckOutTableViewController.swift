//
//  CheckOutTableViewController.swift
//  assignment-7
//



import UIKit

class CheckOutTableViewController: UIViewController {

    let uiCreation = UICreation()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
         tableView.register(nib, forCellReuseIdentifier: "storecell")
       
         if(self.tableView != nil)
         {
             self.tableView.delegate = self
             self.tableView.dataSource = self
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
        tableView.reloadData();
      //  hghhghghgh
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
        

        return AppDelegate.inventOrg.nOrdertuple.count
     
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
      let orders = AppDelegate.inventOrg.nOrdertuple
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? ProductTableViewCell  else {
                    fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
                }
        cell2.prodName.text = orders[indexPath.row].0.vName
        cell2.ProdType.text = orders[indexPath.row].0.vType
        cell2.ProdQuant.text = String(orders[indexPath.row].0.vAvailableQuantity)
        cell2.ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(orders[indexPath.row].0.vCatID)).vName
        cell2.ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(orders[indexPath.row].0.vDeptID)).vName
        cell2.ProdSupID.text = AppDelegate.inventOrg.suppliers.FindProfile(String(orders[indexPath.row].0.vSupID)).vName
         return cell2
        
       
        
    }

}
