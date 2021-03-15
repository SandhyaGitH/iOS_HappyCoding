//
//  CustomerC.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class Customer: NSObject, Entity {
    func Delete(_ inventObj: Inventory) {
        
    }
    
    func Update(_ inventObj: Inventory) {
        
    }
    
    func ViewAll(_ inventObj: Inventory) {
        
    }
    
   
    
    
    var vFirstName:String=""
    var vLastName:String=""
    var vID:Int = -1
    var vAddress:String=""
    var vContactDetails:String=""
    var vEmailID:String=""
  //  var inventory: Inventory
    
    override init() {
        self.vFirstName=""
        self.vLastName=""
        self.vAddress=""
        self.vEmailID=""
        self.vContactDetails=""
        self.vID = -1;
       // self.inventory = Inventory();
    }
  
    init(_ FN:String,_ LN:String,_ Address:String, _ email:String, _ Contact:String) {
       // vID=ID
        //super.init()
        self.vFirstName=FN
        self.vLastName=LN
        self.vAddress=Address
        self.vEmailID=email
        self.vContactDetails=Contact
        self.vID = -1;
      //  self.inventory = Inventory();
    }
    init(_ ID:Int,_ FN:String,_ LN:String,_ Address:String, _ email:String, _ Contact:String) {
       // vID=ID
        //super.init()
        self.vID = ID
        self.vFirstName=FN
        self.vLastName=LN
        self.vAddress=Address
        self.vEmailID=email
        self.vContactDetails=Contact
       // self.vID = -1;
      //  self.inventory = Inventory();
    }
  
    
   
    func Add(_ inventObj:Inventory)
    {
        
       
      //  let custmer=inventObj.nCustomer
      //  let id:Int = inventObj.customers.count + 1
       // custmer.vID=id
       // inventObj.customers.append(custmer);
        print("Customer Added Successfully.")
        
    }

   

    
    
}

extension Customer {
    func toString()->String
    {
        let customer : String = "Unique ID: " + String(self.vID ) + " FirstName: " + self.vFirstName + " LastName: "  + self.vLastName + " Email: " + self.vEmailID + " Address: " + self.vAddress + " Contact: " + self.vContactDetails
        return customer
    }
    
    func toStringFortable()->String
    {
        let customer : String = String(self.vID ) + " " + self.vFirstName + ", "  + self.vLastName + ", "  + self.vEmailID + ", "  + self.vAddress + ", "  + self.vContactDetails
        return customer
    }
}
