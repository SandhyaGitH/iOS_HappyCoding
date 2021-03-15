//
//  Order.swift
//  Assignment7
//


import Foundation

class Order:NSObject {
    

    
    override init() {
        
       // super.init()
        self.OrderID = 0;
        self.Orderedproducts = []
        self.products = []
        self.OrderDateTime = Date()
     
       // self.inventory = Inventory();
    }
    
    init(_ prodDetails:[(  prod:Product, Quantity:Int)], _ inventObj:Inventory) {
        let id:Int = inventObj.orders.count + 1
        OrderID = id+1
        Orderedproducts = prodDetails
        OrderDateTime = Date()
        nCustomer = Customer(1,"Sandy", "customer","11 Village", "s@", "123")
        
    }

    func CreatenewOrder(_ prodDetails:[(  prod:Product, Quantity:Int)], _ inventObj:Inventory)->Int {
    
        let od = Order(prodDetails, inventObj)
        od.OrderDateTime = Date()
       // date.addTimeInterval(<#T##timeInterval: TimeInterval##TimeInterval#>)
        inventObj.orders.append(od)
        return od.OrderID
    }

    func FindOrdersBuyCustomer(_ cust:Customer, _ date: Date)->Array<Order> {
    
        var ods : Array<Order> = []
        //AppDelegate.inventOrg.orders.FindCategoryBYDeptID()
       
        return ods
    }
    

    
    var Orderedproducts = [(  prod:Product, Quantity:Int)]()
var products: [Product]=[]
var nSupplier = Supplier()
var nProduct = Product()
var nCustomer = Customer()
var nQuanity :Int = 0
    var OrderID: Int
    var OrderDateTime:Date
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
