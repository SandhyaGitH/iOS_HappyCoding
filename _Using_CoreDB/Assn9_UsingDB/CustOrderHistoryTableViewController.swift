//
//  CustOrderHistoryTableViewController.swift
//  assignment-7
//


import UIKit

class CustOrderHistoryTableViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
    
   // var selectedCust:Any // = appDelegate.fetchRecords().first?
    var selectedCust = ECustomer()
    var pickerData = [ECustomer]()// = appDelecate.fetchRecords()// .inventOrg.customers
    var tableData = [EOrder]()
    var orders = [EOrder]()
    var IsByCust = false
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
        selectedCust = pickerData[row]
        return String(pickerData[row].firstName!)
    }
 
 func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // AppDelegate.inventOrg.nCustomer = AppDelegate.inventOrg.customers.FindProfile(String(pickerData[row].vID))
    selectedCust = pickerData[row] //AppDelegate.inventOrg.nCustomer;
    if(selectedCust.firstName == "")
    {
        selectedCust = pickerData[1] //AppDelegate.inventOrg.customers.FindProfile("1")
    }
    displayitems = []
    fillDisplayOrder(selectedCust)
    tableView.reloadData()
 }
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DataPicker: UIPickerView!
    public var displayitems = [DisplayOrder]()
  //  var orders = [EOrder]()
    override func viewDidLoad() {
        super.viewDidLoad()
         pickerData = appDelecate.fetchRecords()
        orders = appDelecate.fetachOrders()
        //show all orders
       AllOrders()
      self.DataPicker.delegate = self
        self.DataPicker.dataSource = self
        if(tableView != nil)
        {
            tableView.delegate = self
            tableView.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
       
           // var cust = pickerData[1]
      
    }
    func AllOrders()
    {
        orders = appDelecate.fetachOrders()
        var displayOrder = DisplayOrder()
        tableData = [EOrder]()
        displayitems = []
        if(orders.count > 0)
        {
        for index in (0...orders.count-1)
        {
            for prod in orders[index].products! {
                tableData.append(orders[index])
                var ordID = 0
              
                ordID = Int(orders[index].orderID)
                if(ordID <= 0)
                {
                    ordID = 100
                }
     
                displayOrder.vOrderId = ordID
                if(Int(orders[index].itemOrdered) < 0)
                { displayOrder.vorderquant = 1}
                else {  displayOrder.vorderquant = Int(orders[index].itemOrdered)}
                let it = prod as? EProduct
                displayOrder = DisplayOrder()
                displayOrder.vPName = (it?.prodName)!
                displayitems.append(displayOrder)
            }
            if(orders[index].products!.count>0)
            {
            for item in (0...orders[index].products!.count-1)
            {  // displayOrder = DisplayOrder()
               // displayOrder.vOrderId = orders[index].OrderID
               
                //displayOrder.vPID = orders[index].Orderedproducts[item].0.vID
               // displayOrder.vPName = orders[index].products[].prodName
               // displayOrder.vorderquant = orders[index].Orderedproducts[item].1
             //   displayOrder.vPSupID = orders[index].Orderedproducts[item].0.vSupID
               // displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
                //displayOrder.vPName = orders[index].products[item].vName
              //  displayitems.append(displayOrder)
            }
            }
        }
        }
    }
    


    func fillDisplayOrder(_ cust:ECustomer)
    {   //= [EOrder]()
      //  orders = cust.orders
        //orders = appDelecate.fetachOrders()//
        displayitems = []
        tableData = [EOrder]()
        var orders =  cust.orders!.allObjects as! [EOrder]
        var displayOrder = DisplayOrder()
        if(orders.count > 0)
        {
            for ord in orders // for index in (0...orders.count-1)
        {
              //  var h = order.products!.allObjects as? [EProduct]
               // print(h?.first?.prodName)
                var p = ord.products!.allObjects.count
            for prod in ord.products!.allObjects as! [EProduct] {
                tableData.append(ord)
                var ordID = 0
                if(ord.orderID != nil)
                {
                ordID = Int(ord.orderID)
                }
                displayOrder.vOrderId = ordID
               displayOrder.vorderquant = Int(ord.itemOrdered)
                //let it = prod as? ProdToOrder
                displayOrder = DisplayOrder()
                displayOrder.vPName = (prod.prodName)!
                displayitems.append(displayOrder)
            }
          
        }
        }
        IsByCust = true;
    }
    

}

extension CustOrderHistoryTableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(tableView.cellForRow(at: indexPath)?.textLabel?.text)
        
       
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         /*
             var  Cust=Product()
            Cust = AppDelegate.inventOrg.products[indexPath.row] as Product
            AppDelegate.inventOrg.nProduct = Cust
            Cust.Delete(AppDelegate.inventOrg)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
             */
           /* let Dorder = orders[indexPath.row]
            
            appDelecate.DeleteOrderRecord(Dorder,selectedCust)
            if(IsByCust == true)
            {
                fillDisplayOrder(selectedCust)
            }
            else
            {
                AllOrders()
            } */
           // let custt = selectedCust as ECustomer
           //tableView.deleteRows(at: [indexPath], with: .fade)
            displayitems.remove(at: indexPath.row)
            
           tableView.reloadData()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OrderTableViewCell  else {
                    fatalError("The dequeued cell is not an instance of OrderTableViewCell.")
                }
       
      
        let ods = displayitems
        cell.ProdName.text = ods[indexPath.row].vPName
        
        cell.NoOfOrdered.text =  "Quantity: " + String(ods[indexPath.row].vorderquant)
        cell.OrderID.text = "Order ID :" + String(ods[indexPath.row].vOrderId)
       // let supname =  AppDelegate.inventOrg.suppliers.FindProfile(String(ods[indexPath.row].vPSupID)).vName;
       // cell.ProdSup.text =  supname
        
 
        return cell;
        
    }
}

