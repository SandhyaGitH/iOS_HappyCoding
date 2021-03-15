//
//  ProvidersListViewController.swift
//  FinalProject_Phase1
//
//  Created by Samarth chaturvedi on 12/9/20.
//

import UIKit

class ProvidersListViewController: UIViewController {

    var ProviderList: Array<DB_Hospital>?
    @IBOutlet weak var tableView: UITableView!
   // @IBOutlet weak var SignUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProvidersTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storecell")
        Bindproviders()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func Bindproviders()
    {
        var Providers = [DB_Hospital]()
       let dth =  DBHandler()
        ProviderList = [DB_Hospital]()
        Providers = dth.fetchProviderss()
       
        ProviderList = Providers.filter { (prov: DB_Hospital) -> Bool in
             do {
                 
                return prov.hospitalName != nil
                    &&
                    prov.addressLine1 != "" && prov.longitude != 0.0
             }}
        
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

extension ProvidersListViewController :UITableViewDelegate{
    
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

extension ProvidersListViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProviderList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? ProvidersTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
               }
        if let name = ProviderList![indexPath.row].hospitalName , let address = ProviderList![indexPath.row].addressLine1{
            cell.ProviderNameLbl.text = name
            cell.providerAddressLbl.text = address
           
        }
        if let vaccinecount =   ProviderList![indexPath.row].inventoryR?.covidVaccine
        {
            cell.ProviderVaccineslbl.text = "Vaccines: " + String(vaccinecount)
        }
        else
        {
            cell.ProviderVaccineslbl.text = "Vaccines: 0"
        }
        
        if let testkit =   ProviderList![indexPath.row].inventoryR?.testKit
        {
            cell.ProviderTestKitCountLbl.text = "TestKits:  " + String(testkit)
        }
        else
        {
            cell.ProviderTestKitCountLbl.text = "TestKits:   0"
        }
        
        if let image = ProviderList![indexPath.row].image {
        
            cell.ProviderImageview.image = UIImage(data: (image))
        }
        
        if let phone = ProviderList![indexPath.row].loginUserR?.loginID {
        
            cell.ProviderPhone.text = phone
        }
        else
        {
            cell.ProviderPhone.text = "NA"
        }
        
        
        return cell
    }
    
    
}
