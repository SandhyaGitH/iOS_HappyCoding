//
//  Menu.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/25/20.
//

import Cocoa

class Menu: NSObject {
    var mainMenu:[String]=[]
    var subMenu:[String]=[]
    override init() {
      mainMenu = [
        // "Type -1 for LogOut",
         "Type 0 for Exit",
         "Type 1 for Customers",
         "Type 2 for Suppliers",
         "Type 3 for Products",
         "Type 4 for Departments",
         "Type 5 for Category",
        "Type 7 for Search Product by Supplier ID",
        "Type 8 for Search Product by Department ID",
        "Type 9 for Search Product by product ID",
        "Type 10 for Search Product by category ID"
     ]

      subMenu=[
        // "Type -1 for LogOut",
        "Type 0 for Exit",
         "Type 1 for Add",
         "Type 2 for Update",
         "Type 3 for Delete",
         "Type 4 for View",
       //  "Type 5 for Category"
     ]
    }
    
   
}
extension  Array{
    func  displayAll() {
        
        for item in self
        {
            if(item as? String != nil)
            {
                print(item)// print("yes")
            }
            if(item as? Customer != nil)
            {
                let cust = item as? Customer
                print(cust!.toString())
            }
        }
        
    }
    
    func chooseMenu(_ menuType:String)->String{
        //self.DisplayAll()
        var menuid = ""
        if(menuType.uppercased() == "MAIN")
        { menuid = takeInput("MainMenu", "Please enter the menu Id")}
        else  if(menuType.uppercased() == "SUB")
        { menuid = takeInput("SubMenu", "Please enter the menu Id")}
        return menuid
    }
    func FindProfile(_ id:String)->Element
    {
        var SelectedItem :Element? = nil
        for item in self
        {
            if(item as? Customer != nil)
            {
                let cust = item as? Customer
                if(cust?.vID ==  Int(id))
                    {
                    SelectedItem = cust as! Element
                    return SelectedItem!
                    
                    }
               
               
            }
          else if(item as? Supplier != nil)
            {
                let supl = item as? Supplier
               if(supl?.vID ==  Int(id))
                    {
                    SelectedItem = supl as! Element
                    return SelectedItem!
                    
                    }
               
               
            }
            
          else if(item as? Category != nil)
            {
                let cat = item as? Category
                if(cat?.vID ==  Int(id))
                    {
                    SelectedItem = cat as! Element
                    return SelectedItem!
                    
                    }
               
               
            }
        
        else if(item as? Department != nil)
          {
              let dept = item as? Department
              if(dept?.vID ==  Int(id))
                  {
                  SelectedItem = dept as! Element
                  return SelectedItem!
                  
                  }
             
             
          }
        else if(item as? Product != nil)
          {
              let prod = item as? Product
              if(prod?.vID ==  Int(id))
                  {
                  SelectedItem = prod as! Element
                  return SelectedItem!
                  
                  }
             
             
          }
        }
      
       
        // guard let hh = selectedshow! else { return selectedshow }
        return SelectedItem!;
    }
    
    func FindProductBYSupID(_ SupId:String)
    {
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vSupID ==  Int(SupId))
                {
                    print(prod!.toString())
                }
                
            }
            
        }
        
    }
    func FindProductBYCatID(_ SupId:String)
    {
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vCatID ==  Int(SupId))
                {
                    print(prod!.toString())
                }
                
            }
            
        }
        
    }
    func FindProductBYProdID(_ SupId:String)
    {
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vID ==  Int(SupId))
                {
                    print(prod!.toString())
                }
                
            }
            
        }
        
    }
    func FindProductBYDeptID(_ SupId:String)
    {
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vDeptID ==  Int(SupId))
                {
                    print(prod!.toString())
                }
                
            }
            
        }
        
    }
    func isUniqueidExist(_ Uid:String)->Bool
    {
        for item in self
        {
            if(item as? Menu != nil)
            {
               // let mn = item as? Menu
                
               /* if(mn?.mainMenu.i==String(Uid))
                {
                    return true
                } */
            }
            if(item as? Customer != nil)
            {
                let cust = item as? Customer
                if(cust?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            if(item as? Supplier != nil)
            {
                let sup = item as? Supplier
                if(sup?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            if(item as? Category != nil)
            {
                let cat = item as? Category
                if(cat?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            if(item as? Department != nil)
            {
                let dept = item as? Department
                if(dept?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            
            if(item as? Product != nil)
            {
                let dept = item as? Product
                if(dept?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            
           
        }
        return false
        
    }
}
