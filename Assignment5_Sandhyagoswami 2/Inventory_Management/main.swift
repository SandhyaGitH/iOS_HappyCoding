//
//  main.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Foundation

print("Hello, World!")

var OrgInvent = Inventory()

var objMenu = Menu()
var mainMenuid:String
var subMenuid:String

repeat {
    objMenu.mainMenu.displayAll()
    mainMenuid = objMenu.mainMenu.chooseMenu("MAIN")
    
        switch(mainMenuid)
        {
        case "1":
            customerMenu()
        case "2":
            suplierMenu(mainMenuid)
        case "3":
            productMenu(mainMenuid)
        case "4":
            departmentMenu(mainMenuid)
        case "5":
            categoryMenu(mainMenuid)
        case "7":
            var produ = Product()
            produ.FindProductBySupID(OrgInvent)
        case "8":
            var produ = Product()
            produ.FindProductByCatID(OrgInvent)
        case "9":
            var produ = Product()
            produ.FindProductByProdID(OrgInvent)
        default:
            break;
        }
    let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the Main menu");
    if(iscontinue.uppercased()=="Y")
    { // objMenu.mainMenu.displayAll()
       // mainMenuid = objMenu.mainMenu.chooseMenu("MAIN")
        
    }
    else{
        mainMenuid = "0"
    }
} while(mainMenuid != "0")


func customerMenu() {
    var subMenuid:String
    objMenu.subMenu.displayAll()
     subMenuid = objMenu.subMenu.chooseMenu("SUB")
    var objCust = Customer()
        repeat{
            
            switch(subMenuid)
            {
                case "1":
                    objCust.Add(OrgInvent)
                case "2":
                    objCust.Update(OrgInvent)
                    
                case "3":
                    objCust.Delete(OrgInvent)
                   
                case "4":
                    objCust.ViewAll(OrgInvent)
                    
                default:
                break;
            }
            
            let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the Customer menu");
            if(iscontinue.uppercased()=="Y")
            {  objMenu.subMenu.displayAll()
                subMenuid = objMenu.subMenu.chooseMenu("SUB")
                
            }
            else{
                subMenuid = "0"
            }
            
        }while(subMenuid != "0")
}



func suplierMenu(_ pSubmenu:String) {
    var subMenuid:String
    objMenu.subMenu.displayAll()
     subMenuid = objMenu.subMenu.chooseMenu("SUB")
    var objSupl = Supplier()
        repeat{
            
            switch(subMenuid)
            {
                case "1":
                    objSupl.Add(OrgInvent)
                case "2":
                    objSupl.Update(OrgInvent)
                    
                case "3":
                    objSupl.Delete(OrgInvent)
                    
                case "4":
                    objSupl.ViewAll(OrgInvent)
                    
                default:
                break;
            }
            
            let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the supplier menu");
            if(iscontinue.uppercased()=="Y")
            {  objMenu.subMenu.displayAll()
                subMenuid = objMenu.subMenu.chooseMenu("SUB")
                
            }
            else{
                subMenuid = "0"
            }
            
        }while(subMenuid != "0")
}

func productMenu(_ pSubmenu:String) {
    var subMenuid:String
    objMenu.subMenu.displayAll()
     subMenuid = objMenu.subMenu.chooseMenu("SUB")
    var objSupl = Product()
        repeat{
            
            switch(subMenuid)
            {
                case "1":
                    objSupl.Add(OrgInvent)
                case "2":
                    objSupl.Update(OrgInvent)
                    
                case "3":
                    objSupl.Delete(OrgInvent)
                    
                case "4":
                    objSupl.ViewAll(OrgInvent)
                    
                default:
                break;
            }
            
            let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the Customer menu");
            if(iscontinue.uppercased()=="Y")
            {  objMenu.subMenu.displayAll()
                subMenuid = objMenu.subMenu.chooseMenu("SUB")
                
            }
            else{
                subMenuid = "0"
            }
            
        }while(subMenuid != "0")
    
}

func departmentMenu(_ pSubmenu:String) {
    var subMenuid:String
    objMenu.subMenu.displayAll()
     subMenuid = objMenu.subMenu.chooseMenu("SUB")
    var objDept = Department()
        repeat{
            
            switch(subMenuid)
            {
                case "1":
                    objDept.Add(OrgInvent)
                case "2":
                    objDept.Update(OrgInvent)
                  
                case "3":
                    objDept.Delete(OrgInvent)
                  
                case "4":
                    objDept.ViewAll(OrgInvent)
                    
                default:
                break;
            }
            
            let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the department menu");
            if(iscontinue.uppercased()=="Y")
            {  objMenu.subMenu.displayAll()
                subMenuid = objMenu.subMenu.chooseMenu("SUB")
                
            }
            else{
                subMenuid = "0"
            }
            
        }while(subMenuid != "0")
    
}

func categoryMenu(_ pSubmenu:String) {
    var subMenuid:String
    objMenu.subMenu.displayAll()
     subMenuid = objMenu.subMenu.chooseMenu("SUB")
    let objCat = Category()
        repeat{
            
            switch(subMenuid)
            {
                case "1":
                    objCat.Add(OrgInvent)
                case "2":
                    objCat.Update(OrgInvent)
                   
                case "3":
                    objCat.Delete(OrgInvent)
                   
                case "4":
                    objCat.ViewAll(OrgInvent)
                    
                default:
                break;
            }
            
            let  iscontinue = takeInput("Continuing", "Press Y if want to continue with the Category menu");
            if(iscontinue.uppercased()=="Y")
            {  objMenu.subMenu.displayAll()
                subMenuid = objMenu.subMenu.chooseMenu("SUB")
                
            }
            else{
                subMenuid = "0"
            }
            
        }while(subMenuid != "0")
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

//print(mainMenuid)
//print(subMenuid)






extension  Array{
     /* func FindShow(_ showId:String)->shows?{
        var selectedshow:shows?
        for show in AllShows
        {
            if(show.ShowId==Int(showId))
            {
                selectedshow=show
                return selectedshow!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    
    func containsId(_ showId:String)->Bool
    {
        for show in AllShows
        {
            if(show.ShowId==Int(showId))
            {
                return true
            }
        }
        return false
        
    }
    func FindProfile(_ Uid:String)->User?{
        var selectedUser:User?
        for user in Users
        {
            if(user.vUniqueId == Uid)
            {
                selectedUser=user
                return selectedUser!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    func FindProfileByemail(_ emailid:String)->User?{
        var selectedUser:User?
        for user in Users
        {
            if(user.vemail == emailid)
            {
                selectedUser=user
                return selectedUser!
            }
        }
        // guard let hh = selectedshow! else { return selectedshow }
        return nil;
    }
    
    func isUniqueidExist(_ Uid:String)->Bool
    {
        for user in Users
        {
            if(user.vUniqueId==String(Uid))
            {
                return true
            }
        }
        return false
        
    } */
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
          else  if(item as? Supplier != nil)
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
            /*else if(item as? shows != nil)
            {
                let showitem = item as? shows
                print(showitem!.toString())
            }
            else if(item as? User != nil)
            {
                let user = item as? User
                
                if(user?.vrole != "Admin")
                { print(user!.toString())
                    // print("Shows")
                }
            }
            
            else { print(item)} */
        }
    }
    
    func ChooseMenu()->String{
        //self.DisplayAll()
        let menuid = takeInput("Menu", "Please enter the menu Id")
        return menuid
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
            // AllShows.contains(<#T##element: shows##shows#>)
        }while( !(Int(outputstring)! >= 0 && Int(outputstring)! < 10))
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



