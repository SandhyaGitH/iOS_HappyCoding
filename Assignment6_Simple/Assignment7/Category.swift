//
//  Category.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
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
        
        let cat = inventObj.nCategory//fillCategoryForm()
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
     
        
    }

    func ViewAll(_ inventObj:Inventory)
    {
        
        inventObj.categories.DisplayAll()
        
    }

    func Delete(_ inventObj:Inventory)
    {
        let catId = inventObj.nCategory.vID//takeInput("Genric", "Please Enter category ID")
        
        if(inventObj.categories.isUniqueidExist(String(catId)))
        {
            let result = inventObj.categories.FindProfile(String(catId))
            let index = inventObj.categories.firstIndex(of: result)
            inventObj.categories.remove(at: index!)
            print("Deleted!")
        }
        else{ print("Invalid Category ID.")}
        
    }
    func Update(_ inventObj:Inventory)
    {
        let CatID = inventObj.nCategory.vID
       // let CatID = takeInput("Genric", "Please Enter Category ID")
        
        if(inventObj.categories.isUniqueidExist(String(CatID)))
        {
            let result = inventObj.categories.FindProfile(String(CatID))
            let index = inventObj.categories.firstIndex(of: result)
           // let category=fillCategoryForm()
          //  category.vID = result.vID;
            
            if(inventObj.departments.isUniqueidExist(String(inventObj.nCategory.vDeptID)))
            {
            inventObj.categories[index!] = inventObj.nCategory
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
