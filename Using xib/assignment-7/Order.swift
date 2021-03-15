//
//  Order.swift
//  Assignment7
//
//  Created by Samarth chaturvedi on 11/14/20.
//

import Foundation

class Order:NSObject {
    

    
    override init() {
        
       // super.init()
        self.OrderID = 0;
        self.Orderedproducts = []
        self.products = []
     
       // self.inventory = Inventory();
    }
    
    init(_ prodDetails:[(  prod:Product, Quantity:Int)], _ inventObj:Inventory) {
        let id:Int = inventObj.orders.count + 1
        OrderID = id+1
        Orderedproducts = prodDetails
        nCustomer = Customer(1,"Sandy", "customer","11 Village", "s@", "123")
        
    }

    func CreatenewOrder(_ prodDetails:[(  prod:Product, Quantity:Int)], _ inventObj:Inventory)->Int {
    
        var od = Order(prodDetails, inventObj)
       
        inventObj.orders.append(od)
        return od.OrderID
    }

    func FindOrdersBuyCustomer(_ cust:Customer, _ date: Date)->Array<Order> {
    
        var ods : Array<Order> = []
        //AppDelegate.inventOrg.orders.FindCategoryBYDeptID()
       
        return ods
    }
    
 /*   func FindTotalItemOrderdByustomer(_ cust:Customer, _ date: Date)->Array<Order> {
    
        var ods : Array<Order>
        var totQ = 0
        AppDelegate.inventOrg.orders.FindCategoryBYDeptID(<#T##Deptd: String##String#>).OrderedProducts
        for index in (0...ods.count-1)
        {
            totQ = totQ + ods[index].Orderedproducts.
        }
        return ods
    } */
    
    var Orderedproducts = [(  prod:Product, Quantity:Int)]()
var products: [Product]=[]
var nSupplier = Supplier()
var nProduct = Product()
var nCustomer = Customer()
var nQuanity :Int = 0
    var OrderID: Int
}
extension Order {
    func toString()->String
    {
        var OrderDetail : String = "Order ID: " + String(self.OrderID ) + " ProductDetail :  "
        
       /* var proddetail:String = " Item "
        var TotalItemsOrdered = 0;
        let productsInorder = 10 inventOrg.orders.Orderedproducts.count
        for index in Range(0...productsInorder-1)
        {
            proddetail = proddetail +  +" " +  inventOrg.orders.Orderedproducts[index].0.toString()
         
            TotalItemsOrdered = TotalItemsOrdered + inventOrg.orders.Orderedproducts[index].1
            
        } */
        
        return OrderDetail
    }
}
