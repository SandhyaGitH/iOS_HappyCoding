//
//  mains.swift
//  Assignment7
//
//  Created by Samarth chaturvedi on 11/14/20.
//

//
//  main.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class mains {}
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    public func validaPhoneNumber() -> Bool {
        let phoneNumberRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = validatePhone.evaluate(with: trimmedString)
        return isValidPhone
     }
     public func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
     }
}

//print(mainMenuid)
//print(subMenuid)






extension  Array{
   
    func  DisplayAll() {
        
        for item in self
        {
            if(item as? String != nil)
            {
                print(item)// print("yes")
            }
          else  if(item as? Customer != nil)
            {
                let cust = item as? Customer
                print(cust!.toString())
            }
        /*  else  if(item as? Supplier != nil)
            {
                let sup = item as? Supplier
                print(sup!.toString())
            }
          else  if(item as? Category != nil)
            {
                let cat = item as? Category
            print(cat!.toString())
            }
          else  if(item as? Department != nil)
            {
                let Dept = item as? Department
                print(Dept!.toString())
            }
          else  if(item as? Product != nil)
            {
                let prod = item as? Product
                print(prod!.toString())
            }
           */
        }
    }
    
    func ChooseMenu()->String{
        //self.DisplayAll()
        let menuid = takeInput("Menu", "Please enter the menu Id")
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
    
    func FindProductBYSupID(_ SupId:String)->Array<Product>
    {  var products = [Product]()
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vSupID ==  Int(SupId))
                {
                    products.append(prod!)//print(prod!.toString())
                }
                
            }
            
        }
        return products;
    }
    func FindProductBYCatID(_ SupId:String)->Array<Product>
    {  var products = [Product]()
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vCatID ==  Int(SupId))
                {
                    products.append(prod!)// print(prod!.toString())
                }
                
            }
            
        }
        return products;
    }
    func FindProductBYProdID(_ SupId:String)->Array<Product>
    {
        var products = [Product]()
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vID ==  Int(SupId))
                {
                    products.append(prod!)
                   // print(prod!.toString())
                }
                
            }
            
        }
        return products;
        
    }
    func FindProductBYDeptID(_ SupId:String)->Array<Product>
    {  var products = [Product]()
        for item in self
        {
            if(item as? Product != nil)
            {
                let prod = item as? Product
                if(prod?.vDeptID ==  Int(SupId))
                {
                    products.append(prod!)
                    //print(prod!.toString())
                }
                
            }
            
        }
        return products;
        
    }
    
    func FindCategoryBYDeptID(_ Deptd:String)->Array<Category>
    {  var cats = [Category]()
        for item in self
        {
            if(item as? Category != nil)
            {
                let cat = item as? Category
                if(cat?.vDeptID ==  Int(Deptd))
                {
                    cats.append(cat!)
                    //print(prod!.toString())
                }
                
            }
            
        }
        return cats;
        
    }
    func isUniqueidExist(_ Uid:String)->Bool
    {
        for item in self
        {
            /* if(item as? Menu != nil)
            {
               // let mn = item as? Menu
                
               /* if(mn?.mainMenu.i==String(Uid))
                {
                    return true
                } */
            }*/
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
                let prod = item as? Product
                if(prod?.vID ==  Int(Uid))
                    {
                        return true
                    }
               
               // return false
            }
            
           
        }
        return false
        
    }
    
}

func takeInput( _ inputFor :String , _ inputMessage:String)-> String
{
    var outputstring:String = "";
    //var MCondition:String = ""
    if(inputFor=="Role")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            let  inputrole=readLine()!
            
            if(inputrole.uppercased() == "A")
            {
                outputstring="Admin"
            }
            else if(inputrole.uppercased() == "U")
            {
                outputstring="User"
            }
            
            
        }while(outputstring != "Admin" && outputstring != "User")
    }
    else  if(inputFor=="Password" || inputFor=="Email" || inputFor=="Name" || inputFor=="Menu" || inputFor=="Continuing" || inputFor=="Genric")
    {
        repeat{
            print(inputMessage, terminator: ".");
            let  inputpswrd :String? = readLine()
            if inputpswrd != nil {
                outputstring = inputpswrd!
            }
            
        } while(outputstring=="")
    }
    else if(inputFor=="Registration")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
        }while(outputstring.uppercased() != "R" && outputstring.uppercased() != "L")
    }
    else if(inputFor=="ShowType")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
        }while(outputstring.uppercased() != "T" && outputstring.uppercased() != "M" && outputstring.uppercased() != "A")
    }
    /*
    else if(inputFor=="ShowAdd")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            // AllShows.contains(<#T##element: shows##shows#>)
        }while(!AllShows.containsId(outputstring))
    }
    else if(inputFor=="DeleteProfile")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            // AllShows.contains(<#T##element: shows##shows#>)
        }while(!Users.isUniqueidExist(outputstring))
    }
    
    */
    else if(inputFor=="MainMenu")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            if(outputstring == "" || outputstring == " ")
            { outputstring = "-1"}
            if(!outputstring.isInt)
            {print("Not Valid");
                break;}
            // AllShows.contains(<#T##element: shows##shows#>)
        }while( !(Int(outputstring)! >= 0 && Int(outputstring)! < 11))
    }
    else if(inputFor=="SubMenu")
    {
        repeat
        {
            print(inputMessage, terminator: ".");
            outputstring=readLine()!
            if(outputstring == "" || outputstring == " ")
            { outputstring = "-1"}
            if(!outputstring.isInt)
            {print("Not Valid");
                break;}
            // AllShows.contains(<#T##element: shows##shows#>)
        }while( !(Int(outputstring)! >= 0 && Int(outputstring)! < 5))
    }
    
    return outputstring
}
