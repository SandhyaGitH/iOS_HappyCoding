//
//  CustomerC.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class Customer: NSObject, Entity {
   
    
    
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
  
    
    func fillCustomerForm()->Customer
    {
        let FN = takeInput("Genric", "Please Enter first Name")
        let LN = takeInput("Genric", "Please Enter Last Name")
        let address = takeInput("Genric", "Please Enter the Address")
        var contact = " " //takeInput("Genric", "Please Enter the Contact number")
        repeat
        {
            contact = takeInput("Genric", "Please Enter the Contact number")
            if(!contact.validaPhoneNumber())
            {
                print("not a valid Contact number")
                ///contact = takeInput("Genric", "Please Enter the Contact number")
            }
            
        } while(!contact.validaPhoneNumber())
        var email = ""
        repeat
        {
             email = takeInput("Genric", "Please Enter the Email Address")
           if(!email.validateEmailId())
            {
                print("not a valid email address")
                ///contact = takeInput("Genric", "Please Enter the Contact number")
            }
            
        } while(!email.validateEmailId())
       
        
        let custmer=Customer(FN, LN,address, email, contact)
        return custmer
    }
    func Add(_ inventObj:Inventory)
    {
        
       // let custmer=fillCustomerForm()
        let custmer=inventObj.nCustomer
        let id:Int = inventObj.customers.count + 1
        custmer.vID=id
        inventObj.customers.append(custmer);
        print("Customer Added Successfully.")
        
    }

    func View(_ inventObj:Inventory)
    {
        let CustId = takeInput("Genric", "Please Enter customer ID")
        
        if(inventObj.customers.isUniqueidExist(CustId))
        {
           let result = inventObj.customers.FindProfile(CustId)
            print(result.toString())
        }
        else{ print("Invalid Customer ID.")}
        
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.customers.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
        let CustId = inventObj.nCustomer.vID
        
        if(inventObj.customers.isUniqueidExist(String(CustId)))
        {
            let result = inventObj.customers.FindProfile(String(CustId))
            let index = inventObj.customers.firstIndex(of: result)
            inventObj.customers.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid Customer ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
       // let CustId = takeInput("Genric", "Please Enter customer ID")
        
     //   if(inventObj.customers.isUniqueidExist(CustId))
      //  {
        let result = inventObj.customers.FindProfile(String(inventObj.nCustomer.vID))
            let index = inventObj.customers.firstIndex(of: result)
           // let custmer=fillCustomerForm()
           // custmer.vID = result.vID;
        inventObj.customers[index!] = inventObj.nCustomer
            print("Updated!")
      //  }
      //  else{ print("Invalid Customer ID.")}
        
    }
    
    
}

extension Customer {
    func toString()->String
    {
        let customer : String = "Unique ID: " + String(self.vID ) + " FirstName: " + self.vFirstName + " LastName: "  + self.vLastName + " Email: " + self.vEmailID + " Address: " + self.vAddress + " Contact: " + self.vContactDetails
        return customer
    }
}
