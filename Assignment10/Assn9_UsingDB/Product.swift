//
//  Product.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class Product: NSObject,Entity, Decodable {
    var vName:String=""
    var vType:String=""
    var vImageURL:String=""

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
    
  
    func Add(_ inventObj:Inventory)
    {
        
       
        
    }
    
    func View(_ inventObj:Inventory)
    {
      
        
    }
    
    func ViewAll(_ inventObj:Inventory)
    {
        
       // inventObj.products.DisplayAll()
        
    }
    func FindProductBySupID(_ inventObj:Inventory)
    {
        
        
    }
    func FindProductByCatID(_ inventObj:Inventory)
    {
       
        
    }
    
    func FindProductByDeptID(_ inventObj:Inventory)
    {
        
        
    }
    
    func FindProductByProdID(_ inventObj:Inventory)
    {
       
        
    }
    
    func Delete(_ inventObj:Inventory)
    {
        
        
    }
    func Update(_ inventObj:Inventory)
    {
        
        
    }
    
    
}

extension Product {
    func toString()->String
    {
        let product : String = " ProdID: " + String(self.vID ) + " Type: " + self.vType + " Quantity: "  + String(self.vAvailableQuantity) + " Dep ID: " + String(self.vDeptID) + " Category ID: " + String (self.vCatID) + " Supplier ID: " + String(self.vSupID)
        return product
    }
    
    func toStringForTable()->String
    {
        let product : String =  String(self.vID ) + ", " + self.vName  + ", " + self.vType + ", "  + String(self.vAvailableQuantity) + ", " + String(self.vDeptID) + ", " + String (self.vCatID) + ", " + String(self.vSupID)
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

