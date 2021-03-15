//
//  Product.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
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
            print("Not a valid Quantity ")
            product  = Product()  ;
            product.err=1;
        }
        else if(DeptID.isInt==false)
        {
            print("Invalid, DeptId is a Int value ")
            product  = Product()  ;
            product.err=1;
        }
        else  if(SupID.isInt==false)
        {
            print("Invalid, Supplier ID is a Int value")
            product  = Product()  ;
            product.err=1;
        }
        else  if(CatID.isInt==false)
        {
            print("Invalid, Category ID is a Int value")
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
        
        let product = inventObj.nProduct//fillProductForm()
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
        let SupId = inventObj.nSupplier.vID// takeInput("Genric", "Please Enter Supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(String(SupId)))
        {
            inventObj.products.FindProductBYSupID(String(SupId))
        }
        else{ print("Invalid Supplier ID.")}
        //inventObj.products.DisplayAll()
        
    }
    func FindProductByCatID(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter Category ID")
        
        if(inventObj.categories.isUniqueidExist(SupId))
        {
            inventObj.products.FindProductBYCatID(SupId)
        }
        else{ print("Invalid Category ID.")}
        //inventObj.products.DisplayAll()
        
    }
    
    func FindProductByDeptID(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter Department ID")
        
        if(inventObj.departments.isUniqueidExist(SupId))
        {
            inventObj.products.FindProductBYDeptID(SupId)
        }
        else{ print("Invalid Department ID.")}
        //inventObj.products.DisplayAll()
        
    }
    
    func FindProductByProdID(_ inventObj:Inventory)
    {
        let ProdId = takeInput("Genric", "Please Enter Product ID")
        
        if(inventObj.products.isUniqueidExist(ProdId))
        {
            inventObj.products.FindProductBYProdID(ProdId)
        }
        else{ print("Invalid product ID.")}
        //inventObj.products.DisplayAll()
        
    }
    
    func Delete(_ inventObj:Inventory)
    {
        let prodId = inventObj.nProduct.vID// takeInput("Genric", "Please Enter product ID")
        
        if(inventObj.products.isUniqueidExist(String(prodId)))
        {
            let result = inventObj.products.FindProfile(String(prodId))
            let index = inventObj.products.firstIndex(of: result)
            inventObj.products.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid product ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let prodId = inventObj.nProduct.vID//takeInput("Genric", "Please Enter product ID")
        
        if(inventObj.products.isUniqueidExist(String(prodId)))
        {
            let result = inventObj.products.FindProfile(String(prodId))
            let index = inventObj.products.firstIndex(of: result)
           // let product=fillProductForm()
          //  product.vID = result.vID;
            if(!(inventObj.departments.isUniqueidExist(String(inventObj.nProduct.vDeptID))))
            {
                print("Invalid Department Id") ;return;
            }
            if(!(inventObj.categories.isUniqueidExist(String(inventObj.nProduct.vCatID))))
            {
                print("Invalid Category Id") ;return;
            }
            if(!(inventObj.suppliers.isUniqueidExist(String(inventObj.nProduct.vSupID))))
            {
                print("Invalid Supplier Id"); return;
            }
            inventObj.products[index!] = inventObj.nProduct
            print("Updated!")
        }
        else{ print("Invalid product ID.")}
        
    }
    
    
}

extension Product {
    func toString()->String
    {
        let product : String = " ProdID: " + String(self.vID ) + " Name: " + self.vName + " Type: " + self.vType + " Quantity: "  + String(self.vAvailableQuantity) + " Dep ID: " + String(self.vDeptID) + " Category ID: " + String (self.vCatID) + " Supplier ID: " + String(self.vSupID)
        return product
    }
    
    func toStringForOrder()->String
    {
      //  var supplier : Supplier();
        
        let product : String = " prodid " + String(self.vID ) + " " + String(self.vName )
        //Supplier " + String(self.vSupID)
        return product
    }
}

