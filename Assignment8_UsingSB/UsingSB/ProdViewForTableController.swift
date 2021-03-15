//
//  ProdViewForTableController.swift
//  UsingSB


import UIKit

class ProdViewForTableController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {

  
    @IBOutlet weak var AddBtn: UIBarButtonItem!
    var selectedProd = Product()
    var SelectedItemID:String = ""
    var callingParent:String?
    @IBOutlet weak var EditBtn: UIBarButtonItem!
    @IBOutlet var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        { tableview.delegate = self
        tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
       
     
    }
   
    func AddItem(_ Pprod :Product)
   {
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
    
    @IBAction func AddAction(_ sender: Any) {
        let alert = UIAlertController(title: "Add" , message: nil, preferredStyle: .alert)
        var item  = Product()
          
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
        
            alert.addAction(UIAlertAction(title: "Add", style: .default) { (_) in
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
       
                self.AddItem(item)
                self.tableview.reloadData()
        })
            
           // alert.addAction(action)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                  print("cancel")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            present(alert, animated: true)
    }
    @IBAction func EditAction(_ sender: Any) {
        if(SelectedItemID == "")
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Select an Item")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: "Edit " , message: nil, preferredStyle: .alert)
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
    
    
    
    func ValidatenProduct( _ item: Product, _ deptID :Int, _ catID:Int,_ supID :Int)->Bool{
      
      // let prod = EProduct()
       var result = false;
       
        if(AppDelegate.validateinput(item,String(item.vDeptID), String(item.vCatID),String(item.vSupID)))
       {
           if(!AppDelegate.inventOrg.departments.isUniqueidExist(String(deptID)))
           {
               let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Department ID Does not exist")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            result = false;
           }
           else if(!AppDelegate.inventOrg.categories.isUniqueidExist(String(catID)))
           {
               let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Category ID Does not exist")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            result = false;
           }
           else if(!AppDelegate.inventOrg.suppliers.isUniqueidExist(String(supID)))
           {
               let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            result = false;
           }
          else{
             /*  result = true;
               //appDelecate.insertProdRecord( name,  type , quant , deptID ,catID,supID)
              // prod.Add(AppDelegate.inventOrg)
               let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Saved Successfully")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true) */
            result = true;
           }
           
           
           
       } else
       {
           let alert =  AppDelegate.uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
           }))
           present(alert, animated: true)
        result = false;
       }
       
       return result;
       
   }
}
extension ProdViewForTableController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(tableView.cellForRow(at: indexPath)?.textLabel?.text)
        if let calledFrom = callingParent {
            if(calledFrom == "ProdHome")
            {
                SelectedItemID = String(indexPath.row)
                selectedProd = AppDelegate.inventOrg.products[indexPath.row]
                return
            }
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        
        vc?.pdName = AppDelegate.inventOrg.products[indexPath.row].vName
      
        let imagename = String(AppDelegate.inventOrg.products[indexPath.row].vID) + ".jpg"
       // vc?.ProdImage.image = UIImage()
        vc?.pdImage =  UIImage(named: imagename)!
        
      
        vc?.pdQuan  =  String(AppDelegate.inventOrg.products[indexPath.row].vAvailableQuantity)
        let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
           vc?.pdSup = "Supplier : " + supname
        vc?.pdID = AppDelegate.inventOrg.products[indexPath.row].vID
        vc?.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
        vc?.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
        vc?.pdCatd = AppDelegate.inventOrg.products[indexPath.row].vCatID
        vc?.pdType = AppDelegate.inventOrg.products[indexPath.row].vType
        vc?.vNewProd = AppDelegate.inventOrg.products[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
        SelectedItemID = String(indexPath.row)
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
extension ProdViewForTableController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.inventOrg.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell =  cell2 as? CellTableViewCell
        //cell.textLabel?.text="helo";
        
        //cell?.labl = uilable
        cell?.lblName.text = AppDelegate.inventOrg.products[indexPath.row].vName
        cell?.lblQuant.text = "Total Left: " + String(AppDelegate.inventOrg.products[indexPath.row].vAvailableQuantity)
        let supname = AppDelegate.inventOrg.suppliers.FindProfile(String(AppDelegate.inventOrg.products[indexPath.row].vSupID)).vName;
           cell?.lblSupl.text = "Supplier : " + supname
        
        cell?.pdIDd = AppDelegate.inventOrg.products[indexPath.row].vID
        cell?.pdSupd = AppDelegate.inventOrg.products[indexPath.row].vSupID
        cell?.pdCatId = AppDelegate.inventOrg.products[indexPath.row].vCatID
        cell?.pdDepId = AppDelegate.inventOrg.products[indexPath.row].vDeptID
        
        if let calledFrom = callingParent {
            if(calledFrom == "ProdHome")
            {
                cell?.imagebtn.tag = indexPath.row;
                cell?.imagebtn.addTarget(self, action:#selector(showPhotoMenu), for: .touchDown)
                
            }
        }
       if(AppDelegate.inventOrg.products[indexPath.row].prodImage != nil)
        {
           // cell?.imagebtn.tag = indexPath.row;
            cell?.imageView?.image = UIImage(data: AppDelegate.inventOrg.products[indexPath.row].prodImage!)
        
       
        }
        else{
            cell?.imageView?.clipsToBounds = true;//.clipsToBounds = YES;
            let imagename = String(AppDelegate.inventOrg.products[indexPath.row].vID) + ".jpg"
            cell?.imgg.image = UIImage(named: imagename)
            
        }
        
        return cell!;
        
    }
    
    
  
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)
        if(SelectedItemID == "" )
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Select an Item")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            return
        }
        let currentImage = image
        if let imageData = currentImage.pngData() {

            AppDelegate.EditProductImage(selectedProd,imageData)
        }
        tableview.reloadData()
    }
   /* let actPhoto = UIAlertAction(title: "Take Photo",
          style: .default, handler: { _ in
            self.takePhotoWithCamera();
          })
 
    let actLibrary = UIAlertAction(title: "Choose From Library",
          style: .default, handler: { _ in
            self.choosePhotoFromLibrary();
          }) */
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
      }
    func choosePhotoFromLibrary() {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .photoLibrary
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      present(imagePicker, animated: true, completion: nil)
    }
    
  @objc  func showPhotoMenu(sender : UIButton) {
    let id = sender as? UIButton
    selectedProd = AppDelegate.inventOrg.products[id!.tag]
      let alert = UIAlertController(title: nil, message: nil,
                           preferredStyle: .actionSheet)

      let actCancel = UIAlertAction(title: "Cancel", style: .cancel,
                                  handler: nil)
      alert.addAction(actCancel)

      let actPhoto = UIAlertAction(title: "Take Photo",
                                   style: .default, handler: nil)
      alert.addAction(  UIAlertAction(title: "Take Photo",
                                                      style: .default, handler: { _ in
                                                        self.takePhotoWithCamera();
                                                      }))

      let actLibrary = UIAlertAction(title: "Choose From Library",
                                     style: .default, handler: nil)
      alert.addAction(UIAlertAction(title: "Choose From Library",
                                    style: .default, handler: { _ in
                                      self.choosePhotoFromLibrary();
                                    })
      )
        
     present(alert, animated: true, completion: nil)
    }
}

