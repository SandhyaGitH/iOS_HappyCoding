//
//  ProdViewController.swift
//  UsingSB
//
//  Created by Samarth chaturvedi on 11/18/20.
//

import UIKit

class ProdViewController: UIViewController {

    @IBOutlet var prodName:UITextField!
    @IBOutlet var prodType:UITextField!
    @IBOutlet var prodQuant:UITextField!
    @IBOutlet var SupplierID:UITextField!
    @IBOutlet var CategoryID:UITextField!
    @IBOutlet var DepartmentID:UITextField!
    
    @IBOutlet var addProduct:UIButton!
    
    var uiCreation = UICreation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ProdAdd(_ sender: Any) {
        let prod = Product()
        
        
        prod.vName = prodName.text!
        prod.vType = prodType.text!
        let q = prodQuant.text == "" ? "0" : prodQuant.text
        prod.vAvailableQuantity = Int(q!)!
       
        if(AppDelegate.validateinput(prod,DepartmentID.text!,CategoryID.text!,SupplierID.text!))
        {
            
            prod.vDeptID = Int(DepartmentID.text!)!
            prod.vCatID = Int(CategoryID.text!)!
            prod.vSupID = Int(SupplierID.text!)!
            
            if(!AppDelegate.inventOrg.departments.isUniqueidExist(DepartmentID.text!))
            {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!AppDelegate.inventOrg.categories.isUniqueidExist(CategoryID.text!))
            {
                let alert =  uiCreation.CreateAlert("Alert","Category ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!AppDelegate.inventOrg.suppliers.isUniqueidExist(SupplierID.text!))
            {
                let alert =  uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else{
                
                AppDelegate.AddProduct(prod)
               // prod.Add(AppDelegate.inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                present(alert, animated: true)
             //   window?.rootViewController!.present(alert, animated: true, completion: nil)
              //  addSubMenu(sender:sender)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            present(alert, animated: true)
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }

}
