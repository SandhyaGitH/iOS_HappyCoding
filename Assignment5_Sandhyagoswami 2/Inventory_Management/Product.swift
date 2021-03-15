//
//  Product.swift
//  Inventory_Management
//
//  Created by Sandhya  Goswami on 10/22/20.
//

import Cocoa

class Product: NSObject,Entity {
    var vName:String=""
    var vType:String=""
    var vID:Int = -1
    var vAvailableQuantity:Int = -1
    var vDeptID:Int = -1
    var vSupID:Int = -1
    var vCatID:Int = -1
    var err:Int=0
    //  var inventory: Inventory
    
    
    
    override init() {
        self.vName=""
        self.vType=""
        self.vAvailableQuantity = -1
        self.vDeptID = -1
        self.vSupID = -1
        self.vCatID = -1
        self.vID = -1;
        self.err=0;
        // self.inventory = Inventory();
    }
    
    init(_ pFN:String, _ pType:String, _ pQuantity:Int, _ pDeptID:Int, _ pCatID:Int, _ pSupID:Int) {
        // vID=ID
        //super.init()
        self.vName=pFN
        self.vType=pType
        self.vAvailableQuantity = pQuantity
        self.vDeptID = pDeptID
        self.vSupID = pSupID
        self.vCatID = pCatID
        self.vID = -1;
        self.err=0;
        //  self.inventory = Inventory();
    }
    
    func fillProductForm()->Product
    {
        let FN = takeInput("Genric", "Please Enter Product Name")
        let Type = takeInput("Genric", "Please Enter the Product Type")
        let Quantity = takeInput("Genric", "Please Enter the Quantity")
        let DeptID = takeInput("Genric", "Please Enter the Department ID")
        let CatID = takeInput("Genric", "Please Enter the Category ID")
        let SupID = takeInput("Genric", "Please Enter the Supplier ID")
        let product :Product;
        if(Quantity.isInt==false)
        {
            print("Not a INT value ")
            product  = Product()  ;
            product.err=1;
        }
        else if(DeptID.isInt==false)
        {
            print("Not a INT value ")
            product  = Product()  ;
            product.err=1;
        }
        else  if(SupID.isInt==false)
        {
            print("Not a INT value ")
            product  = Product()  ;
            product.err=1;
        }
        else  if(CatID.isInt==false)
        {
            print("Not a INT value ")
            product  = Product()  ;
            product.err=1;
        }
        
        else{  product = Product(FN, Type, Int(Quantity)!, Int(DeptID)!, Int(CatID)!, Int(SupID)!)
            //product.err=1;
        }
        return product
    }
    func Add(_ inventObj:Inventory)
    {
        
        let product=fillProductForm()
        let id:Int = inventObj.products.count + 1
        product.vID=id
        if(product.err==1)
        {
            return;
        }
        if(!(inventObj.departments.isUniqueidExist(String(product.vDeptID))))
        {
            print("Invalid Department Id") ;return;
        }
        if(!(inventObj.categories.isUniqueidExist(String(product.vCatID))))
        {
            print("Invalid Category Id") ;return;
        }
        if(!(inventObj.suppliers.isUniqueidExist(String(product.vSupID))))
        {
            print("Invalid Supplier Id"); return;
        }
        
        inventObj.products.append(product);
        print("Product Added Successfully.")
        
    }
    
    func View(_ inventObj:Inventory)
    {
        let CustId = takeInput("Genric", "Please Enter product ID")
        
        if(inventObj.customers.isUniqueidExist(CustId))
        {
            let result = inventObj.customers.FindProfile(CustId)
            print(result.toString())
        }
        else{ print("Invalid Customer ID.")}
        
    }
    
    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.products.DisplayAll()
        
    }
    func FindProductBySupID(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter Supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(SupId))
        {
            inventObj.products.FindProductBYSupID(SupId)
        }
        else{ print("Invalid Supplier ID.")}
        //inventObj.products.DisplayAll()
        
    }
    func FindProductByCatID(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter Category ID")
        
        if(inventObj.categories.isUniqueidExist(SupId))
        {
            inventObj.products.FindProductBYSupID(SupId)
        }
        else{ print("Invalid Supplier ID.")}
        //inventObj.products.DisplayAll()
        
    }
    
    func FindProductByProdID(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter Product ID")
        
        if(inventObj.suppliers.isUniqueidExist(SupId))
        {
            inventObj.products.FindProductBYSupID(SupId)
        }
        else{ print("Invalid Supplier ID.")}
        //inventObj.products.DisplayAll()
        
    }
    
    func Delete(_ inventObj:Inventory)
    {
        let prodId = takeInput("Genric", "Please Enter product ID")
        
        if(inventObj.customers.isUniqueidExist(prodId))
        {
            let result = inventObj.products.FindProfile(prodId)
            let index = inventObj.products.firstIndex(of: result)
            inventObj.products.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid product ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let prodId = takeInput("Genric", "Please Enter product ID")
        
        if(inventObj.products.isUniqueidExist(prodId))
        {
            let result = inventObj.products.FindProfile(prodId)
            let index = inventObj.products.firstIndex(of: result)
            let product=fillProductForm()
            product.vID = result.vID;
            if(!(inventObj.departments.isUniqueidExist(String(product.vDeptID))))
            {
                print("Invalid Department Id") ;return;
            }
            if(!(inventObj.categories.isUniqueidExist(String(product.vCatID))))
            {
                print("Invalid Category Id") ;return;
            }
            if(!(inventObj.suppliers.isUniqueidExist(String(product.vSupID))))
            {
                print("Invalid Supplier Id"); return;
            }
            inventObj.products[index!] = product
            print("Updated!")
        }
        else{ print("Invalid product ID.")}
        
    }
    
    
}

extension Product {
    func toString()->String
    {
        let customer : String = String(self.vID ) + " " + self.vType + " "  + String(self.vAvailableQuantity) + " Dep ID: " + String(self.vDeptID) + " Category ID: " + String (self.vCatID) + " Supplier ID: " + String(self.vSupID)
        return customer
    }
}
