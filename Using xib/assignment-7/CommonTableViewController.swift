//
//  CommonTableViewController.swift
//  assignment-7
//


import UIKit

class CommonTableViewController: UIViewController {
    var CallingParend:String = ""
    var SelectedItemID:String = ""
   
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        {  tableview.delegate = self
        tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
          
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func EditItem(_ sender: Any) {
        if(SelectedItemID == "")
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Select an Item")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: "Edit \(CallingParend)" , message: nil, preferredStyle: .alert)
        if(CallingParend == "Customer")
        {
           let item = Customer()
            var OldCust = AppDelegate.inventOrg.customers.FindProfile(SelectedItemID)
            
            alert.addTextField { (TFN) in
                TFN.placeholder = OldCust.vFirstName
                TFN.text = OldCust.vFirstName
                item.vFirstName = OldCust.vFirstName
            }
            alert.addTextField { (TLN) in
                TLN.text = OldCust.vLastName
                item.vLastName = OldCust.vLastName
            }
            alert.addTextField { (TEmail) in
                TEmail.text = OldCust.vAddress
                item.vAddress = OldCust.vAddress
            }
            alert.addTextField { (TAddress) in
                TAddress.text = OldCust.vEmailID
                item.vEmailID = OldCust.vEmailID
            }
            alert.addTextField { (TContact) in
                TContact.text = OldCust.vContactDetails
                TContact.keyboardType = UIKeyboardType.numberPad
                item.vContactDetails = OldCust.vContactDetails
            }
        
        let action = UIAlertAction(title: "Edit", style: .default) { (_) in
            guard  let custFN = alert.textFields?.first?.text else { return }
            if(custFN != "")
            { item.vFirstName = custFN}
            guard  let custLN = alert.textFields?[1].text else { return }
            if(custLN != "")
            {   item.vLastName = custLN }
            guard  let CustAddress = alert.textFields?[2].text else { return }
            if(CustAddress != "")
            {item.vAddress = CustAddress}
            guard  let custEmail = alert.textFields?[3].text else { return }
            if(custEmail != "")
            {item.vEmailID = custEmail}
            guard  let custPhone = alert.textFields?[4].text else { return }
            if(custPhone != "")
            {item.vContactDetails = custPhone}
            
           // print(item.toString())
            let index = AppDelegate.inventOrg.customers.firstIndex(of: OldCust)
            item.vID = OldCust.vID
            AppDelegate.inventOrg.customers[index!] = item
           
            self.tableview.reloadData()
        }
            alert.addAction(action)
            present(alert, animated: true)
        
    }
        
        if(CallingParend == "Product")
        {
           let item = Product()
            var OldProd = AppDelegate.inventOrg.products.FindProfile(SelectedItemID)
            
            alert.addTextField { (TFN) in
                TFN.text = OldProd.vName
                item.vName = OldProd.vName
            }
            alert.addTextField { (TType) in
                TType.text = OldProd.vType
                item.vType = OldProd.vType
            }
            alert.addTextField { (TQuant) in
                TQuant.text = String(OldProd.vAvailableQuantity)
                TQuant.keyboardType = UIKeyboardType.numberPad
                item.vAvailableQuantity = OldProd.vAvailableQuantity
            }
            alert.addTextField { (TDept) in
                TDept.text = String(OldProd.vDeptID)
                TDept.keyboardType = UIKeyboardType.numberPad
                item.vDeptID = OldProd.vDeptID
            }
            alert.addTextField { (TCat) in
                TCat.text = String(OldProd.vCatID)
                TCat.keyboardType = UIKeyboardType.numberPad
                item.vCatID = OldProd.vCatID
            }
            alert.addTextField { (TSup) in
                TSup.text = String(OldProd.vSupID)
                TSup.keyboardType = UIKeyboardType.numberPad
                item.vSupID = OldProd.vSupID
            }
        
        let action = UIAlertAction(title: "Edit", style: .default) { (_) in
            guard  let custFN = alert.textFields?.first?.text else { return }
            if(custFN != "")
            { item.vName = custFN}
            guard  let custLN = alert.textFields?[1].text else { return }
            if(custLN != "")
            { item.vType = custLN}
            guard  let Quant = alert.textFields?[2].text else { return }
            if(Quant != "")
            { item.vAvailableQuantity = Int(Quant)!}
            guard  let DeptID = alert.textFields?[3].text else { return }
            if(DeptID != "")
            { item.vDeptID = Int(DeptID)!}
            guard  let CatID = alert.textFields?[4].text else { return }
            if(CatID != "")
            { item.vCatID = Int(CatID)!}
            guard  let SupID = alert.textFields?[4].text else { return }
            if(SupID != "")
            { item.vSupID = Int(SupID)!}
            
           // print(item.toString())
            let index = AppDelegate.inventOrg.products.firstIndex(of: OldProd)
            item.vID = OldProd.vID
            AppDelegate.inventOrg.products[index!] = item
           
            self.tableview.reloadData()
        }
            alert.addAction(action)
            present(alert, animated: true)
        
    }
    }
    
    @IBAction func AddItems(_ sender: Any) {
        
        print("hello")
      //  var item = Customer()
        let alert = UIAlertController(title: "Add \(CallingParend)" , message: nil, preferredStyle: .alert)
        if(CallingParend == "Customer")
        { var item = Customer()
          
            alert.addTextField { (TFN) in
                TFN.placeholder = "Enter First Name"
                
            }
            alert.addTextField { (TLN) in
                TLN.placeholder = "Enter Last Name"
            }
            alert.addTextField { (TEmail) in
                TEmail.placeholder = "Enter  Address"
            }
            alert.addTextField { (TAddress) in
                TAddress.placeholder = "Enter Email Address"
            }
            alert.addTextField { (TContact) in
                TContact.placeholder = "Enter Contact no"
                TContact.keyboardType = UIKeyboardType.numberPad
            }
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard  let custFN = alert.textFields?.first?.text else { return }
            item.vFirstName = custFN
            guard  let custLN = alert.textFields?[1].text else { return }
            item.vLastName = custLN
            guard  let CustAddress = alert.textFields?[2].text else { return }
            item.vContactDetails = CustAddress
            guard  let custEmail = alert.textFields?[3].text else { return }
            item.vEmailID = custEmail
            guard  let custPhone = alert.textFields?[4].text else { return }
            item.vContactDetails = custPhone
            
            print(item.toString())
            self.AddCust(item)
            self.tableview.reloadData()
           // self.add(dessert)
        }
            alert.addAction(action)
            present(alert, animated: true)
        }
    
        if(CallingParend == "Product")
        {   var item  = Product()
          
            alert.addTextField { (TFN) in
                TFN.placeholder = "Enter Product Name"
            }
            alert.addTextField { (TLN) in
                TLN.placeholder = "Enter Product Type"
            }
            alert.addTextField { (TQuant) in
                TQuant.placeholder = "Enter Quantity"
                TQuant.keyboardType = UIKeyboardType.numberPad
            }
            alert.addTextField { (TDeptID) in
                TDeptID.placeholder = "Enter Dept ID"
                TDeptID.keyboardType = UIKeyboardType.numberPad
            }
            alert.addTextField { (TCatID) in
                TCatID.placeholder = "Enter Category ID"
                TCatID.keyboardType = UIKeyboardType.numberPad
            }
            alert.addTextField { (TSupID) in
                TSupID.placeholder = "Enter Supplier ID"
                TSupID.keyboardType = UIKeyboardType.numberPad
            }
        
            let action = UIAlertAction(title: "Add", style: .default) { (_) in
                guard  let custFN = alert.textFields?.first?.text else { return }
                item.vName = custFN
                guard  let custLN = alert.textFields?[1].text else { return }
                item.vType = custLN
                guard  var Quant = alert.textFields?[2].text else { return }
                if(Quant == "") { Quant = "0"}
                item.vAvailableQuantity = Int(Quant)!
                guard  let DeptID = alert.textFields?[3].text else { return }
                if(DeptID != "")
                { item.vDeptID = Int(DeptID)! }
                guard  let CatID = alert.textFields?[4].text else { return }
                if(CatID != "")
                { item.vCatID = Int(CatID)! }
                guard  let SupID = alert.textFields?[4].text else { return }
                if(SupID != "")
                {
                    item.vSupID = Int(SupID)!
                    
                }
       
                self.AddProd(item)
                self.tableview.reloadData()
        }
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        
    }
    
    
    func add(_ dessert: String) {
        let index = 0
       // desserts.insert(dessert, at: index)
        
      //  let indexPath = IndexPath(row: index, section: 0)
      //  tableView.insertRows(at: [indexPath], with: .left)
    }
    
    func AddProd(_ Pprod :Product){
        let prod = Product()
        
        
        AppDelegate.inventOrg.nProduct.vName = Pprod.vName
        AppDelegate.inventOrg.nProduct.vType = Pprod.vType
        AppDelegate.inventOrg.nProduct.vAvailableQuantity = Pprod.vAvailableQuantity
       
        if(AppDelegate.validateinput(AppDelegate.inventOrg.nProduct,String(Pprod.vDeptID),String(Pprod.vCatID),String(Pprod.vSupID)))
        {
            
            AppDelegate.inventOrg.nProduct.vDeptID = Pprod.vDeptID
            AppDelegate.inventOrg.nProduct.vCatID = Pprod.vCatID
            AppDelegate.inventOrg.nProduct.vSupID = Pprod.vSupID
            
            if(!AppDelegate.inventOrg.departments.isUniqueidExist(String(Pprod.vDeptID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!AppDelegate.inventOrg.categories.isUniqueidExist(String(Pprod.vCatID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Category ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!AppDelegate.inventOrg.suppliers.isUniqueidExist(String(Pprod.vSupID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else{
                prod.Add(AppDelegate.inventOrg)
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
             //   window?.rootViewController!.present(alert, animated: true, completion: nil)
              //  addSubMenu(sender:sender)
            }
            
            
            
        } else
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
    }
    
    func AddCust(_ cust :Customer){
        
       // var h: String = CustFN.text!;
       // print(h);
     
    //   let cust = Customer(CustFN.text!, CustLN.text!, CustAddress.text!, CustEmail.text!, CustPho.text!)
        
       
       if(AppDelegate.validateinput(cust))
       {
           if(cust.vEmailID.validateEmailId())
           {
               if(cust.vContactDetails.validaPhoneNumber())
               {
                 
                   AppDelegate.AddCustomer(cust)
                   
                let alert = AppDelegate.uiCreation.CreateAlert("Alert","Saved Successfully")
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                   }))
                  present(alert, animated: true)
               }
               else
               {
                  
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Invalid Pho Number")
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                   }))
                  present(alert, animated: true)
               }
           }
           else
           {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Invalid Email Address")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
           }
           
           
           
       } else
       {
        let alert =  AppDelegate.uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
           }))
           present(alert, animated: true)
       }
    }

}
extension CommonTableViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if(CallingParend == "Customer")
      {
        SelectedItemID = String(AppDelegate.inventOrg.customers[indexPath.row].vID)
      }
        if(CallingParend == "Product")
        {
          SelectedItemID = String(AppDelegate.inventOrg.products[indexPath.row].vID)
        }
        if(CallingParend == "Order")
        {
            SelectedItemID = String(AppDelegate.inventOrg.orders[indexPath.row].OrderID )
        }
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
            if(CallingParend == "Customer")
           {
                var  Cust=Customer()
                Cust = AppDelegate.inventOrg.customers[indexPath.row] as Customer
                AppDelegate.inventOrg.nCustomer = Cust
                Cust.Delete(AppDelegate.inventOrg)
            }
            if(CallingParend == "Product")
            {
                var  prod=Product()
                prod = AppDelegate.inventOrg.products[indexPath.row] as Product
               AppDelegate.inventOrg.nProduct = prod
                prod.Delete(AppDelegate.inventOrg)
            }
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
extension CommonTableViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0;
       if(CallingParend == "Customer")
       { count = AppDelegate.inventOrg.customers.count}
        if(CallingParend == "Product")
        { count = AppDelegate.inventOrg.products.count}
        if(CallingParend == "Order")
        { count = AppDelegate.inventOrg.orders.count}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     /*  let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text="helo";
        cell.textLabel?.text = "\(AppDelegate.inventOrg.customers[indexPath.row].toString())"
        return cell; */
        
        let cell = UITableViewCell()
        // let dessert = desserts[indexPath.row]
        if(CallingParend == "Customer")
        { cell.textLabel?.text = AppDelegate.inventOrg.customers[indexPath.row].toStringFortable()}
        if(CallingParend == "Product")
        { cell.textLabel?.text = AppDelegate.inventOrg.products[indexPath.row].toStringForTable()}
        if(CallingParend == "Order")
        { cell.textLabel?.text = AppDelegate.inventOrg.orders[indexPath.row].toString()}
        
         return cell
        
    }
    
}




