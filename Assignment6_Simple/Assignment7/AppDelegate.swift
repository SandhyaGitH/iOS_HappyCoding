//
//  AppDelegate.swift
//  Assignment7
//
//  Created by Samarth chaturvedi on 11/14/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UITextFieldDelegate {

    

    var productss: [(Int,String,Product,((Product)->Void))]=[]

    var window: UIWindow?
   let uiCreation = UICreation()
    let customer = Customer()
   var callingParent = "";
   var inventOrg = Inventory()
    var products: [Product]=[]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        
         window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            
            window.backgroundColor = UIColor.lightGray
            
            window.rootViewController = UIViewController()
            
            window.makeKeyAndVisible()
    
           /* window = UIWindow(frame: UIScreen.main.bounds)
               let homeViewController = UIViewController()
               homeViewController.view.backgroundColor = UIColor.lightGray
       // var window: UIWindow?
               window!.rootViewController = homeViewController
               window!.makeKeyAndVisible() */
        }
        addMainWindow()
        
        return true
        
    }
    
    func addMainWindow() {
        
        let view:UIView = UIView(frame:(window?.bounds)!)
        
        view.backgroundColor = UIColor.blue
        
        window?.addSubview(view)
        
        let bRect:CGRect = CGRect(x: 100, y: 600, width: 200, height: 40)
        
        var buttn:UIButton = UIButton(frame: bRect)
        
        buttn.setTitle("Close", for: UIControl.State.normal)
        
        buttn.layer.cornerRadius = 20.0
        
        buttn.layer.borderColor = UIColor.yellow.cgColor
        
        buttn.layer.borderWidth = 2.0
        
        buttn.backgroundColor = UIColor.black
        
        buttn.addTarget(self, action:#selector(closeWindow), for: .touchDown)
        
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 200, 200, 40, UIColor.red,UIColor.white ,  "Customer", #selector(menuClick))
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 300, 200, 40, UIColor.green,UIColor.red,  "Supplier", #selector(menuClick))
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 400, 200, 40, UIColor.yellow, UIColor.red, "Department", #selector(menuClick))
        view.addSubview(buttn)
        
        buttn = uiCreation.CreateButton(100, 500, 200, 40, UIColor.white, UIColor.red, "Category", #selector(menuClick))
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 600, 200, 40, UIColor.yellow, UIColor.red, "Product", #selector(menuClick))
        view.addSubview(buttn)
        
        
        
    }
    
    
    @objc func closeWindow(sender : UIButton) {
        
        let parentWin:UIView = sender.superview!;
        
        parentWin.removeFromSuperview()
        
    }
    
    @objc func closeSubmenu(sender : UIButton) {
        
        //  let parentWin:UIView = sender.superview!;
        
        addMainWindow();
        
        
    }
    
    @objc func menuClick(sender : UIButton) {
        
        
        addSubMenu(sender: sender)
        
    }
    
    func addSubMenu(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        
        let bRect:CGRect = CGRect(x: 100, y: 600, width: 200, height: 40)
        
        var buttn:UIButton = UIButton(frame: bRect)
        
        buttn.setTitle("Close", for: UIControl.State.normal)
        
        buttn.layer.cornerRadius = 20.0
        
        buttn.layer.borderColor = UIColor.yellow.cgColor
        
        buttn.layer.borderWidth = 2.0
        
        buttn.backgroundColor = UIColor.black
        
        buttn.addTarget(self, action:#selector(closeSubmenu), for: .touchDown)
        
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 200, 200, 40, UIColor.red,UIColor.white ,  "Add", #selector(Add))
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 300, 200, 40, UIColor.green,UIColor.red,  "Update", #selector(Update))
        view.addSubview(buttn)
        
        buttn  = uiCreation.CreateButton(100, 400, 200, 40, UIColor.yellow, UIColor.red, "Delete", #selector(Delete))
        view.addSubview(buttn)
        
        buttn = uiCreation.CreateButton(100, 500, 200, 40, UIColor.white, UIColor.red, "View All", #selector(ViewAll))
        view.addSubview(buttn)
        
      
        
        
        if(sender.currentTitle == "Customer")
        {callingParent = "Customer"}
        else if(sender.currentTitle == "Supplier")
        {callingParent = "Supplier"}
        else  if(sender.currentTitle == "Department")
        {callingParent = "Department"}
        else if(sender.currentTitle == "Category")
        {callingParent = "Category"}
        else if(sender.currentTitle == "Product")
        {callingParent = "Product"
            buttn = uiCreation.CreateButton(100, 700, 200, 40, UIColor.white, UIColor.red, "Search", #selector(addSearchOptions))
            view.addSubview(buttn)
        }
        
        
        
    }
    
    @objc func  addSearchOptions(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
       var y : Int = 100
       
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID",UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
      //  textID.delegate=self
       // text.text = String(cust.vID)
       // textID.isUserInteractionEnabled=true
        view.addSubview(textID)
        y = y + 50
        
        
        
      var   buttn:UIButton   = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "By ProdID", #selector(SearchByprodID))
        view.addSubview(buttn)
        
        y = y + 50
        view.addSubview(buttn)
        buttn  = uiCreation.CreateButton(100, y, 200, 40, UIColor.green,UIColor.red,  "By SupID", #selector(SearchBySupID))
        view.addSubview(buttn)
        y = y + 50
        buttn  = uiCreation.CreateButton(100, y, 200, 40, UIColor.green,UIColor.red,  "By Cate ID", #selector(SearchByCatID))
        view.addSubview(buttn)
        y = y + 50
        buttn  = uiCreation.CreateButton(100, y, 200, 40, UIColor.green,UIColor.red,  "By Dept ID", #selector(SearchByDeptID))
        view.addSubview(buttn)
        y = y + 200
        let bRect:CGRect = CGRect(x: 100, y: y, width: 200, height: 40)
        
         buttn = UIButton(frame: bRect)
        
        buttn.setTitle("Close", for: UIControl.State.normal)
        
        buttn.layer.cornerRadius = 20.0
        
        buttn.layer.borderColor = UIColor.yellow.cgColor
        
        buttn.layer.borderWidth = 2.0
        
        buttn.backgroundColor = UIColor.black
        
        buttn.addTarget(self, action:#selector(closeWindow), for: .touchDown)
        view.addSubview(buttn)
    }
    @objc func SearchBySupID(sender : UIButton) {
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
                                                    addSearchOptions(sender: sender)   // print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{
            
            let alert =  uiCreation.CreateAlert("Alert","Invalid SupplierID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                addSearchOptions(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
          //  addSubMenu(sender:sender)
        }
        
       // y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, 600, 200, 40, UIColor.green,UIColor.red,  "Close", #selector(closeSubmenu))
        view.addSubview(buttn)
    }
    @objc func SearchByCatID(sender : UIButton) {
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
                    view.addSubview(text)
                    
                }
            } else{
                let alert =  uiCreation.CreateAlert("Alert","Not Found")
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                    addSearchOptions(sender: sender)   // print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Category ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                addSearchOptions(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
       // y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, 600, 200, 40, UIColor.green,UIColor.red,  "Close", #selector(closeSubmenu))
        view.addSubview(buttn)
    }
    
    @objc func SearchByDeptID(sender : UIButton) {
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
                                                    addSearchOptions(sender: sender)   // print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Department ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                addSearchOptions(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
       // y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, 600, 200, 40, UIColor.green,UIColor.red,  "Close", #selector(closeSubmenu))
        view.addSubview(buttn)
        
    }
    
    @objc func SearchByprodID(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        
        view.backgroundColor = UIColor.blue
        
        parentWin.addSubview(view)
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
          //  tekstInput.delegate = self
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.products.isUniqueidExist(userInput[0]))
        {
           let Arr = inventOrg.products.FindProductBYProdID(userInput[0])
          //  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            if(Arr.count>0)
            { var y = 50;
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
                                                    addSearchOptions(sender: sender)   // print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                }}))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
                                
        }
        else{   let alert =  uiCreation.CreateAlert("Alert","Invalid Product ID")
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                addSearchOptions(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
       // y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, 400, 200, 40, UIColor.green,UIColor.red,  "Close", #selector(closeSubmenu))
        view.addSubview(buttn)
      //  addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    
    func takeProdInput(sender : UIButton)
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        let lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Add Product " )
        view.addSubview(lable)
        y = y+50
        var text = uiCreation.CreatTextField(100, y, 200, 40, " Product Name " ,UIKeyboardType.default)
        text.delegate=self
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Product Type ", UIKeyboardType.default)
        text.tag = 2
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Quantity ", UIKeyboardType.numberPad)
        text.tag = 3
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Department ID ", UIKeyboardType.numberPad)
        text.tag = 4
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Category ID " , UIKeyboardType.numberPad)
        text.tag = 5
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Supplier ID " , UIKeyboardType.numberPad)
        text.tag = 6
        view.addSubview(text)
        y = y+100
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(AddProduct))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func takeCustInput(sender : UIButton)
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        let lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Add Customer " )
        view.addSubview(lable)
        y = y+50
        var text = uiCreation.CreatTextField(100, y, 200, 40, " First Name " ,UIKeyboardType.default)
        text.delegate=self
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Last Name ", UIKeyboardType.default)
        text.tag = 2
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Email ", UIKeyboardType.default)
        text.tag = 3
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Address ", UIKeyboardType.default)
        text.tag = 4
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Contact Number " , UIKeyboardType.default)
        text.tag = 5
        view.addSubview(text)
        y = y+100
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(AddCustomer))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func takeCatInput(sender : UIButton)
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        let lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Add Category " )
        view.addSubview(lable)
        
        y = y+50
        var text = uiCreation.CreatTextField(100, y, 200, 40, " Name " ,UIKeyboardType.default)
        text.delegate=self
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Department ID ", UIKeyboardType.default)
        text.tag = 2
        view.addSubview(text)
        y = y+50
        
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(AddCategory))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func takeDeptInput(sender : UIButton)
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        let lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Add Department " )
        view.addSubview(lable)
        y = y+50
        var text = uiCreation.CreatTextField(100, y, 200, 40, " Name " ,UIKeyboardType.default)
        text.delegate=self
        text.tag = 1
        view.addSubview(text)
        y = y+50
        
        
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(AddDepartment))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func takeSuppInput(sender : UIButton)
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        let lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Add Supplier " )
        view.addSubview(lable)
        y = y+50
        var text = uiCreation.CreatTextField(100, y, 200, 40, " Name " ,UIKeyboardType.default)
        text.delegate=self
        text.tag = 1
        view.addSubview(text)
        y = y+50
        
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Email ", UIKeyboardType.default)
        text.tag = 2
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Address ", UIKeyboardType.default)
        text.tag = 3
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Contact Number " , UIKeyboardType.default)
        text.tag = 4
        view.addSubview(text)
        y = y+100
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(AddSupplier))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // inventOrg.nCustomer.vFirstName = textField.text!;
        textField.resignFirstResponder()

           return true
       // return true
    }
    
    
    
    @objc func viewSuppliers(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        if(inventOrg.suppliers.count>0)
        {
            for index in Range(0...inventOrg.suppliers.count-1)
            {  height = height+50
                var text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,inventOrg.suppliers [index].toString())
                print(inventOrg.suppliers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewDepartments(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        if(inventOrg.departments.count>0)
        {
            for index in Range(0...inventOrg.departments.count-1)
            {  height = height+50
                var text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,inventOrg.departments [index].toString())
                //  print(inventOrg.suppliers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewProducts(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        var texts :[String] = []
        if(inventOrg.products.count>0)
        {
            for index in Range(0...inventOrg.products.count-1)
            {  height = height+50
                var text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,inventOrg.products [index].toString())
                view.addSubview(text)
              //  myTableView.addSubview(text)
           
                texts.append(inventOrg.products [index].toString());
              let str = inventOrg.products [index].toString()
                inventOrg.nProduct = inventOrg.products[index]
                
               // productss.append((inventOrg.products[index].vID,str,inventOrg.nProduct,addToOrder(_:)))
            }
        }
        
       // parentWin.addSubview(text)
   
        
       // view.characters=
       let buttn :UIButton = uiCreation.CreateButton(100, 600, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
    //    parentWin.addSubview(buttn)
        
    }
    @objc func CheckOut(sender:UIButton)
    {    let od = Order()
       // inventOrg.nOrder = Order(inventOrg.nOrdertuple,inventOrg)
       // od.CreatenewOrder(inventOrg.nOrdertuple,inventOrg)
       // inventOrg.orders.append(inventOrg.nOrder)
        inventOrg.nOrder.OrderID = od.CreatenewOrder(inventOrg.nOrdertuple,inventOrg)
      //  viewMyOrder(sender:sender);
        
    }
 //   setCompletionBlock(_ block: (@escaping () -> Void)?)
    func addToOrder (_ newProduct:Product)->Void
    {
        var quant = 1;
        
        if( inventOrg.ProdsForOrder.isUniqueidExist(String(newProduct.vID)))
        {
           // quant = quant+1;
            
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
        
        
       let alert =  uiCreation.CreateAlert("Alert","Added to Cart")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
    }
  /*  @objc func viewMyOrder(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        if(inventOrg.orders.count>0)
        {
            for index in Range(0...inventOrg.orders.count-1)
            {
                
                
                if(inventOrg.orders[index].OrderID == inventOrg.nOrder.OrderID)
                {
                    for i in Range(0...inventOrg.orders[index].Orderedproducts.count-1)
                    {
                        height = height+80
                        let prod:Product = inventOrg.orders[index].Orderedproducts[i].prod;
                       
                        var Sup = Supplier();
                        Sup = inventOrg.suppliers.FindProfile(String(inventOrg.orders[index].Orderedproducts[i].prod.vSupID));
                        var detail:String = " Product Details: " + prod.toStringForOrder() + " Quantity: " + String(inventOrg.orders[index].Orderedproducts[i].Quantity)
                         + " Supplier: "  + Sup.toString()
                    let text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,detail)
                    // print(inventOrg.suppliers[index].toString())
                    //text.tag = 1
                    view.addSubview(text)
                    }
                }
                
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    } */
    @objc func viewCategories(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var height = 100
        if(inventOrg.categories.count>0)
        {
            for index in Range(0...inventOrg.categories.count-1)
            {  height = height+50
                var text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,inventOrg.categories [index].toString())
                // print(inventOrg.suppliers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewCustomers(sender : UIButton) {
       let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.lightGray
       parentWin.addSubview(view)
       // myView.
      //  view= UIView(frame:(parentWin.bounds))
      //  view.backgroundColor = UIColor.blue
      
        var height = 100
        if(inventOrg.customers.count>0)
        {
            for index in Range(0...inventOrg.customers.count-1)
            {  height = height+50
                var text : UITextView = uiCreation.CreatTextView(50, height, 300, 50,inventOrg.customers[index].toString())
                print(inventOrg.customers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        let buttn :UIButton = uiCreation.CreateButton(100, height+100, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    
    @objc func viewSupforUpdate(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.suppliers.count>0)
        {
            for index in Range(0...inventOrg.suppliers.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.suppliers[index].toString())
                print(inventOrg.suppliers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Update", #selector(pickSupplier))
        view.addSubview(buttn)
        y = y+100
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewProdforUpdate(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.products.count>0)
        {
            for index in Range(0...inventOrg.products.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.products[index].toString())
                print(inventOrg.products[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Update", #selector(pickProduct))
        view.addSubview(buttn)
        y = y+100
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewCatforUpdate(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.categories.count>0)
        {
            for index in Range(0...inventOrg.categories.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.categories[index].toString())
                print(inventOrg.categories[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Update", #selector(pickCategory))
        view.addSubview(buttn)
        y = y+100
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewDeptforUpdate(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.departments.count>0)
        {
            for index in Range(0...inventOrg.departments.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.departments[index].toString())
                print(inventOrg.departments[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Update", #selector(pickdepartment))
        view.addSubview(buttn)
        y = y+100
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    @objc func viewCustomersforUpdate(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.customers.count>0)
        {
            for index in Range(0...inventOrg.customers.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.customers[index].toString())
                print(inventOrg.customers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Update", #selector(pickCustomer))
        view.addSubview(buttn)
        y = y+100
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
    }
    
    @objc func pickCustomer(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.customers.isUniqueidExist(userInput[0]))
        {
            let cust:Customer = inventOrg.customers.FindProfile(userInput[0])
            takeCustInput(sender: sender, cust)
            
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            
            
            
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func pickSupplier(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.suppliers.isUniqueidExist(userInput[0]))
        {
            let sup:Supplier = inventOrg.suppliers.FindProfile(userInput[0])
            takeSupInput( sender: sender,sup)
            
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            
            
            
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func pickdepartment(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.departments.isUniqueidExist(userInput[0]))
        {
            let dept:Department = inventOrg.departments.FindProfile(userInput[0])
            takeDeptInput( sender: sender,dept)
            
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            
            
            
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    @objc func pickCategory(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.categories.isUniqueidExist(userInput[0]))
        {
            let cat:Category = inventOrg.categories.FindProfile(userInput[0])
            takeCatInput( sender: sender,cat)
            
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            
            
            
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func pickProduct(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.products.isUniqueidExist(userInput[0]))
        {
            let prod:Product = inventOrg.products.FindProfile(userInput[0])
            takeProdInput( sender: sender,prod)
            
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            
            
            
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func takeCustInput(sender : UIButton, _ cust:Customer )
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        var lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Update Customer : " )
        view.addSubview(lable)
        //  y = y+50
        /* lable = uiCreation.Creatlable(250, y, 200, 40, "\(cust.vID)" )
         lable.tag = 0
         view.addSubview(lable) */
        y = y+50
        
        var text = uiCreation.CreatTextField(100, y, 200, 40, "\(cust.vID)",UIKeyboardType.default)
        text.delegate=self
        text.text = String(cust.vID)
        text.isUserInteractionEnabled=false
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100, y, 200, 40, " First Name " ,UIKeyboardType.default)
        text.delegate=self
        text.text = cust.vFirstName
        text.tag = 2
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Last Name ", UIKeyboardType.default)
        text.tag = 3
        text.text = cust.vLastName
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Email ", UIKeyboardType.default)
        text.tag = 4
        text.text = cust.vEmailID
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Address ", UIKeyboardType.default)
        text.tag = 5
        text.text = cust.vAddress
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Contact Number " , UIKeyboardType.numberPad)
        text.tag = 6
        text.text = cust.vContactDetails
        view.addSubview(text)
        y = y+100
        
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(UpdateCustomer))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    
    func takeSupInput(sender : UIButton, _ pSup:Supplier )
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        var lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Update Supplier : " )
        view.addSubview(lable)
        //  y = y+50
        /* lable = uiCreation.Creatlable(250, y, 200, 40, "\(cust.vID)" )
         lable.tag = 0
         view.addSubview(lable) */
        y = y+50
        
        var text = uiCreation.CreatTextField(100, y, 200, 40, "\(pSup.vID)",UIKeyboardType.default)
        text.delegate=self
        text.text = String(pSup.vID)
        text.isUserInteractionEnabled=false
        text.tag = 1
        view.addSubview(text)
        y = y+50
        
        text = uiCreation.CreatTextField(100,  y, 200, 40, "  Name ", UIKeyboardType.default)
        text.tag = 2
        text.text = pSup.vName
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Email ", UIKeyboardType.default)
        text.tag = 3
        text.text = pSup.vEmailID
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Address ", UIKeyboardType.default)
        text.tag = 4
        text.text = pSup.vAddress
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Contact Number " , UIKeyboardType.numberPad)
        text.tag = 5
        text.text = pSup.vPhone
        view.addSubview(text)
        y = y+100
        
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(UpdateSupplier))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    
    func takeProdInput(sender : UIButton, _ pProd:Product )
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        var lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Update Product : " )
        view.addSubview(lable)
        //  y = y+50
        /* lable = uiCreation.Creatlable(250, y, 200, 40, "\(cust.vID)" )
         lable.tag = 0
         view.addSubview(lable) */
        y = y+50
        
        var text = uiCreation.CreatTextField(100, y, 200, 40, "\(pProd.vID)",UIKeyboardType.default)
        text.delegate=self
        text.text = String(pProd.vID)
        text.isUserInteractionEnabled=false
        text.tag = 1
        view.addSubview(text)
        y = y+50
        
        text = uiCreation.CreatTextField(100,  y, 200, 40, "  Name ", UIKeyboardType.default)
        text.tag = 2
        text.text = pProd.vName
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Type ", UIKeyboardType.default)
        text.tag = 3
        text.text = pProd.vType
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Quantity ", UIKeyboardType.default)
        text.tag = 4
        text.text = String(pProd.vAvailableQuantity)
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Department ID  " , UIKeyboardType.numberPad)
        text.tag = 5
        text.text = String(pProd.vDeptID)
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Category ID  " , UIKeyboardType.numberPad)
        text.tag = 6
        text.text = String(pProd.vCatID)
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100,  y, 200, 40, " Supplier ID  " , UIKeyboardType.numberPad)
        text.tag = 7
        text.text = String(pProd.vSupID)
        view.addSubview(text)
        y = y+100
        
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(UpdateProduct))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    
    func takeDeptInput(sender : UIButton, _ dept:Department )
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        var lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Update Department : " )
        view.addSubview(lable)
        //  y = y+50
        /* lable = uiCreation.Creatlable(250, y, 200, 40, "\(cust.vID)" )
         lable.tag = 0
         view.addSubview(lable) */
        y = y+50
        
        var text = uiCreation.CreatTextField(100, y, 200, 40, "\(dept.vID)",UIKeyboardType.default)
        text.delegate=self
        text.text = String(dept.vID)
        text.isUserInteractionEnabled=false
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100, y, 200, 40, " Department Name " ,UIKeyboardType.default)
        text.delegate=self
        text.text = dept.vName
        text.tag = 2
        view.addSubview(text)
        
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(UpdateDepartment))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    func takeCatInput(sender : UIButton, _ cat:Category )
    {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 50
        var lable:UILabel = uiCreation.Creatlable(50, y, 200, 40, " Update Category : " )
        view.addSubview(lable)
        //  y = y+50
        /* lable = uiCreation.Creatlable(250, y, 200, 40, "\(cust.vID)" )
         lable.tag = 0
         view.addSubview(lable) */
        y = y+50
        
        var text = uiCreation.CreatTextField(100, y, 200, 40, "\(cat.vID)",UIKeyboardType.default)
        text.delegate=self
        text.text = String(cat.vID)
        text.isUserInteractionEnabled=false
        text.tag = 1
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100, y, 200, 40, " Category Name " ,UIKeyboardType.default)
        text.delegate=self
        text.text = cat.vName
        text.tag = 2
        view.addSubview(text)
        y = y+50
        text = uiCreation.CreatTextField(100, y, 200, 40, " Department ID " ,UIKeyboardType.default)
        text.delegate=self
        text.text = String(cat.vDeptID)
        y = y+100
        text.tag = 3
        view.addSubview(text)
        var buttn:UIButton =  uiCreation.CreateButton(100,  y, 200, 40, UIColor.white, UIColor.red, "Submit", #selector(UpdateCategory))
        view.addSubview(buttn)
        y = y+50
        buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        view.addSubview(buttn)
        
        
    }
    
    @objc func UpdateCustomer(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        // print(parentWin.superview!.viewWithTag(0))
        
        while a < 7 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let Cust = Customer()
        
        inventOrg.nCustomer.vID = Int(userInput[0])!
        inventOrg.nCustomer.vFirstName = userInput[1]
        inventOrg.nCustomer.vLastName = userInput[2]
        inventOrg.nCustomer.vEmailID = userInput[3]
        inventOrg.nCustomer.vAddress = userInput[4]
        inventOrg.nCustomer.vContactDetails = userInput[5]
        if(validateinput(inventOrg.nCustomer))
        {
            if(inventOrg.nCustomer.vEmailID.validateEmailId())
            {
                if(inventOrg.nCustomer.vContactDetails.validaPhoneNumber())
                {
                    Cust.Update(inventOrg)
                    let alert =  uiCreation.CreateAlert("Alert","Updated Successfully")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                    alert.addAction(UIAlertAction(title: "update More", style: .default, handler: { [self] action in
                                                    switch action.style{
                                                    case .default:
                                                        viewCustomersforUpdate(sender: sender)   // print("default")
                                                    
                                                    case .cancel:
                                                        print("cancel")
                                                        
                                                    case .destructive:
                                                        print("destructive")
                                                        
                                                        
                                                    }}))
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                    addSubMenu(sender:sender)
                }
                else
                {
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Phone number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    @objc func UpdateSupplier(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        // print(parentWin.superview!.viewWithTag(0))
        
        while a < 7 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let sup = Supplier()
        
        inventOrg.nSupplier.vID = Int(userInput[0])!
        inventOrg.nSupplier.vName = userInput[1]
        //  inventOrg.nSupplier.vLastName = userInput[2]
        inventOrg.nSupplier.vEmailID = userInput[2]
        inventOrg.nSupplier.vAddress = userInput[3]
        inventOrg.nSupplier.vPhone = userInput[4]
        sup.Update(inventOrg)
        let alert =  uiCreation.CreateAlert("Alert","Updated Successfully")
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
        }))
        alert.addAction(UIAlertAction(title: "update More", style: .default, handler: { [self] action in
                                        switch action.style{
                                        case .default:
                                            viewSupforUpdate(sender: sender)   // print("default")
                                        
                                        case .cancel:
                                            print("cancel")
                                            
                                        case .destructive:
                                            print("destructive")
                                            
                                            
                                        }}))
        window?.rootViewController!.present(alert, animated: true, completion: nil)
        addSubMenu(sender:sender)
    }
    
    @objc func UpdateDepartment(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        // print(parentWin.superview!.viewWithTag(0))
        
        while a < 2 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let dept = Department()
        
        inventOrg.nDepartmnet.vID = Int(userInput[0])!
        inventOrg.nDepartmnet.vName = userInput[1]
        
        dept.Update(inventOrg)
        let alert =  uiCreation.CreateAlert("Alert","Updated Successfully")
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
        }))
        alert.addAction(UIAlertAction(title: "update More", style: .default, handler: { [self] action in
                                        switch action.style{
                                        case .default:
                                            viewDeptforUpdate(sender: sender)   // print("default")
                                        
                                        case .cancel:
                                            print("cancel")
                                            
                                        case .destructive:
                                            print("destructive")
                                            
                                            
                                        }}))
        window?.rootViewController!.present(alert, animated: true, completion: nil)
        addSubMenu(sender:sender)
    }
    
    @objc func UpdateCategory(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        // print(parentWin.superview!.viewWithTag(0))
        
        while a < 4 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let cat = Category()
        
        inventOrg.nCategory.vID = Int(userInput[0])!
        inventOrg.nCategory.vName = userInput[1]
        if(validateinput(inventOrg.nCategory, userInput[2]))
        {
            inventOrg.nCategory.vDeptID = Int(userInput[2])!
            
            
            if(inventOrg.departments.isUniqueidExist(userInput[2]))
            {    cat.Update(inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Updated Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                alert.addAction(UIAlertAction(title: "update More", style: .default, handler: { [self] action in
                                                switch action.style{
                                                case .default:
                                                    viewCatforUpdate(sender: sender)   // print("default")
                                                
                                                case .cancel:
                                                    print("cancel")
                                                    
                                                case .destructive:
                                                    print("destructive")
                                                    
                                                    
                                                }}))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
                addSubMenu(sender:sender)
            }
            else {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","Category Name and Department ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func UpdateProduct(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        // print(parentWin.superview!.viewWithTag(0))
        
        while a < 8 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let prod = Product()
        
        inventOrg.nProduct.vID = Int(userInput[0])!
        inventOrg.nProduct.vName = userInput[1]
        inventOrg.nProduct.vType = userInput[2]
        inventOrg.nProduct.vAvailableQuantity = (userInput[3] == "" ? 0 : Int(userInput[3]))!
       
        if(validateinput(inventOrg.nProduct,userInput[4],userInput[5],userInput[6]))
        {
            
                            inventOrg.nProduct.vDeptID = Int(userInput[4])!
                            inventOrg.nProduct.vCatID = Int(userInput[5])!
                            inventOrg.nProduct.vSupID = Int(userInput[6])!
                            
                            if(!inventOrg.departments.isUniqueidExist(userInput[4]))
                            {
                            let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            }))
                            window?.rootViewController!.present(alert, animated: true, completion: nil)
                            }
                            else if(!inventOrg.categories.isUniqueidExist(userInput[5]))
                            {
                            let alert =  uiCreation.CreateAlert("Alert","Category ID Does not exist")
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            }))
                            window?.rootViewController!.present(alert, animated: true, completion: nil)
                            }
                            else if(!inventOrg.suppliers.isUniqueidExist(userInput[6]))
                            {
                            let alert =  uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            }))
                            window?.rootViewController!.present(alert, animated: true, completion: nil)
                            }
                            else{
                            prod.Update(inventOrg)
                            let alert =  uiCreation.CreateAlert("Alert","Updated Successfully")
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            }))
                            alert.addAction(UIAlertAction(title: "update More", style: .default, handler: { [self] action in
                            switch action.style{
                            case .default:
                            viewProdforUpdate(sender: sender)   // print("default")
                            
                            case .cancel:
                            print("cancel")
                            
                            case .destructive:
                            print("destructive")
                            
                            
                            }}))
                            window?.rootViewController!.present(alert, animated: true, completion: nil)
                            addSubMenu(sender:sender)
                            }
                            
                            
                            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
        
        
        
        
    }
    
    @objc func AddDepartment(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        
        
        
        while a < 6 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let Dept = Department()
        
        
        inventOrg.nDepartmnet.vName = userInput[0]
        
        if(validateinput(inventOrg.nDepartmnet))
        {
            Dept.Add(inventOrg)
            let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    @objc func AddCustomer(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        
        
        
        while a < 6 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let Cust = Customer()
        
        
        inventOrg.nCustomer.vFirstName = userInput[0]
        inventOrg.nCustomer.vLastName = userInput[1]
        inventOrg.nCustomer.vEmailID = userInput[2]
        inventOrg.nCustomer.vAddress = userInput[3]
        inventOrg.nCustomer.vContactDetails = userInput[4]
        if(validateinput(inventOrg.nCustomer))
        {
            if(inventOrg.nCustomer.vEmailID.validateEmailId())
            {
                if(inventOrg.nCustomer.vContactDetails.validaPhoneNumber())
                {
                    Cust.Add(inventOrg)
                    let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                    addSubMenu(sender:sender)
                }
                else
                {
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Phone number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func AddSupplier(sender : UIButton) {
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
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                    addSubMenu(sender:sender)
                }
                else
                {
                    let alert =  uiCreation.CreateAlert("Alert","Invalid Phone number")
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                    }))
                    window?.rootViewController!.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert =  uiCreation.CreateAlert("Alert","Invalid Email Address")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert","First Name and Email can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func AddCategory(sender : UIButton) {
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
        
        if(!userInput[1].isInt)
        {
            let alert =  uiCreation.CreateAlert("Alert","not valid input type(Dept ID)")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
            return;
        }
        if(validateinput(inventOrg.nCategory, userInput[1]))
        {           inventOrg.nCategory.vDeptID = Int(userInput[1])!
            
            if(inventOrg.departments.isUniqueidExist(userInput[1]))
            {  cat.Add(inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert =  uiCreation.CreateAlert("Alert","Category Name and Department ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func AddProduct(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        var a = 1
        var userInput: [String] = Array()
        
        
        
        while a < 7 {
            if let myTextField = parentWin.viewWithTag(a) as? UITextField {
                let tekstInput = myTextField.text
                userInput.insert(tekstInput!, at: a-1)
            }
            a = a + 1
        }
        let prod = Product()
        
        
        inventOrg.nProduct.vName = userInput[0]
        inventOrg.nProduct.vType = userInput[1]
        inventOrg.nProduct.vAvailableQuantity = (userInput[2] == "" ? 0 : Int(userInput[2]))!
       
        if(validateinput(inventOrg.nProduct,userInput[3],userInput[4],userInput[5]))
        {
            
            inventOrg.nProduct.vDeptID = Int(userInput[3])!
            inventOrg.nProduct.vCatID = Int(userInput[4])!
            inventOrg.nProduct.vSupID = Int(userInput[5])!
            
            if(!inventOrg.departments.isUniqueidExist(userInput[3]))
            {
                let alert =  uiCreation.CreateAlert("Alert","Department ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!inventOrg.categories.isUniqueidExist(userInput[4]))
            {
                let alert =  uiCreation.CreateAlert("Alert","Category ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else if(!inventOrg.suppliers.isUniqueidExist(userInput[5]))
            {
                let alert =  uiCreation.CreateAlert("Alert","Supplier ID Does not exist")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
            }
            else{
                prod.Add(inventOrg)
                let alert =  uiCreation.CreateAlert("Alert","Saved Successfully")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                }))
                window?.rootViewController!.present(alert, animated: true, completion: nil)
                addSubMenu(sender:sender)
            }
            
            
            
        } else
        {
            let alert =  uiCreation.CreateAlert("Alert"," Name , DeptID, Category ID and Sup ID can't be empty")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func validateinput(_ pCustomer : Customer)->Bool
    {   var result = true;
        if( pCustomer.vFirstName == "" || pCustomer.vEmailID == "" )
        {
            result = false
        }
        
        return result;
    }
    
    func validateinput(_ pSupplier : Supplier)->Bool
    {   var result = true;
        if( pSupplier.vName == "" || pSupplier.vEmailID == "" )
        {
            result = false
        }
        
        return result;
    }
    func validateinput(_ pDepartment: Department)->Bool
    {   var result = true;
        if( pDepartment.vName == "" )
        {
            result = false
        }
        
        return result;
    }
    
    func validateinput(_ pCategory: Category, _ DeptID: String)->Bool
    {   var result = true;
        if( pCategory.vName == "" || DeptID == "")
        {
            result = false
        }
        
        return result;
    }
    func validateinput(_ pProduct: Product, _ DeptID: String , _ CatID: String , _ SupID: String)->Bool
    {   var result = true;
        if( pProduct.vName == "" || DeptID == "" || CatID == "" || SupID == "")
        {
            result = false
        }
        
        return result;
    }
    
    func validateinput(_ pProduct: Product)->Bool
    {   var result = true;
        if( pProduct.vName == "" )
        {
            result = false
        }
        
        return result;
    }
    @objc func ValidatePho(_ textField: UITextField) {
        /* if textField.text?.characters.count == 1 {
         if textField.text?.characters.first == " " {
         textField.text = ""
         return
         }
         }
         guard
         let habit = habitNameField.text, !habit.isEmpty,
         let goal = goalField.text, !goal.isEmpty,
         let frequency = frequencyField.text, !frequency.isEmpty
         else {
         doneBarButton.isEnabled = false
         return
         }
         doneBarButton.isEnabled = true */
    }
    
    @objc func Add(sender : UIButton) {
        if(callingParent == "Customer")
        {
            inventOrg.nCustomer = Customer()
            takeCustInput(sender: sender)
            
        }
        else if(callingParent == "Supplier")
        {
            inventOrg.nSupplier = Supplier()
            takeSuppInput(sender: sender)
        }
        else  if(callingParent == "Department")
        {
            inventOrg.nDepartmnet = Department()
            takeDeptInput(sender: sender)
        }
        else if(callingParent == "Category")
        {
            inventOrg.nCategory = Category()
            takeCatInput(sender: sender)
        }
        else if(callingParent == "Product")
        {
            inventOrg.nProduct = Product()
            takeProdInput(sender: sender)
        }
        
        
        
        
        
    }
    @objc func Update(sender : UIButton) {
        if(callingParent == "Customer")
        {
            inventOrg.nCustomer = Customer()
            viewCustomersforUpdate(sender: sender)
            
        }
        else if(callingParent == "Supplier")
        {
            inventOrg.nSupplier = Supplier()
            viewSupforUpdate(sender: sender)
        }
        else  if(callingParent == "Department")
        {
            inventOrg.nDepartmnet = Department()
            viewDeptforUpdate(sender: sender)
        }
        else if(callingParent == "Category")
        {
            inventOrg.nCategory = Category()
            viewCatforUpdate(sender: sender)
            
        }
        else if(callingParent == "Product")
        {
            inventOrg.nProduct = Product()
            viewProdforUpdate(sender: sender)
            
        }
        
        
    }
    
    @objc func Delete(sender : UIButton) {
        if(callingParent == "Customer")
        {
            inventOrg.nCustomer = Customer()
            viewCustomersforDelete(sender: sender)
        }
        else if(callingParent == "Supplier")
        {
            inventOrg.nSupplier = Supplier()
            viewSupplierforDelete(sender: sender)
        }
        else  if(callingParent == "Department")
        {
            inventOrg.nDepartmnet = Department()
            viewDepartmentforDelete(sender: sender)
        }
        else if(callingParent == "Category")
        {
            inventOrg.nCategory = Category()
            viewCategoryforDelete(sender: sender)
            // pickCategoryandDelete(sender: sender)
        }
        else if(callingParent == "Product")
        {
            inventOrg.nProduct = Product()
            viewProductforDelete(sender: sender)
            // pickCategoryandDelete(sender: sender)
        }
        
    }
    
    @objc func ViewAll(sender : UIButton) {
        if(callingParent == "Customer")
        {
            //print("C")
            viewCustomers(sender: sender)
            
        }
        else if(callingParent == "Supplier")
        {
            viewSuppliers(sender: sender)
            
        }
        else  if(callingParent == "Department")
        {
            viewDepartments(sender: sender)
            
        }
        else if(callingParent == "Category")
        {
            viewCategories(sender: sender)
            
        }
        else if(callingParent == "Product")
        {
            viewProducts(sender: sender)
            
        }
        
        
        
        
    }
    
    @objc func viewCustomersforDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.customers.count>0)
        {
            for index in Range(0...inventOrg.customers.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.customers[index].toString())
                print(inventOrg.customers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "pick", #selector(pickCustomerandDelete))
        view.addSubview(buttn)
        y = y+100
        // buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        //  view.addSubview(buttn)
        
    }
    
    @objc func viewSupplierforDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.suppliers.count>0)
        {
            for index in Range(0...inventOrg.suppliers.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.suppliers[index].toString())
                print(inventOrg.suppliers[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "pick", #selector(pickSupplierandDelete))
        view.addSubview(buttn)
        y = y+100
        // buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        //  view.addSubview(buttn)
        
    }
    
    @objc func viewDepartmentforDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.departments.count>0)
        {
            for index in Range(0...inventOrg.departments.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.departments[index].toString())
                print(inventOrg.departments[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "pick", #selector(pickDepartmentandDelete))
        view.addSubview(buttn)
        y = y+100
        // buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        //  view.addSubview(buttn)
        
    }
    @objc func viewCategoryforDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.categories.count>0)
        {
            for index in Range(0...inventOrg.categories.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.categories[index].toString())
                print(inventOrg.categories[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "pick", #selector(pickCategoryandDelete))
        view.addSubview(buttn)
        y = y+100
        // buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        //  view.addSubview(buttn)
        
    }
    @objc func viewProductforDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let view:UIView = UIView(frame:(parentWin.bounds))
        view.backgroundColor = UIColor.blue
        parentWin.addSubview(view)
        var y = 100
        if(inventOrg.products.count>0)
        {
            for index in Range(0...inventOrg.products.count-1)
            {  y = y+50
                var text : UITextView = uiCreation.CreatTextView(50, y, 300, 50,inventOrg.products[index].toString())
                print(inventOrg.products[index].toString())
                //text.tag = 1
                view.addSubview(text)
                
            }
        }
        y = y+100
        let textID :UITextField = uiCreation.CreatTextField(100, y, 200, 40, "Please Enter ID", UIKeyboardType.numberPad)
        textID.tag=1
        textID.delegate=self
        view.addSubview(textID)
        y = y + 50
        var buttn :UIButton = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "pick", #selector(pickProductandDelete))
        view.addSubview(buttn)
        y = y+100
        // buttn = uiCreation.CreateButton(100, y, 200, 40, UIColor.red,UIColor.white ,  "Close", #selector(closeWindow))
        //  view.addSubview(buttn)
        
    }
    
    
    @objc func pickCustomerandDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.customers.isUniqueidExist(userInput[0]))
        {  inventOrg.nCustomer = inventOrg.customers.FindProfile(userInput[0])
            let custobj = Customer()
            custobj.Delete(inventOrg)
            
            let alert =  uiCreation.CreateAlert("Alert","Deleted Successfully")
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                closeWindow(sender: sender)
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            alert.addAction(UIAlertAction(title: "Delete More", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                viewCustomersforDelete(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    @objc func pickCategoryandDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.categories.isUniqueidExist(userInput[0]))
        {  inventOrg.nCategory = inventOrg.categories.FindProfile(userInput[0])
            let Catbj = Category()
            Catbj.Delete(inventOrg)
          //  DeleteDepartment(
            let alert =  uiCreation.CreateAlert("Alert","Deleted Successfully")
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                closeWindow(sender: sender)
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            alert.addAction(UIAlertAction(title: "Delete More", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                viewCategoryforDelete(sender:  sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    
    func DeleteDependentCatgory(_ DeptID:String){
        
        let cats = inventOrg.categories.FindCategoryBYDeptID(DeptID)
        if(cats.count>0)
        {
            for index in Range(0...cats.count-1)
            {  let catid = String(cats[index].vID)
                if(inventOrg.categories.isUniqueidExist(catid))
                {  inventOrg.nCategory = inventOrg.categories.FindProfile(catid)
                    let Catbj = Category()
                    Catbj.Delete(inventOrg)
                }
            }
        
        }
    }
    
    @objc func pickDepartmentandDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.departments.isUniqueidExist(userInput[0]))
        {  inventOrg.nDepartmnet = inventOrg.departments.FindProfile(userInput[0])
            let Departobj = Department()
            Departobj.Delete(inventOrg)
            DeleteDependentCatgory(String(inventOrg.nDepartmnet.vID))
            let alert =  uiCreation.CreateAlert("Alert","Deleted Successfully")
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                closeWindow(sender: sender)
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            alert.addAction(UIAlertAction(title: "Delete More", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                viewDepartmentforDelete(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    func DeleteDepartment(_ deptID: String){
        if(inventOrg.departments.isUniqueidExist(deptID))
        {  inventOrg.nDepartmnet = inventOrg.departments.FindProfile(deptID)
            let Departobj = Department()
            Departobj.Delete(inventOrg)
            
           
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Department has already been deleted")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
    }
    @objc func pickSupplierandDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.suppliers.isUniqueidExist(userInput[0]))
        {  inventOrg.nSupplier = inventOrg.suppliers.FindProfile(userInput[0])
            let supObj = Supplier()
            supObj.Delete(inventOrg)
            
            let alert =  uiCreation.CreateAlert("Alert","Deleted Successfully")
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                closeWindow(sender: sender)
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            alert.addAction(UIAlertAction(title: "Delete More", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                viewSupplierforDelete(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
        
        
        
        //self.present(alert, animated: true, completion: nil)
    }
    @objc func pickProductandBuy(sender : UIButton) {}
    
    @objc func pickProductandDelete(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        let a = 1
        var userInput: [String] = Array()
        
        if let myTextField = parentWin.viewWithTag(a) as? UITextField {
            let tekstInput = myTextField.text
            userInput.insert(tekstInput!, at: a-1)
        }
        if(inventOrg.products.isUniqueidExist(userInput[0]))
        {  inventOrg.nProduct = inventOrg.products.FindProfile(String(userInput[0]))
            let prodObj = Product()
            prodObj.Delete(inventOrg)
            
            let alert =  uiCreation.CreateAlert("Alert","Deleted Successfully")
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                closeWindow(sender: sender)
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            alert.addAction(UIAlertAction(title: "Delete More", style: .default, handler: { [self] action in
                                            switch action.style{
                                            case .default:
                                                viewProductforDelete(sender: sender)   // print("default")
                                            
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            }}))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        else{  let alert =  uiCreation.CreateAlert("Alert","Record does not exit")
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self] action in
                
            }))
            window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
        addSubMenu(sender: sender)
        // takeCustInput(sender: sender, cust)
       
        
        
        //self.present(alert, animated: true, completion: nil)
    }
  
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

