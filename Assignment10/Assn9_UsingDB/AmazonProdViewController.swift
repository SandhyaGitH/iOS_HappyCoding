//
//  AmazonProdViewController.swift
//  Assn9_UsingDB
//
//  Created by Samarth chaturvedi on 12/7/20.
//

import UIKit

class AmazonProdViewController:   UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
     let  amzurl = "https://api.rainforestapi.com/request?api_key=FE91588FA9D641579AC7355F3A2A6A0E&type=category&url=https%3A%2F%2Fwww.amazon.com%2Fs%3Fbbn%3D16225009011%26rh%3Dn%253A%252116225009011%252Cn%253A502394%252Cn%253A281052"
        
    var filteredprods = [EProduct]();
    var DataProdArr = [EProduct]();
    var NewDataProdArr = [Product]();
    var testNewDataProdArr = [EProduct]();
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet  var picker: UIPickerView!
    var SelectedValue = "Search By Product"
    //var pickerData: [Customer] = [Customer]()
    var pickerData = ["Search By Product","Search By Department","Search By Category","Search By Supplier"]
    
    
    //  var searchController = UISearchController(searchResultsController: nil)
    func filldisplayArr(completionHandler: @escaping (Response)->Void)
    {
        
        var result : Response?
        let url = URL(string:amzurl)
        
        guard url != nil else { print("Error creating UL");  return }
        
        let request = URLRequest(url: url!)
      
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [self] (data, response, error) in
         
            guard let data = data ,  error == nil else {
                print("Error with fetching products: \(error)")
            return
          }
            
           
            do{
                 result = try JSONDecoder().decode(Response.self,from:data)
            }
            catch {
                print("error \(error)")
            }
            
            guard let json = result else {
               return
           }
            DispatchQueue.main.async {
                completionHandler(json)
            }
            
           /* var prod = Product()
            for index in Range(0...5)
            {
                 prod = Product()
                prod.vName =  String(String(json.category_results![index].title!).prefix(10))
                prod.vType = "Type: " //+ Response.category_results![index].c!
                if let price = json.category_results![index].price?.raw {
                    prod.vAvailableQuantity = Int(price) ?? 0
                }
                prod.vImageURL = json.category_results![index].image ?? ""
                NewDataProdArr.append(prod)
             // ""
               
               // "https://m.media-amazon.com/images/I/71W1KvLH3sL._AC_UY218_.jpg"
                    //(UIImage(contentsOfFile:  json.category_results![index].image!)?.pngData())!
            } */
           // print(json.category_results![0].title)
          //
        })
        task.resume()
        
       
        //var Response   = APIDataViewController.fatchAmazonProds()
      
    }
    
    var searchController =    UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredprods = appDelecate.fetchProdRecords()
        DataProdArr = appDelecate.fetchProdRecords()
        filldisplayArr{ [self](Response) in
          //  for cate in Response.category_results
            var prod = Product()
           guard let data = Response.category_results
           else {
            print("free trial expired")
            return
           }
            for index in Range(0...Response.category_results!.count-1)
            {
              var  testprod = EProduct()
                 prod = Product()
                prod.vName =  String(String(Response.category_results![index].title!).prefix(10))
                prod.vType = "Type: " //+ Response.category_results![index].c!
                if let price = Response.category_results![index].price?.raw {
                    prod.vAvailableQuantity = Int(price) ?? 0
                }
                prod.vImageURL = Response.category_results![index].image
                NewDataProdArr.append(prod)
              let nprod =  appDelecate.insertProdRecord22(prod.vName, prod.vType, 1, 1, 1, 1)
                
                    // testprod.prodName = prod.vName  //String(String(Response.category_results![index].title!).prefix(10))
                //testprod.prodType = "Type: " //+ Response.category_results![index].c!
                //  testprod.prodQuantity = 12
            //    testprod.pImage = Response.category_results![index].image
                
              //  prod.vImageURL = Response.category_results![index].image

                testNewDataProdArr.append(nprod)
             // ""
               
               // "https://m.media-amazon.com/images/I/71W1KvLH3sL._AC_UY218_.jpg"
                    //(UIImage(contentsOfFile:  json.category_results![index].image!)?.pngData())!
            }
            tableView.reloadData()
        }
        //   let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        //  tableView.register(nib, forCellReuseIdentifier: "storecell")
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
                                    category: EProduct? = nil) {
        if(SelectedValue == "Search By Product")
        {
            if(searchText != "")
            {
                
                filteredprods = DataProdArr.filter { (prod: EProduct) -> Bool in
                    return String(prod.prodName!).contains(searchText)
                }
            }
            if(searchText == "")
            {
                filteredprods = appDelecate.fetchProdRecords()
            }
            
        }
        else  if(SelectedValue == "Search By Category")
        {
            var catDataarr = AppDelegate.inventOrg.categories;
            catDataarr =  catDataarr.filter {(cat: Category) -> Bool in
                return String(cat.vName.lowercased()).contains(searchText.lowercased())}
            
            var tempProdArr = [EProduct] ()
            if(catDataarr.count > 0) {
                for index in Range(0...catDataarr.count-1) {
                    // for cat in catDataarr {
                    filteredprods = DataProdArr.filter { (prod: EProduct) -> Bool in
                        do {
                            return String(prod.catID).contains(String(catDataarr[index].vID))
                        }
                        
                    }
                    tempProdArr.append(contentsOf: filteredprods)
                    
                }
                filteredprods = tempProdArr
                
            }
            
            if(searchText == "")
            {
                filteredprods = appDelecate.fetchProdRecords()
            }
            
        }
        else  if(SelectedValue == "Search By Supplier")
        {
            var SupDataarr = AppDelegate.inventOrg.suppliers;
            SupDataarr =  SupDataarr.filter {(sup: Supplier) -> Bool in
                return String(sup.vName.lowercased()).contains(searchText.lowercased())}
            
            var tempProdArr = [EProduct] ()
            if(SupDataarr.count > 0) {
                for index in Range(0...SupDataarr.count-1) {
                    // for cat in catDataarr {
                    filteredprods = DataProdArr.filter { (prod: EProduct) -> Bool in
                        do {
                            
                            return String(prod.supID).contains(String(SupDataarr[index].vID))
                        }
                        
                    }
                    tempProdArr.append(contentsOf: filteredprods)
                    
                }
                filteredprods = tempProdArr
                
            }
            if(searchText == "")
            {
                filteredprods = appDelecate.fetchProdRecords()
            }
        }
        
        else  if(SelectedValue == "Search By Department")
        {
            var DeptDataarr = AppDelegate.inventOrg.departments;
            DeptDataarr =  DeptDataarr.filter {(Dept: Department) -> Bool in
                return String(Dept.vName.lowercased()).contains(searchText.lowercased())}
            
            var tempProdArr = [EProduct] ()
            if(DeptDataarr.count > 0) {
                for index in Range(0...DeptDataarr.count-1) {
                    // for cat in catDataarr {
                    filteredprods = DataProdArr.filter { (prod: EProduct) -> Bool in
                        do {
                            
                            return String(prod.deptID).contains(String(DeptDataarr[index].vID))
                        }
                        
                    }
                    tempProdArr.append(contentsOf: filteredprods)
                    
                }
                filteredprods = tempProdArr
                
            }
            if(searchText == "")
            {
                filteredprods = appDelecate.fetchProdRecords()
            }
        }
         else{
            filteredprods = DataProdArr.filter { (prod: EProduct) -> Bool in
                return String(prod.prodName!).contains(searchText)
            }
         
         }
        
        tableView.reloadData()
        
        
    }
    
    
    
}

