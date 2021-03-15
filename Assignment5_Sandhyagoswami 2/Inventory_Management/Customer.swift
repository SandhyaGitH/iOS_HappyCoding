//
//  Customer.swift
//  Inventory_Management
//
//  Created by Sandhya Goswami on 10/22/20.
//

import Cocoa

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
    
  
    
    func fillCustomerForm()->Customer
    {
        let FN = takeInput("Genric", "Please Enter first Name")
        let LN = takeInput("Genric", "Please Enter Last Name")
        let address = takeInput("Genric", "Please Enter the Address")
        let contact = takeInput("Genric", "Please Enter the Contact number")
        let email = takeInput("Genric", "Please Enter the Email Address")
        let custmer=Customer(FN, LN,address, email, contact)
        return custmer
    }
    func Add(_ inventObj:Inventory)
    {
        
        let custmer=fillCustomerForm()
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
        let CustId = takeInput("Genric", "Please Enter customer ID")
        
        if(inventObj.customers.isUniqueidExist(CustId))
        {
            let result = inventObj.customers.FindProfile(CustId)
            let index = inventObj.customers.firstIndex(of: result)
            inventObj.customers.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid Customer ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let CustId = takeInput("Genric", "Please Enter customer ID")
        
        if(inventObj.customers.isUniqueidExist(CustId))
        {
           let result = inventObj.customers.FindProfile(CustId)
            let index = inventObj.customers.firstIndex(of: result)
            let custmer=fillCustomerForm()
            custmer.vID = result.vID;
            inventObj.customers[index!] = custmer
            print("Updated!")
        }
        else{ print("Invalid Customer ID.")}
        
    }
    
    
}

extension Customer {
    func toString()->String
    {
        let customer : String = String(self.vID ) + " " + self.vFirstName + " "  + self.vLastName + " " + self.vEmailID + " " + self.vAddress + " " + self.vContactDetails
        return customer
    }
}
