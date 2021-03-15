//
//  AllRequestsViewController.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/12/20.
//

import UIKit

class AllRequestsViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var AllInventoryReq :[Db_InventoryRequest]?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AllRequestsTblViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
       
        BindInventoryReqArr()
        self.tableView.delegate = self
        self.tableView.dataSource = self
  
    }

    func BindInventoryReqArr()
    {
        let dth = DBHandler()
      let allRequests =   dth.fetchInventoryRequests()

       // let reqs = appDelegate.pendingInventoryReq()
        AllInventoryReq = [Db_InventoryRequest]()
        for req in allRequests {
           
            if(req.requestID != nil &&  req.provider?.hospitalName != nil)
            {
                print(String(req.requestID) + ((req.provider?.hospitalName)! )  )
                AllInventoryReq?.append(req) }
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
extension AllRequestsViewController :UITableViewDelegate{
    
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

extension AllRequestsViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if let count = AllInventoryReq?.count
        {
            return  count
        }
        else
        { return 0 }
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AllRequestsTblViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }
       // cell.requestObj = AllInventoryReq![indexPath.row] as Db_InventoryRequest
    
     
        cell.RequestDetails.text = AllInventoryReq![indexPath.row].item! + " " + String(AllInventoryReq![indexPath.row].quantity)
   
        if let prodname = AllInventoryReq![indexPath.row].provider?.hospitalName
        {
            cell.providerName.text = "ReqID: " + String(AllInventoryReq![indexPath.row].requestID) + "- " + prodname
        }
        if(AllInventoryReq![indexPath.row].isApproved == true)
        {
            cell.RequestStatus.text = "Approved"
        }
        else
        {
            cell.RequestStatus.text = "Pending"
        }
        if let name = AllInventoryReq![indexPath.row].item
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