extension AmazonProdViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let vc = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: nil)
         
         
         
         
         vc.pdName = AppDelegate.inventOrg.products[indexPath.row].vName
         
         //  let imagename = String(DataProdArr[indexPath.row].vID) + ".jpg"
         
         
         
         vc.pdQuan  =  String(AppDelegate.inventOrg.products[indexPath.row].vAvailableQuantity)
         let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
         vc.pdSup = "Supplier : " + supname
         vc.pdID = AppDelegate.inventOrg.products[indexPath.row].vID
         vc.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
         vc.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
         vc.pdCatd = AppDelegate.inventOrg.products[indexPath.row].vCatID
         vc.pdType = AppDelegate.inventOrg.products[indexPath.row].vType
         vc.vNewProd = AppDelegate.inventOrg.products[indexPath.row]
         self.navigationController?.pushViewController(vc, animated: true) */
        
       // let vc = ProductDetailViewController()
   
       // vc.prodObj = Selectedprod;
       // vc.prodObj = testProdObj;
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        if isFiltering {
        nextViewController.vNewProd =  DataProdArr[indexPath.row]
        nextViewController.pdSup =  String(DataProdArr[indexPath.row].supID)
        }
        else{
            nextViewController.vNewProd =  testNewDataProdArr[indexPath.row]
            nextViewController.pdSup =  String(testNewDataProdArr[indexPath.row].supID)
        }
        self.present(nextViewController, animated:true, completion:nil)
        print("you tapped me")
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            if("Product" == "Product")
            {
                var  prod=EProduct()
                prod = DataProdArr[indexPath.row] as EProduct
                appDelecate.DeleteProdRecord(prod)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
extension AmazonProdViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredprods.count
        }
        
        return NewDataProdArr.count //filteredprods.count
        
        //  count = AppDelegate.inventOrg.products.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let prod: Product
     
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
        }
        if(NewDataProdArr.count>0)
        {
         prod = NewDataProdArr[indexPath.row]
        cell2.prodName.text = prod.vName
        cell2.ProdType.text = "Digital camera: " //+ prod.vType
        cell2.ProdQuant.text = "Left: " + String(prod.vAvailableQuantity)
      //  cell2.ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(prod.catID)).vName
      //  //  cell2.ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(prod.deptID)).vName
     //   cell2.ProdSupID.text = AppDelegate.inventOrg.suppliers.FindProfile(String(prod.supID)).vName
       // cell2.ImageBtn.tag = indexPath.row;
        if(prod.vImageURL != "")
        {  cell2.imageView?.image = UIImage(contentsOfFile: prod.vImageURL )
            
        }
        
        }
        if isFiltering {
           var  DBProds = filteredprods[indexPath.row]
          //  prod = NewDataProdArr[indexPath.row]
           cell2.prodName.text = DBProds.prodName
           cell2.ProdType.text =  DBProds.prodType
           cell2.ProdQuant.text = "Left: " + String(DBProds.prodQuantity)
         //  cell2.ProdCat.text = AppDelegate.inventOrg.categories.FindProfile(String(prod.catID)).vName
         //  //  cell2.ProdDept.text = AppDelegate.inventOrg.departments.FindProfile(String(prod.deptID)).vName
        //   cell2.ProdSupID.text = AppDelegate.inventOrg.suppliers.FindProfile(String(prod.supID)).vName
          // cell2.ImageBtn.tag = indexPath.row;
           if(DBProds.prodImage != nil)
           {  cell2.imageView?.image = UIImage(data: DBProds.prodImage!)
               
           }
         }
        return cell2
        // return cell
        
    }
    
}

extension AmazonProdViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
