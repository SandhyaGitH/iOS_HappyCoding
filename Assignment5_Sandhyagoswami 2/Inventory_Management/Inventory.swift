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
        
        let Dept=Department("Dept1Name")
        let Deptid:Int = departments.count + 1
        Dept.vID=Deptid
        departments.append(Dept);
        
        let Cat=Category("Cat1Name",1)
        let CatID:Int = categories.count + 1
        Cat.vID=CatID
        categories.append(Cat);
        
        
        
    }
}
