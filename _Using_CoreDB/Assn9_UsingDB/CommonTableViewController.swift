//
//  CommonTableViewController.swift
//  assignment-7
//


import UIKit
import CoreData

class CommonTableViewController:  UIViewController {
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
    var CallingParend:String = ""
    var SelectedItemID:String = ""
    var SelectedCust = ECustomer();
   var dataScourceArr = [ECustomer]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        {
            dataScourceArr = appDelecate.fetchRecords()
            tableview.delegate = self
        tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
          
        }
        // Do any additional setup after loading the view.
    }

    func fetchandUpdatetable()
    {
        dataScourceArr = appDelecate.fetchRecords()
        tableview.reloadData()
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
      // let item = Customer()
            var OldCust = SelectedCust
        var fn = "" ; var ln = "" ; var add = ""; var pho = ""; var email = "";
            alert.addTextField { (TFN) in
                TFN.placeholder = OldCust.firstName
                TFN.text = OldCust.firstName
               // item.vFirstName = OldCust.firstName!
            }
            alert.addTextField { (TLN) in
                TLN.text = OldCust.lastName
               // item.vLastName = OldCust.lastName
            }
            alert.addTextField { (TEmail) in
                TEmail.text = OldCust.address
               // item.vAddress = OldCust.address
            }
            alert.addTextField { (TAddress) in
                TAddress.text = OldCust.emailAddress
                //item.vEmailID = OldCust.emailAddress
            }
            alert.addTextField { (TContact) in
                TContact.text = OldCust.contactDetails
                TContact.keyboardType = UIKeyboardType.numberPad
               // item.vContactDetails = OldCust.vContactDetails
            }
        
        let action = UIAlertAction(title: "Edit", style: .default) { [self] (_) in
            guard  let custFN = alert.textFields?.first?.text else { return }
            if(custFN != "")
            { fn = custFN}
            guard  let custLN = alert.textFields?[1].text else { return }
            if(custLN != "")
            {   ln = custLN }
            guard  let CustAddress = alert.textFields?[2].text else { return }
            if(CustAddress != "")
            {add = CustAddress}
            guard  let custEmail = alert.textFields?[3].text else { return }
            if(custEmail != "")
            {email = custEmail}
            guard  let custPhone = alert.textFields?[4].text else { return }
            if(custPhone != "")
            {pho = custPhone}
            
            appDelecate.updateRecord(OldCust, fn, ln, add, email, pho)
           fetchandUpdatetable()
          //  self.tableview.reloadData()
        }
            alert.addAction(action)
            present(alert, animated: true)

        
    
        
      /* if(CallingParend == "Product")
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
 
        
    } */
    }
    
    @IBAction func AddItems(_ sender: Any) {
        
        print("hello")
       // var item = Customer()
        let alert = UIAlertController(title: "Add \(CallingParend)" , message: nil, preferredStyle: .alert)
       // let item = Customer()
        var fn = "" ; var ln = "" ; var add = ""; var pho = ""; var email = "";
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
        
        let action = UIAlertAction(title: "Add", style: .default) { [self] (_) in
            guard  let custFN = alert.textFields?.first?.text else { return }
            fn = custFN
            guard  let custLN = alert.textFields?[1].text else { return }
            ln = custLN
            guard  let CustAddress = alert.textFields?[2].text else { return }
            add = CustAddress
            guard  let custEmail = alert.textFields?[3].text else { return }
          email = custEmail
            guard  let custPhone = alert.textFields?[4].text else { return }
            pho = custPhone
            
           // print(item.toString())
           // self.AddCust(item)
       // let appDelegate  = AppDelegate()
        appDelecate.insertRecord(fn,ln,add,email,pho)
        fetchandUpdatetable()
           // self.tableview.reloadData()
           // self.add(dessert)
        }
            alert.addAction(action)
            present(alert, animated: true)
        
    
        if(CallingParend == "Product")
        {  /* var item  = Product()
          
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
            present(alert, animated: true) */
        }
        
        
    }
    
    
    func add(_ dessert: String) {
        let index = 0
       // desserts.insert(dessert, at: index)
        
      //  let indexPath = IndexPath(row: index, section: 0)
      //  tableView.insertRows(at: [indexPath], with: .left)
    }
    
    /* func AddProd(_ Pprod :Product){
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
 */
    }
    
    func AddCust(_ cust :Customer){
        
       // var h: String = CustFN.text!;
       // print(h);
     
    //   let cust = Customer(CustFN.text!, CustLN.text!, CustAddress.text!, CustEmail.text!, CustPho.text!)
        
       
     /*  if(AppDelegate.validateinput(cust))
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
 */
}
extension CommonTableViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        SelectedCust = dataScourceArr[indexPath.row] as ECustomer
        SelectedItemID = "1"
     /*
        if(CallingParend == "Product")
        {
          SelectedItemID = String(AppDelegate.inventOrg.products[indexPath.row].vID)
        }
        if(CallingParend == "Order")
        {
            SelectedItemID = String(AppDelegate.inventOrg.orders[indexPath.row].OrderID )
        } */
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
         
                
             let  Cust = dataScourceArr[indexPath.row] as ECustomer
            appDelecate.DeleteRecord(Cust);
            fetchandUpdatetable();
            
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
extension CommonTableViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = dataScourceArr.count;
    
        /*   if(CallingParend == "Customer")
       { count = AppDelegate.inventOrg.customers.count}
        if(CallingParend == "Product")
        { count = AppDelegate.inventOrg.products.count}
        if(CallingParend == "Order")
        { count = AppDelegate.inventOrg.orders.count}
      
 */
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustTableViewCell
        //cell.textLabel?.text="helo";
        let fn = dataScourceArr[indexPath.row].firstName
        cell?.Fnlbl?.text = fn
        cell?.Lnlbl?.text = dataScourceArr[indexPath.row].lastName
        cell?.addLbl?.text = dataScourceArr[indexPath.row].address
        cell?.emailLbl?.text = dataScourceArr[indexPath.row].emailAddress
        cell?.phoLbl?.text = dataScourceArr[indexPath.row].contactDetails
        return cell!;
      
        
        /*    let cell = UITableViewCell()
      
        if(CallingParend == "Customer")
        { cell.textLabel?.text = AppDelegate.inventOrg.customers[indexPath.row].toStringFortable()}
        if(CallingParend == "Product")
        { cell.textLabel?.text = AppDelegate.inventOrg.products[indexPath.row].toStringForTable()}
        if(CallingParend == "Order")
        { cell.textLabel?.text = AppDelegate.inventOrg.orders[indexPath.row].toString()}
       */
        // return cell
        
    }
    
}




