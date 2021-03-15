//
//  AppDelegate.swift
//  Assn9_UsingDB
//
//  Created by Samarth chaturvedi on 12/1/20.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var inventOrg = Inventory();
    static var uiCreation = UICreation();
   
    func saveImage(_ prod : EProduct,data: Data) {
    //let imageInstance = Image(context: persistentContainer.viewContext)
        prod.prodImage = data
    do {
        try saveContext();
    print("Image is saved")
    } catch {
    print(error.localizedDescription)
          }
       }
    
    static   func validateinput(  _ name: String, _ type :String,  _ deptID :String, _ catID:String,_ supID :String)->Bool
       {   var result = true;
        if( name == "" || type == "" || deptID == "" || catID == "" || supID == "")
           {
               result = false
           }
           
           return result;
       }
   
 
  func  fetchRecords()->[ECustomer]
  {
   var arrCusts = [ECustomer]();
    let fetchrequest = NSFetchRequest<ECustomer>(entityName: "ECustomer");
    
    do {
        try arrCusts = persistentContainer.viewContext.fetch(fetchrequest)
        
    }
    catch{
        
    }
    return arrCusts
  }
    
    func DeleteRecord(_ cust : ECustomer){
        persistentContainer.viewContext.delete(cust);
        saveContext();
    }
    
    func updateRecord(_ cust : ECustomer, _ fn: String, _ ln :String, _ add :String, _ email :String, _ pho:String) {
      //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        cust.firstName = fn
        cust.emailAddress = email
        cust.lastName = ln
        cust.address = add
        cust.contactDetails = pho
        saveContext()
    }
    
    func updateCustomerCart(_ cust : ECustomer, _ cart:ECart) {
      //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        cust.cart = cart
       
        saveContext()
    }
    
    func AddOrderToCustomer(_ cust : ECustomer, _ order:EOrder) {
      //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        for item in order.products! {
           cust.orders?.adding(item)
           saveContext()
        }
       
    }
    func EmptyCustomerCart() {
      //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        let logincust = fetchRecords()[0]
        logincust.cart =  nil
       
        saveContext()
    }
    
    func DeleteCustomerOrder(_ cust : ECustomer,_ Order:EOrder) {
       let cutomer = ECustomer(context:persistentContainer.viewContext)
    
      
       // persistentContainer.viewContext.delete(c_order)
             //   commits.remove(at: indexPath.row)
             //   tableView.deleteRows(at: [indexPath], with: .fade)

                saveContext()
        saveContext()
    }
    
    func insertRecord(_ fn: String, _ ln :String, _ add :String, _ email :String, _ pho:String) {
        let cutomer = ECustomer(context:persistentContainer.viewContext)
        cutomer.firstName = fn
       cutomer.emailAddress = email
        cutomer.lastName = ln
       cutomer.address = add
       cutomer.contactDetails = pho
        saveContext()
    }
    
    func  fetchProdRecords()->[EProduct]
    {
     var arrProds = [EProduct]();
      let fetchrequest = NSFetchRequest<EProduct>(entityName: "EProduct");
      
      do {
          try arrProds = persistentContainer.viewContext.fetch(fetchrequest)
          
      }
      catch{
          
      }
      return arrProds
    }
      
      func DeleteProdRecord(_ prod : EProduct){
          persistentContainer.viewContext.delete(prod);
          saveContext();
      }
      
    func EmptyEntity(_ EntityName : String)
    {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
       
        do {
            try persistentContainer.viewContext.execute(request)
            try persistentContainer.viewContext.save()
        } catch {
            print ("There was an error")
        }
    }
    func updateProdRecord(_ prod : EProduct, _ name: String, _ type :String, _ quant :String, _ deptID :String, _ catID:String,_ supID :String) {
        //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        prod.prodName = name
        prod.prodType = type
        prod.prodQuantity = Int32(quant)!
        prod.deptID = Int16(deptID)!
        prod.catID = Int16(catID)!
        prod.supID = Int16(supID)!
          saveContext()
      }
      
     /* func insertProdRecord(_ name: String, _ type :String, _ quant :String, _ deptID :String, _ catID:String,_ supID :String)  {
          let prod = EProduct(context:persistentContainer.viewContext)
        prod.prodName = name
        prod.prodType = type
        prod.prodQuantity = Int32(quant)!
        prod.deptID = Int16(deptID)!
        prod.catID = Int16(catID)!
        prod.supID = Int16(supID)!
          saveContext()
      } */
    
    func insertProdRecord(_ name: String, _ type :String, _ quant :Int, _ deptID :Int, _ catID:Int,_ supID :Int)  {
        let prod = EProduct(context:persistentContainer.viewContext)
      prod.prodName = name
      prod.prodType = type
        prod.prodQuantity = Int32(quant)
        prod.deptID = Int16(deptID)
        prod.catID = Int16(catID)
        prod.supID = Int16(supID)
        saveContext()
    }
    func insertProdRecord22(_ name: String, _ type :String, _ quant :Int, _ deptID :Int, _ catID:Int,_ supID :Int)->EProduct  {
        let prod = EProduct(context:persistentContainer.viewContext)
      prod.prodName = name
      prod.prodType = type
        prod.prodQuantity = Int32(quant)
        prod.deptID = Int16(deptID)
        prod.catID = Int16(catID)
        prod.supID = Int16(supID)
        saveContext()
        return prod
    }
    func  fetchOrderRecords()->[EOrder]
    {
     var arrOrders = [EOrder]();
      let fetchrequest = NSFetchRequest<EOrder>(entityName: "EOrder");
      
      do {
          try arrOrders = persistentContainer.viewContext.fetch(fetchrequest)
          
      }
      catch{
          
      }
      return arrOrders
    }
      
    func DeleteOrderRecord(_ order : EOrder, _ cust :ECustomer){
          persistentContainer.viewContext.delete(order);
          saveContext();
        updatecustOrders(cust,order)
        //  persistentContainer.viewContext.delete(order);
         // saveContext();
      }
      
   /* func updateProdRecord(_ prod : EProduct, _ name: String, _ type :String, _ quant :String, _ deptID :String, _ catID:String,_ supID :String) {
        //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        prod.prodName = name
        prod.prodType = type
        prod.prodQuantity = Int32(quant)!
        prod.deptID = Int16(deptID)!
        prod.catID = Int16(catID)!
        prod.supID = Int16(supID)!
          saveContext()
      }
      */
  
    
    func insertOrderRecord(_ orderID: Int ,_ prod:EProduct , _ TotalOrderCount:Int , _ prodCount: Int)  {
        let order = EOrder(context:persistentContainer.viewContext)
        order.orderID = Int16(orderID);
        order.products = NSSet(objects: prod)
      //  order.prodType = type
        order.itemOrdered = Int16(Int32(prodCount))
        order.totalCount = Int16(TotalOrderCount)
      //  order.deptID = Int16(deptID)
      //  order.catID = Int16(catID)
       // order.prodSupID = Int16(supID)
      //  order.prodImage = prodImage
        saveContext()
    }
    
    func addToCart(_ orderID: Int ,_ prod:EProduct , _ TotalOrderCount:Int , _ prodCount: Int)  {
        let order = EOrder(context:persistentContainer.viewContext)
        order.orderID = Int16(orderID);
        order.products = NSSet(objects: prod)
      //  order.prodType = type
        order.itemOrdered = Int16(Int32(prodCount))
        order.totalCount = Int16(TotalOrderCount)
      //  order.deptID = Int16(deptID)
      //  order.catID = Int16(catID)
       // order.prodSupID = Int16(supID)
      //  order.prodImage = prodImage
        saveContext()
    }
    
    func  fetachOrders()->[EOrder]
    {
     var arrOrders = [EOrder]();
      let fetchrequest = NSFetchRequest<EOrder>(entityName: "EOrder");
      
      do {
          try arrOrders = persistentContainer.viewContext.fetch(fetchrequest)
          
      }
      catch{
          
      }
      return arrOrders
    }
    func  fetachCart()->[ECart]
    {
     var arrOrders = [ECart]();
      let fetchrequest = NSFetchRequest<ECart>(entityName: "ECart");
      
      do {
          try arrOrders = persistentContainer.viewContext.fetch(fetchrequest)
          
      }
      catch{
          
      }
      return arrOrders
    }
    
    func  fetchProdToOrderRecords()->[ProdToOrder]
    {
     var arrOrders = [ProdToOrder]();
      let fetchrequest = NSFetchRequest<ProdToOrder>(entityName: "ProdToOrder");
      
      do {
          try arrOrders = persistentContainer.viewContext.fetch(fetchrequest)
          
      }
      catch{
          
      }
      return arrOrders
    }
    func InsertProductToOrder(_ vprod:EProduct , _ logincust:ECustomer )  {
       
       // let logincust = fetchRecords()[0]
        
        let prodToOrderList = fetchProdToOrderRecords()
       var filteredprods = prodToOrderList.filter { (prod: ProdToOrder) -> Bool in
            do {
                
                return prod.product == vprod
            }}
        if(filteredprods.count>0)
        {
            updateProdToOrderQuantity(filteredprods.first!)
            let prodToOrder   = fetchProdToOrderRecords()
            
           // UpdateCart(logincust.cart!, prodToOrder, 5, logincust)
            for item in prodToOrder {
                if(fetachCart().count>0)
                {
                    
                    UpdateCart(fetachCart().last!, item, 5, logincust)
                }
                else
                {
                    InsertToCart(item, 5, logincust)
                }
                }
        }
        else{
            var prodToOrder    = ProdToOrder(context:persistentContainer.viewContext)
             prodToOrder.product = vprod
             prodToOrder.quantity = 1
             saveContext()
            let prodsToOrder   = fetchProdToOrderRecords()
            for item in prodsToOrder {
                
                let customercart = logincust.cart
                if(customercart != nil)
                {
                    
                    UpdateCart(customercart!, item, 5, logincust)
                }
                else
                {
                    InsertToCart(item, 5, logincust)
                }
        
   
                }
           // InsertToCart(prodToOrder, 5, logincust)
          
        }
     //   updateCustomerCart(logincust,carts.first!)
       /* var carts =  fetachCart()
          carts = carts.filter { (cart: ECart) -> Bool in
              do {
                  
                  return cart.customer == logincust
              }}
        
        for cart in carts {
            DeleteCartFromCarts(cart);
        } */
        
     
    }
    
    func updatecustOrders(_ cust:ECustomer,_ pOrder:EOrder)
    {
        let custOrders = cust.orders
       // var carts =  fetachCart()
        let  ods = custOrders!.filter { (o: NSSet.Element) -> Bool in
               do {
                   
                return o as! EOrder != pOrder
               }
        
        }
        cust.orders = (cust.orders?.adding(ods))! as NSSet
       // cust.orders = ods
         saveContext()
    }
    
    func DeleteCartFromCarts(_ cart: ECart)
    {
        persistentContainer.viewContext.delete(cart);
        saveContext();
    }
    
    func InsertToCart(_ vprod:ProdToOrder,_ TotalintoCart:Int , _ Cust:ECustomer )  {
        var cart    = ECart(context:persistentContainer.viewContext)
        cart.products = NSSet(objects: vprod)
        cart.customer = Cust
        cart.itemCount = Int16(TotalintoCart)
         saveContext()
        updateCustomerCart(Cust,cart)
       
    }
    
    func UpdateCart(  _ cart:ECart,_ vprod:ProdToOrder,_ TotalintoCart:Int , _ Cust:ECustomer )  {
     
        var cartcount = cart.products?.count
       // cart.products = cart.products?.adding(vprod) as NSSet?
        cart.products?.adding(vprod)
        var cartaftercount = cart.products?.count
        saveContext()
        let h =   cart.products!.count
        updateCustomerCart(Cust, cart)
       
    }
    func updateProdToOrderQuantity(_ prod : ProdToOrder) {
        //  let cutomer = ECustomer(context:persistentContainer.viewContext)
        prod.quantity = prod.quantity + 1
        //prod.product = prod.product
        saveContext()
      }
    
    
    func InsertToOrder(_ vprods:[ProdToOrder],_ TotalintoCart:Int )  {
        let order    = EOrder(context:persistentContainer.viewContext)
        var ID = fetchOrderRecords().count + 1
        
        order.orderID = Int16(ID)
    
    for item in vprods {
            order.products =  order.products?.adding(item.product) as NSSet?
            order.itemOrdered = item.quantity
        saveContext()
        }
        
      let logincust = fetchRecords()[0]
        AddOrderToCustomer(logincust, order)
       
    }
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Assn9_UsingDB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

