//
//  Department.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Cocoa

class Department: NSObject , Entity {
    var vName:String=""
    var vID:Int = -1
   
    
    override init() {
        self.vName=""
        self.vID = -1;
      
    }
  
    init(_ FN:String) {
       // vID=ID
        //super.init()
        self.vName=FN
        
        self.vID = -1;
      //  self.inventory = Inventory();
    }
    
    func fillDepartmentForm()->Department
    {
        let FN = takeInput("Genric", "Please Enter the Department Name")
        let department = Department(FN)
        return department
    }
    func Add(_ inventObj:Inventory)
    {
        
        let department=fillDepartmentForm()
        let id:Int = inventObj.departments.count + 1
        department.vID=id
        inventObj.departments.append(department);
        print("Department Added Successfully.")
        
    }

    func View(_ inventObj:Inventory)
    {
        let DeptId = takeInput("Genric", "Please Enter Department ID")
        
        if(inventObj.departments.isUniqueidExist(DeptId))
        {
           let result = inventObj.departments.FindProfile(DeptId)
            print(result.toString())
        }
        else{ print("Invalid Dept ID.")}
        
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.departments.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
        let DeptId = takeInput("Genric", "Please Enter department ID")
        
        if(inventObj.departments.isUniqueidExist(DeptId))
        {
            let result = inventObj.departments.FindProfile(DeptId)
            let index = inventObj.departments.firstIndex(of: result)
            inventObj.departments.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid Department ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let DeptId = takeInput("Genric", "Please Enter Department ID")
        
        if(inventObj.departments.isUniqueidExist(DeptId))
        {
           let result = inventObj.departments.FindProfile(DeptId)
            let index = inventObj.departments.firstIndex(of: result)
            let department=fillDepartmentForm()
            department.vID = result.vID;
            inventObj.departments[index!] = department
            print("Updated!")
        }
        else{ print("Invalid department ID.")}
        
    }
}
extension Department {
    func toString()->String
    {
        let department : String = String(self.vID ) + " " + self.vName
        return department
    }
}
