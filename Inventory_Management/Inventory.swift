//
//  Inventory.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Cocoa

class Inventory: NSObject {
    
    override init() {
        super.init()
        self.customers = []
        self.suppliers = []
        self.products = []
        self.departments = []
        self.categories = []
        self.nCustomer = Customer()
        self.initializeArray()
        
    }
    var customers: [Customer]=[]
    var suppliers: [Supplier]=[]
    var products: [Product]=[]
    var departments: [Department]=[]
    var categories:[Category]=[]
    
    var nCustomer = Customer("Sandy", "customer","11 Village", "s@", "123");
    
    func  initializeArray() {
        var cust=Customer("Sandy", "customer","11 Village", "s@", "123")
        var id:Int = customers.count + 1
        cust.vID=id
        customers.append(cust);
        
        cust=Customer("Sandy", "customer2","12 Village", "a@", "1234")
        id = customers.count + 1
        cust.vID=id
        customers.append(cust);
        
        var Dept=Department("Dept1Name")
        var Deptid:Int = departments.count + 1
        Dept.vID=Deptid
        departments.append(Dept);
        
        var Cat=Category("Cat1Name",1)
        var CatID:Int = categories.count + 1
        Cat.vID=CatID
        categories.append(Cat);
        
        var sup = Supplier("Sup1Name", "Sup1Add", "Supemail", "1234")
        var Supid:Int = suppliers.count + 1
        sup.vID=Supid
        suppliers.append(sup);
        
         Dept=Department("Dept2Name")
         Deptid = departments.count + 1
        Dept.vID=Deptid
        departments.append(Dept);
        
         Cat=Category("Cat2Name",2)
         CatID = categories.count + 1
        Cat.vID=CatID
        categories.append(Cat);
        
         sup = Supplier("Sup2Name", "Sup2Add", "Sup2email", "1234")
         Supid = suppliers.count + 1
        sup.vID=Supid
        suppliers.append(sup);
        
        
    }
}
