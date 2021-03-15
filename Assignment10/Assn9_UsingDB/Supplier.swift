//
//  Supplier.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class Supplier: NSObject , Entity {
    
    
    
    var vName:String=""
    var vID:Int = -1
    var vAddress:String=""
    var vPhone:String=""
    var vEmailID:String=""
    
    
    override init() {
        self.vName=""
      
        self.vAddress=""
        self.vEmailID=""
        self.vPhone=""
        self.vID = -1;
       // self.inventory = Inventory();
    }
  
    init(_ FN:String,_ Address:String, _ email:String, _ Contact:String) {
       // vID=ID
        //super.init()
        self.vName=FN
       // self.vName=LN
        self.vAddress=Address
        self.vEmailID=email
        self.vPhone=Contact
        self.vID = -1;
      //  self.inventory = Inventory();
    }
    
  
    
   
    func Add(_ inventObj:Inventory)
    {
        
       // let supplier=fillSupplierForm()
     /*   let id:Int = inventObj.suppliers.count + 1
        inventObj.nSupplier.vID=id
        inventObj.suppliers.append(inventObj.nSupplier);
        print("Supplier Added Successfully.")
        */
    }

    func View(_ inventObj:Inventory)
    {
     /*   let SuplId = takeInput("Genric", "Please Enter supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(SuplId))
        {
           let result = inventObj.suppliers.FindProfile(SuplId)
            print(result.toString())
        }
        else{ print("Invalid supplier ID.")}
         */
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.suppliers.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
     /*   let SuplId = inventObj.nSupplier.vID // takeInput("Genric", "Please Enter supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(String(SuplId)))
        {
            let result = inventObj.suppliers.FindProfile(String(SuplId))
            let index = inventObj.suppliers.firstIndex(of: result)
            inventObj.suppliers.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid supplier ID.")}
 */
        
    }
    func Update(_ inventObj:Inventory)
    {
       // let SupId = takeInput("Genric", "Please Enter supplier ID")
     /*   let SupId  = inventObj.nSupplier.vID;
        if(inventObj.suppliers.isUniqueidExist(String(SupId)))
        {
          let result = inventObj.suppliers.FindProfile(String(SupId))
            let index = inventObj.suppliers.firstIndex(of: result)
           // let supllier=fillSupplierForm()
           // supllier.vID = result.vID;
            inventObj.suppliers[index!] = inventObj.nSupplier
            print("Updated!")
        }
        else{ print("Invalid supplier ID.")}
       */
    }
    
    
}

extension Supplier {
    func toString()->String
    {
        let supplier : String = "ID: " + String(self.vID ) + " Name: " + self.vName + " Email: " + self.vEmailID + " Address: " + self.vAddress + " Phone: " + self.vPhone
        return supplier
    }
}
