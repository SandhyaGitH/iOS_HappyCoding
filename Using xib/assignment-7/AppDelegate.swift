//
//  AppDelegate.swift
//  assignment-7
//
//  Created by Mahak Singh on 11/16/20.
//  Copyright © 2020 Mahak Singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var inventOrg = Inventory();
    static var uiCreation = UICreation();

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    static func AddCustomer(_ cust:Customer) {
        //let parentWin:UIView = sender.superview!;
      
        
        
        inventOrg.nCustomer.vFirstName = cust.vFirstName
        inventOrg.nCustomer.vLastName = cust.vLastName
        inventOrg.nCustomer.vEmailID = cust.vEmailID
        inventOrg.nCustomer.vAddress = cust.vAddress
        inventOrg.nCustomer.vContactDetails = cust.vContactDetails
        if(validateinput(inventOrg.nCustomer))
        {
            if(inventOrg.nCustomer.vEmailID.validateEmailId())
            {
                if(inventOrg.nCustomer.vContactDetails.validaPhoneNumber())
                {
                    let Custmr = Customer()
                    Custmr.Add(inventOrg)
                    let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                   // window?.rootViewController!.present(alert, animated: true, completion: nil)
                   // addSubMenu(sender:sender)
                }
                else
                {
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Phone number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                   // window?.rootViewController!.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
  static  func validateinput(_ pCustomer : Customer)->Bool
    {   var result = true;
        if( pCustomer.vFirstName == "" || pCustomer.vEmailID == "" )
        {
            result = false
        }
        
        return result;
    }
    
  static  func validateinput(_ pSupplier : Supplier)->Bool
    {   var result = true;
        if( pSupplier.vName == "" || pSupplier.vEmailID == "" )
        {
            result = false
        }
        
        return result;
    }
  static  func validateinput(_ pDepartment: Department)->Bool
    {   var result = true;
        if( pDepartment.vName == "" )
        {
            result = false
        }
        
        return result;
    }
    
 static   func validateinput(_ pCategory: Category, _ DeptID: String)->Bool
    {   var result = true;
        if( pCategory.vName == "" || DeptID == "")
        {
            result = false
        }
        
        return result;
    }
 static   func validateinput(_ pProduct: Product, _ DeptID: String , _ CatID: String , _ SupID: String)->Bool
    {   var result = true;
        if( pProduct.vName == "" || DeptID == "" || CatID == "" || SupID == "")
        {
            result = false
        }
        
        return result;
    }
    
 static   func validateinput(_ pProduct: Product)->Bool
    {   var result = true;
        if( pProduct.vName == "" )
        {
            result = false
        }
        
        return result;
    }
   
    
    
    
    
    // Product---
    static func SearchBySupID(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.suppliers.isUniqueidExist(userInput[0]))
        {
           let Arr = inventOrg.products.FindProductBYSupID(userInput[0])
          //  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            if(Arr.count>0)
            { var y = 200;
                for index in Range(0...Arr.count-1)
                {  y = y+50
                    var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,Arr[index].toString())
                   // print(inventOrg.products[index].toString())
                    //text.tag = 1
                    view.addSubview(text)
                    
                }
            } else{
                let alert =  uiCreation.CreateAlert("Alert","Not Found")
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                   // addSearchOptions(sender: sender)
                                                    print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{
            
            let alert =  uiCreation.CreateAlert("Alert","Invalid SupplierID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                              //  addSearchOptions(sender: sender)
                                             print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
          //  addSubMenu(sender:sender)
        }
        
   
    }
    static func SearchByCatID(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.categories.isUniqueidExist(userInput[0]))
        {
           let Arr = inventOrg.products.FindProductBYCatID(userInput[0])
          //  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            if(Arr.count>0)
            { var y = 200;
                for index in Range(0...Arr.count-1)
                {  y = y+50
                    var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,Arr[index].toString())
                   // print(inventOrg.products[index].toString())
                    //text.tag = 1
                   // view.addSubview(text)
                    
                }
            } else{
                let alert =  uiCreation.CreateAlert("Alert","Not Found")
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                   // addSearchOptions(sender: sender)
                                                    print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Category ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                              //  addSearchOptions(sender: sender)
                                            print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
          //  window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
       // y = y + 50
    }
    
    static func SearchByDeptID(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.departments.isUniqueidExist(userInput[0]))
        {
           let Arr = inventOrg.products.FindProductBYDeptID(userInput[0])
          //  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            if(Arr.count>0)
            { var y = 200;
                for index in Range(0...Arr.count-1)
                {  y = y+50
                    var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,Arr[index].toString())
                   // print(inventOrg.products[index].toString())
                    //text.tag = 1
                    view.addSubview(text)
                    
                }
            }
            else{
                let alert =  uiCreation.CreateAlert("Alert","Not Found")
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                    //addSearchOptions(sender: sender)
                                                 print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Department ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                //addSearchOptions(sender: sender)
                                             print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
     
        
    }
    
    static func SearchByprodID(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.products.isUniqueidExist(userInput[0]))
        {
           let Arr = inventOrg.products.FindProductBYProdID(userInput[0])
          //  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            if(Arr.count>0)
            { var y = 200;
                for index in Range(0...Arr.count-1)
                {  y = y+50
                    var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,Arr[index].toString())
                   // print(inventOrg.products[index].toString())
                    //text.tag = 1
                    view.addSubview(text)
                    
                }
            }
            else{
                let alert =  uiCreation.CreateAlert("Alert","Not Found")
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                    //addSearchOptions(sender: sender)
                                                    print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Product ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                             //   addSearchOptions(sender: sender)
                                                print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
     
      //  addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    
    static func AddSupplier(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput1: [String] = Array()
        
        
        
        while a < 5 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput1.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let Sup = Supplier()
        
        
        inventOrg.nSupplier.vName = userInput1[0]
        // inventOrg.nSupplier.vLastName = userInput[1]
        inventOrg.nSupplier.vEmailID = userInput1[1]
        inventOrg.nSupplier.vAddress = userInput1[2]
        inventOrg.nSupplier.vPhone = userInput1[3]
        if(validateinput(inventOrg.nSupplier))
        {
            if(inventOrg.nSupplier.vEmailID.validateEmailId())
            {
                if(inventOrg.nSupplier.vPhone.validaPhoneNumber())
                {
                    Sup.Add(inventOrg)
                    let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                  //  window?.rootViewController!.present(alert, animated: true, completion: nil)
                  //  addSubMenu(sender:sender)
                }
                else
                {
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Phone number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                  //  window?.rootViewController!.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    static func AddCategory(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        
        
        
        while a < 4 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let cat = Category()
        
        
        inventOrg.nCategory.vName = userInput[0]
        
        
        if(validateinput(inventOrg.nCategory, userInput[1]))
        {           inventOrg.nCategory.vDeptID = Int(userInput[1])!
            
            if(inventOrg.departments.isUniqueidExist(userInput[1]))
            {  cat.Add(inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert =  uiCreation.CreateAlert("Alert","Category Name and Department ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    static func AddProduct(_ Pprod:Product){
       
        let prod = Product()
        
        
        inventOrg.nProduct.vName = Pprod.vName
        inventOrg.nProduct.vType = Pprod.vType
        inventOrg.nProduct.vAvailableQuantity = Pprod.vAvailableQuantity
       
        if(validateinput(inventOrg.nProduct,String(Pprod.vDeptID),String(Pprod.vCatID),String(Pprod.vSupID)))
        {
            
            inventOrg.nProduct.vDeptID = Pprod.vDeptID
            inventOrg.nProduct.vCatID = Pprod.vCatID
            inventOrg.nProduct.vSupID = Pprod.vSupID
            
            if(!inventOrg.departments.isUniqueidExist(String(Pprod.vDeptID)))
            {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
               // window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!inventOrg.categories.isUniqueidExist(String(Pprod.vCatID)))
            {
                let alert =  uiCreation.CreateAlert("Alert","Category ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!inventOrg.suppliers.isUniqueidExist(String(Pprod.vSupID)))
            {
                let alert =  uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
              //  window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else{
                prod.Add(inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
             //   window?.rootViewController!.present(alert, animated: true, completion: nil)
              //  addSubMenu(sender:sender)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
           // window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }

    
   static func addToOrder (_ newProduct:Product)->Void
    {
        var quant = 1;
        
        if( inventOrg.ProdsForOrder.isUniqueidExist(String(newProduct.vID)))
        {
           // quant = quant+1;
            var org = Inventory();
            org = inventOrg;
            
            if let idx = inventOrg.nOrdertuple.firstIndex(where: { $0.prod == newProduct }) {
               quant = inventOrg.nOrdertuple[idx].Quantity + 1
                inventOrg.nOrdertuple[idx].Quantity = quant
            }

           // let result = inventObj.customers.FindProfile(String(CustId))
            let index = inventOrg.ProdsForOrder.firstIndex(of: newProduct)
            inventOrg.ProdsForOrder.remove(at: index!)
            inventOrg.ProdsForOrder.append((newProduct))
            
        }
        else{
        inventOrg.nOrdertuple.append((newProduct,quant))
        inventOrg.ProdsForOrder.append(newProduct)
        }
        
        
    /*   let alert =  uiCreation.CreateAlert("Alert","Added to Cart")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil) */
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

