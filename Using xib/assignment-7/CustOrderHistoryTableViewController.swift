//
//  CustOrderHistoryTableViewController.swift
//  assignment-7
//


import UIKit

class CustOrderHistoryTableViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    let pickerData: [Customer] = AppDelegate.inventOrg.customers
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
     return String(pickerData[row].vLastName)
    }
 
 func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     AppDelegate.inventOrg.nCustomer = AppDelegate.inventOrg.customers.FindProfile(String(pickerData[row].vID))
    var cust = AppDelegate.inventOrg.nCustomer;
    if(cust.vFirstName == "")
    {
        cust = AppDelegate.inventOrg.customers.FindProfile("1")
    }
    displayitems = []
    fillDisplayOrder(cust)
    tableView.reloadData()
 }
    @IBAction func ViewHistory(_ sender: Any) {
        
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DataPicker: UIPickerView!
    public var displayitems = [DisplayOrder]()
    var orders = [Order]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil)
         tableView.register(nib, forCellReuseIdentifier: "storecell")
        self.DataPicker.delegate = self
        self.DataPicker.dataSource = self
        if(tableView != nil)
        {
            tableView.delegate = self
            tableView.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
        var cust = AppDelegate.inventOrg.nCustomer;
        if(cust.vFirstName == "")
        {
            cust = AppDelegate.inventOrg.customers.FindProfile("1")
        }
        orders = AppDelegate.inventOrg.orders.FindOrdersBYCustID(cust, Date.init())
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
                displayOrder.vPSupID = orders[index].Orderedproducts[item].0.vSupID
               // displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
                displayitems.append(displayOrder)
            }
        }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func fillDisplayOrder(_ cust:Customer)
    {  var orders = [Order]()
        orders = AppDelegate.inventOrg.orders.FindOrdersBYCustID(cust, Date.init())
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
                displayOrder.vPSupID = orders[index].Orderedproducts[item].0.vSupID
               // displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
                displayitems.append(displayOrder)
            }
        }
        }
    }
    

}

extension CustOrderHistoryTableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(tableView.cellForRow(at: indexPath)?.textLabel?.text)
        
       
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? OrderTableViewCell  else {
                    fatalError("The dequeued cell is not an instance of OrderTableViewCell.")
                }
       
      
        let ods = displayitems
        cell.ProdName.text = ods[indexPath.row].vPName
        cell.NoOfOrdered.text =  "Quantity: " + String(ods[indexPath.row].vorderquant)
        cell.OrderID.text = "Order ID :" + String(ods[indexPath.row].vOrderId)
        let supname =  AppDelegate.inventOrg.suppliers.FindProfile(String(ods[indexPath.row].vPSupID)).vName;
        cell.ProdSup.text =  supname
        
        
        return cell;
        
    }
}

