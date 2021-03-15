//
//  RequestApprovalViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/9/20.
//

import UIKit

class RequestApprovalViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var pendingInventoryReq :[Db_InventoryRequest]?
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "RequestTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storecell")
       
        BindInventoryReqArr()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

func BindInventoryReqArr()
{
    let reqs = appDelegate.pendingInventoryReq()
    pendingInventoryReq = [Db_InventoryRequest]()
    for req in reqs {
        pendingInventoryReq?.append(req)
    }
}
    @IBAction func didTabMenuButton()
    {
       print("HO")
    
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        vc.calledBy = "Controller"
         // self.navigationController!.pushViewController(vc, animated: true)
        let transition:CATransition = CATransition()
               transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
               self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController!.pushViewController(vc, animated: false)
    }
    

}
extension RequestApprovalViewController :UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
       // Selectedprod = dataScourceArr[indexPath.row] as EProduct
       // SelectedItemID = "1"
    
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         //  let  prod = dataScourceArr[indexPath.row] as EProduct
            
            /*    if(CallingParend == "Product")
            {
                var  prod=Product()
                prod = AppDelegate.inventOrg.products[indexPath.row] as Product
               AppDelegate.inventOrg.nProduct = prod
                prod.Delete(AppDelegate.inventOrg)
            }
 */
            // Delete the row from the data source
           // tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

extension RequestApprovalViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if let count = pendingInventoryReq?.count
        {
            return  count
        }
        else
        { return 0 }
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? RequestTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }
        cell.requestObj = pendingInventoryReq![indexPath.row] as Db_InventoryRequest
        cell.requestID = pendingInventoryReq![indexPath.row].requestID
        cell.providerObj = pendingInventoryReq![indexPath.row].provider
        if let name = pendingInventoryReq![indexPath.row].item
        {
        cell.ItemName.text = name
        }
       
        cell.ItemQuantity.text = String(pendingInventoryReq![indexPath.row].quantity)
   
        if let prodname = pendingInventoryReq![indexPath.row].provider?.hospitalName
        {
        cell.ProviderName.text = prodname
        }
        if let address = pendingInventoryReq![indexPath.row].provider?.addressLine1 , let city = pendingInventoryReq![indexPath.row].provider?.city
        {
            cell.providerAddress.text = "\(address) \(city)"
        }
        if let name = pendingInventoryReq![indexPath.row].item
        {
            if(name == "Covid19 Vaccine" || name == "Covid Vaccine")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "Covid19Vaccine")
            }
            else  if(name == "PPE  Kit")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "PPEkit")
            }
            else  if(name == "N95Masks")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "N95Mask")
            }
            else  if(name == "Covid19 Test Kit")
            {
                cell.ItemImage.image = #imageLiteral(resourceName: "Civid19TestKit")
            }
           
            
        }
        return cell
    }
    
    
}
