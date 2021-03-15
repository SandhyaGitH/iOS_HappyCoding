//
//  ProductTableViewController.swift
//  assignment-7
//


import UIKit

class ProductTableViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    let appDelecate = UIApplication.shared.delegate as! AppDelegate
   
    var SelectedItemID:String = ""
    var Selectedprod = EProduct();
    var testProdObj = EProduct();
   var dataScourceArr = [EProduct]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tableview != nil)
        {
            dataScourceArr = appDelecate.fetchProdRecords()
            tableview.delegate = self
        tableview.dataSource = self
            self.navigationItem.rightBarButtonItem = self.editButtonItem
          
        }
        // Do any additional setup after loading the view.
    }

    // MARK: - Table view data source

    func fetchandUpdatetable()
    {
        dataScourceArr = appDelecate.fetchProdRecords()
        tableview.reloadData()
    }
    
    @IBAction func AddItem(_ sender: Any) {
       // var item  = Product()
        var name = "" ; var type = "" ; var Quant = 0 ; var DeptID = 0 ; var SupID = 0; var CatID = 0;
        let alert = UIAlertController(title: "Add " , message: nil, preferredStyle: .alert)
        
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
       
        let action = UIAlertAction(title: "Add", style: .default) { [self] (_) in
               guard  let pName = alert.textFields?.first?.text else { return }
               name = pName
               guard  let pType = alert.textFields?[1].text else { return }
               type = pType
               guard  var pQuant = alert.textFields?[2].text else { return }
               if(pQuant == "") { pQuant = "0"}
               Quant = Int(pQuant)!
               guard  let PDeptID = alert.textFields?[3].text else { return }
               if(PDeptID != "")
               { DeptID = Int(PDeptID)! }
               guard  let pCatID = alert.textFields?[4].text else { return }
               if(pCatID != "")
               { CatID = Int(pCatID)! }
               guard  let pSupID = alert.textFields?[4].text else { return }
               if(pSupID != "")
               {
                  SupID = Int(pSupID)!
                   
               }
           if( self.ValidateProduct(name, type, Quant, DeptID, CatID, SupID))
           {
            appDelecate.insertProdRecord(name, type, Quant, DeptID, CatID, SupID)
               fetchandUpdatetable()
           }
       }
           alert.addAction(action)
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
    @IBAction func EditItem(_ sender: Any) {
        if(SelectedItemID == "")
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Select an Item")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: "Edit " , message: nil, preferredStyle: .alert)
      // let item = Customer()
        let OldCust = Selectedprod
        var name = "" ; var type = "" ; var Quant = "0"; var DeptID = "0"; var SupID = "0"; var CatID = "0";
            alert.addTextField { (TFN) in
                TFN.placeholder = OldCust.prodName
                TFN.text = OldCust.prodName
               // item.vFirstName = OldCust.firstName!
            }
            alert.addTextField { (TLN) in
                TLN.text = OldCust.prodType
               // item.vLastName = OldCust.lastName
            }
            alert.addTextField { (TEmail) in
                TEmail.text = String(OldCust.prodQuantity)
               // item.vAddress = OldCust.address
            }
            alert.addTextField { (TAddress) in
                TAddress.text = String(OldCust.deptID)
                //item.vEmailID = OldCust.emailAddress
            }
            alert.addTextField { (TContact) in
                TContact.text = String(OldCust.supID)
                TContact.keyboardType = UIKeyboardType.numberPad
               // item.vContactDetails = OldCust.vContactDetails
            }
        alert.addTextField { (TContact) in
            TContact.text = String(OldCust.catID)
            TContact.keyboardType = UIKeyboardType.numberPad
           // item.vContactDetails = OldCust.vContactDetails
        }
        
        let action = UIAlertAction(title: "Edit", style: .default) { [self] (_) in
            guard  let Pname = alert.textFields?.first?.text else { return }
            if(Pname != "")
            { name = Pname}
            guard  let PType = alert.textFields?[1].text else { return }
            if(PType != "")
            {   type = PType }
            guard  let PQuant = alert.textFields?[2].text else { return }
            if(PQuant != "")
            {Quant = PQuant}
            guard  let PDeptID = alert.textFields?[3].text else { return }
            if(PDeptID != "")
            {DeptID = PDeptID}
            guard  let PCatID = alert.textFields?[4].text else { return }
            if(PCatID != "")
            {CatID = PCatID}
            guard  let PSupID = alert.textFields?[4].text else { return }
            if(PSupID != "")
            {SupID = PSupID}
            
            if(self.ValidateProduct(name, type,Int(Quant)!, Int(DeptID)!, Int(CatID)!, Int(SupID)!))
            {
            appDelecate.updateProdRecord(OldCust, name, type, Quant, DeptID, CatID,SupID)
           fetchandUpdatetable()
            }
          //  self.tableview.reloadData()
        }
            alert.addAction(action)
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
    
}

extension ProductTableViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        Selectedprod = dataScourceArr[indexPath.row] as EProduct
        SelectedItemID = "1"
    
        print("you tapped me")
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
         
                
             let  prod = dataScourceArr[indexPath.row] as EProduct
            appDelecate.DeleteProdRecord(prod);
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
    
     func ValidateProduct( _ name: String, _ type :String, _ quant :Int, _ deptID :Int, _ catID:Int,_ supID :Int)->Bool{
       
       // let prod = EProduct()
        var result = false;
        
        if(AppDelegate.validateinput(name,type,String(deptID),String(catID),String(supID)))
        {
           
            if(!AppDelegate.inventOrg.departments.isUniqueidExist(String(deptID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
            }
            else if(!AppDelegate.inventOrg.categories.isUniqueidExist(String(catID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Category ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
            }
            else if(!AppDelegate.inventOrg.suppliers.isUniqueidExist(String(supID)))
            {
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
            }
            else{
                result = true;
                //appDelecate.insertProdRecord( name,  type , quant , deptID ,catID,supID)
               // prod.Add(AppDelegate.inventOrg)
                let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
            }
            
            
            
        } else
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
        }
        
        return result;
        
    }
}
extension ProductTableViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = dataScourceArr.count;
    
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductTableViewCell
        //cell.textLabel?.text="helo";
        let fn = dataScourceArr[indexPath.row].prodName
        cell?.prodObj =  dataScourceArr[indexPath.row];
        testProdObj =  dataScourceArr[indexPath.row];
        cell?.prodName?.text = fn
        cell?.ProdType?.text = dataScourceArr[indexPath.row].prodType
        cell?.ProdQuant?.text = "Left: " + String(dataScourceArr[indexPath.row].prodQuantity)
        cell?.ProdDept?.text = String(dataScourceArr[indexPath.row].deptID)
        cell?.ProdSupID?.text = AppDelegate.inventOrg.suppliers.FindProfile(String(dataScourceArr[indexPath.row].supID)).vName //String(dataScourceArr[indexPath.row].supID)
        
        cell?.ImageBtn.tag = indexPath.row;
        if(dataScourceArr[indexPath.row].prodImage != nil)
        {  cell?.imageView?.image = UIImage(data: dataScourceArr[indexPath.row].prodImage!)}
        cell?.ImageBtn.addTarget(self, action:#selector(showPhotoMenu), for: .touchDown)
      //  addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside;
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
    
    @objc func importPicture(sender : UIButton) {
        let vc = ProductImageUploadViewController()
        let id = sender as? UIButton
        Selectedprod = dataScourceArr[id!.tag]
        if(SelectedItemID == "" )
        {
            let alert =  AppDelegate.uiCreation.CreateAlert("Alert","Select an Item")
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
               }))
               present(alert, animated: true)
            return
        }
        vc.prodObj = Selectedprod;
       // vc.prodObj = testProdObj;
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductImageUploadViewController") as! ProductImageUploadViewController
        self.present(nextViewController, animated:true, completion:nil)
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

            appDelecate.saveImage(Selectedprod,data: imageData)
        }
        fetchandUpdatetable()
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
    Selectedprod = dataScourceArr[id!.tag]
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

  
