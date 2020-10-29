//
//  Supplier.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Cocoa

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
    
  
    
    func fillSupplierForm()->Supplier
    {
        let FN = takeInput("Genric", "Please Enter the Supplier Name")
      //  let LN = takeInput("Genric", "Please Enter Last Name")
        let address = takeInput("Genric", "Please Enter the Address")
      //  let contact = takeInput("Genric", "Please Enter the Phone number")
      //  let email = takeInput("Genric", "Please Enter the Email Address")
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
        let supplier = Supplier(FN, address, email, contact)
        return supplier
    }
    func Add(_ inventObj:Inventory)
    {
        
        let supplier=fillSupplierForm()
        let id:Int = inventObj.suppliers.count + 1
        supplier.vID=id
        inventObj.suppliers.append(supplier);
        print("Supplier Added Successfully.")
        
    }

    func View(_ inventObj:Inventory)
    {
        let SuplId = takeInput("Genric", "Please Enter supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(SuplId))
        {
           let result = inventObj.suppliers.FindProfile(SuplId)
            print(result.toString())
        }
        else{ print("Invalid supplier ID.")}
        
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.suppliers.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
        let SuplId = takeInput("Genric", "Please Enter supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(SuplId))
        {
            let result = inventObj.suppliers.FindProfile(SuplId)
            let index = inventObj.suppliers.firstIndex(of: result)
            inventObj.suppliers.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid supplier ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let SupId = takeInput("Genric", "Please Enter supplier ID")
        
        if(inventObj.suppliers.isUniqueidExist(SupId))
        {
           let result = inventObj.suppliers.FindProfile(SupId)
            let index = inventObj.suppliers.firstIndex(of: result)
            let supllier=fillSupplierForm()
            supllier.vID = result.vID;
            inventObj.suppliers[index!] = supllier
            print("Updated!")
        }
        else{ print("Invalid supplier ID.")}
        
    }
    
    
}

extension Supplier {
    func toString()->String
    {
        let supplier : String = "ID: " + String(self.vID ) + " Name: " + self.vName + " Email: " + self.vEmailID + " Address: " + self.vAddress + " Phone: " + self.vPhone
        return supplier
    }
}
