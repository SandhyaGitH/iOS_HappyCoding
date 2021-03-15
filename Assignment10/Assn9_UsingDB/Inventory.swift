//
//  Inventory.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
class Inventory: NSObject {
    
    override init() {
        super.init()
       // self.customers = []
         self.suppliers = []
       // self.products = []
       self.departments = []
        self.categories = []
      //  self.orders = []
      //  self.nCustomer = Customer()
     //   self.nSupplier = Supplier()
      //  self.nOrder = Order()
       self.initializeArray()
      //  self.ProdsForOrder = []
        
    }

    
    var suppliers: [Supplier]=[]
   var  departments: [Department]=[]
   var  categories:[Category]=[]
    /*  var customers: [Customer]=[]
     var products: [Product]=[]
     var orders:[Order]=[]
    var nSupplier = Supplier()
    var nDepartmnet = Department()
    var nCategory = Category()
    var nProduct = Product()
    var nCustomer = Customer();
     */
   // var nOrder = Order();
   // var ProdsForOrder : [Product] = []
   // var nOrdertuple = [(  prod:Product, Quantity:Int)]()
  
    func  initializeArray() {
     /*   var cust=Customer("Sandy", "customer","11 Village", "s@", "123")
        var id:Int = customers.count + 1
        cust.vID=id
        customers.append(cust);
        
        cust=Customer("Sandy", "customer2","12 Village", "a@", "1234")
        id = customers.count + 1
        cust.vID=id
        customers.append(cust);
        */
        var Dept=Department("Dept1Name")
        var Deptid:Int = departments.count + 1
        Dept.vID=Deptid
        departments.append(Dept);
        
        var Cat=Category("Cat1Name",1)
        var CatID:Int = categories.count + 1
        Cat.vID=CatID
        categories.append(Cat);
        
        var sup = Supplier("Best Gudgets Inc", "Sup1Add", "Supemail", "1234")
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
        
         sup = Supplier("Best Buy", "Sup2Add", "Sup2email", "1234")
         Supid = suppliers.count + 1
        sup.vID=Supid
        suppliers.append(sup);
      /*
        var prod=Product("iPhone 11   ","Phones",4,1,2,1)
        var prodid:Int = products.count + 1
        prod.vID=prodid
        products.append(prod);
        
        prod=Product("iPhone 12 max pro","Phones",12,2,1,1)
        prodid = products.count + 1
        prod.vID=prodid
        products.append(prod);
        
        prod=Product("Macbook Air","Laptop",3,2,1,1)
        prodid = products.count + 1
        prod.vID=prodid
        products.append(prod);
        
        */
    }
}
