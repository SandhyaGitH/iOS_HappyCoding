//
//  SearchProductsViewController.swift
//  assignment-7
//


import UIKit

class SearchProductsViewController:   UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
      
   
//    @IBOutlet weak var tableView: UITableView!
  //  var filteredCandies: [Candy] = []
    var filteredprods: [Product] = AppDelegate.inventOrg.products
  
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    @IBOutlet weak var tableView: UITableView!
   
  
    
        @IBOutlet  var picker: UIPickerView!
        var SelectedValue = "Search By ProdID"
        //var pickerData: [Customer] = [Customer]()
        var pickerData = ["Search By ProdID","Search By DeptID","Search By CatID","Search By SupID"]
      
    
  //  var searchController = UISearchController(searchResultsController: nil)
  
    var searchController =    UISearchController()
        override func viewDidLoad() {
            super.viewDidLoad()
           let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "storecell")
            self.picker.delegate = self
            self.picker.dataSource = self
            if(self.tableView != nil)
            {
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
            searchController.searchResultsUpdater = self
            // 2
            searchController.obscuresBackgroundDuringPresentation = false
            // 3
            searchController.searchBar.placeholder = "Search Products"
            // 4
            navigationItem.searchController = searchController
            // 5
            definesPresentationContext = true
           
            
            self.searchController = ({
                       let controller = UISearchController(searchResultsController: nil)
                       controller.searchResultsUpdater = self
                       controller.dimsBackgroundDuringPresentation = false
                       controller.searchBar.sizeToFit()
                controller.searchBar.barStyle = UIBarStyle.black
                controller.searchBar.barTintColor = UIColor.white
                controller.searchBar.backgroundColor = UIColor.clear
                       self.tableView.tableHeaderView = controller.searchBar
                       return controller
                   })()
          
           
        }
        

        override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
               // Dispose of any resources that can be recreated.
           }

           // Number of columns of data
           func numberOfComponents(in pickerView: UIPickerView)->Int {
               return 1
           }
           
        
           // The number of rows of data
           func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
               return pickerData.count
           }
           
           // The data to return fopr the row and component (column) that's being passed in
           func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
            return String(pickerData[row])
           }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //AppDelegate.inventOrg.nCustomer = AppDelegate.inventOrg.customers.FindProfile(pickerData[row])
            SelectedValue = pickerData[row]
        }
        
       // selectedO

    func filterContentForSearchText(_ searchText: String,
                                    category: Product? = nil) {
        if(SelectedValue == "Search By ProdId")
        {
            filteredprods = AppDelegate.inventOrg.products.filter { (prod: Product) -> Bool in
            return String(prod.vID).contains(searchText)
            }
            
        }
         else  if(SelectedValue == "Search By CatID")
            {
            filteredprods = AppDelegate.inventOrg.products.filter { (prod: Product) -> Bool in
            return String(prod.vCatID).contains(searchText)
            }
         }
         else  if(SelectedValue == "Search By SupID")
            {
            filteredprods = AppDelegate.inventOrg.products.filter { (prod: Product) -> Bool in
            return String(prod.vSupID).contains(searchText)
            }
         }
         else  if(SelectedValue == "Search By DeptID")
            {
            filteredprods = AppDelegate.inventOrg.products.filter { (prod: Product) -> Bool in
            return String(prod.vDeptID).contains(searchText)
            }
         }
         else{
            filteredprods = AppDelegate.inventOrg.products.filter { (prod: Product) -> Bool in
            return String(prod.vID).contains(searchText)
            }
            
         }
        
        tableView.reloadData()
          
      
        }
      
    
    
}

extension SearchProductsViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //  String(AppDelegate.inventOrg.products
       
        let vc = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: nil)
          
     
          
        
        vc.pdName = AppDelegate.inventOrg.products[indexPath.row].vName
      
        let imagename = String(AppDelegate.inventOrg.products[indexPath.row].vID) + ".jpg"
       // vc?.ProdImage.image = UIImage()
       // vc.pdImage =  UIImage(named: imagename)!
        
      
        vc.pdQuan  =  String(AppDelegate.inventOrg.products[indexPath.row].vAvailableQuantity)
        let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
        vc.pdSup = "Supplier : " + supname
        vc.pdID = AppDelegate.inventOrg.products[indexPath.row].vID
        vc.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
        vc.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
        vc.pdCatd = AppDelegate.inventOrg.products[indexPath.row].vCatID
        vc.pdType = AppDelegate.inventOrg.products[indexPath.row].vType
        vc.vNewProd = AppDelegate.inventOrg.products[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
         
            if("Product" == "Product")
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
extension SearchProductsViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredprods.count
          }
            
          return filteredprods.count

  //  count = AppDelegate.inventOrg.products.count
     
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     /*  let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text="helo";
        cell.textLabel?.text = "\(AppDelegate.inventOrg.customers[indexPath.row].toString())"
        return cell; */
        
        let cell = UITableViewCell()
        // let dessert = desserts[indexPath.row]
      //  cell.textLabel?.text = AppDelegate.inventOrg.products[indexPath.row].toStringForTable()
     
        let prod: Product
         if isFiltering {
            prod = filteredprods[indexPath.row]
         } else {
            prod = AppDelegate.inventOrg.products[indexPath.row]
         }
        cell.textLabel?.text = prod.toStringForTable()
        
        
      
           guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "storecell", for: indexPath) as? ProductTableViewCell  else {
                       fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
                   }
        
        cell2.prodName.text = prod.vName
        cell2.ProdType.text = prod.vType
        cell2.ProdQuant.text = String(prod.vAvailableQuantity)
        cell2.ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(prod.vCatID)).vName
        cell2.ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(prod.vDeptID)).vName
        cell2.ProdSupID.text = AppDelegate.inventOrg.suppliers.FindProfile(String(prod.vSupID)).vName
         return cell2
       // return cell
        
    }

}

extension SearchProductsViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}






