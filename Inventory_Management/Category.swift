//
//  Category.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Cocoa

class Category: NSObject, Entity {
    var vName:String=""
    var vID:Int = -1
   // var Dept = Department()
    var vDeptID:Int
    
    override init() {
        self.vName=""
        self.vID = -1;
        self.vDeptID = -1
      
    }
  
    init(_ FN:String, _ DeptId : Int) {
       // vID=ID
        //super.init()
        self.vName=FN
        
        self.vID = -1;
        self.vDeptID = DeptId
      //  self.inventory = Inventory();
    }
    
    func fillCategoryForm()->Category
    {
        let FN = takeInput("Genric", "Please Enter the Category Name")
        let DeptId = takeInput("Genric", "Please Enter the Department ID")
        let I_DeptId = Int(DeptId)
        let category = Category(FN , I_DeptId!)
        return category
    }
    func Add(_ inventObj:Inventory)
    {
        
        let cat=fillCategoryForm()
        let id:Int = inventObj.categories.count + 1
        cat.vID=id
        if(inventObj.departments.isUniqueidExist(String(cat.vDeptID)))
        { inventObj.categories.append(cat);
        print("Category Added Successfully.")
        }
        else{
            print("Invalid Dept ID.")
        }
        
    }

    func View(_ inventObj:Inventory)
    {
        let DeptId = takeInput("Genric", "Please Enter Category ID")
        
        if(inventObj.categories.isUniqueidExist(DeptId))
        {
           let result = inventObj.categories.FindProfile(DeptId)
            print(result.toString())
        }
        else{ print("Invalid Category ID.")}
        
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.categories.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
        let catId = takeInput("Genric", "Please Enter category ID")
        
        if(inventObj.categories.isUniqueidExist(catId))
        {
            let result = inventObj.categories.FindProfile(catId)
            let index = inventObj.categories.firstIndex(of: result)
            inventObj.categories.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid Category ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let CatID = takeInput("Genric", "Please Enter Category ID")
        
        if(inventObj.categories.isUniqueidExist(CatID))
        {
            let result = inventObj.categories.FindProfile(CatID)
            let index = inventObj.categories.firstIndex(of: result)
            let category=fillCategoryForm()
            category.vID = result.vID;
            
            if(inventObj.departments.isUniqueidExist(String(category.vDeptID)))
            {
            inventObj.categories[index!] = category
            print("Updated!")
            }
            else {print("Invalid Dept Id")}
        }
        else{ print("Invalid Category ID.")}
        
    }
}
extension Category {
    func toString()->String
    {
        let category : String =  "" + String(self.vID) + " " + self.vName + " " + String(self.vDeptID)
        return category
    }
}
