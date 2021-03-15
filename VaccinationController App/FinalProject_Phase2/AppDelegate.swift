//
//  AppDelegate.swift
//  FinalProject_Phase2


import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static  var loginSession:DB_LoginSession?
    static  var loginUser : DB_Login?
    static var CurrentProvider: DB_Hospital?
    static var CurrentPatient:DB_Patient?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        AppDelegate.loginSession = DB_LoginSession(context:context)
        AppDelegate.loginUser = DB_Login(context:context)
        AppDelegate.CurrentProvider = DB_Hospital(context:context)
        AppDelegate.CurrentPatient = DB_Patient(context:context)
       // return true
        return true
    }

    func DoesUserExist(_ input : DB_Login)->Bool
    {
        do
        {
        
            let dbh = DBHandler()
            let profiles = dbh.fetchLoginUsers()
            if(profiles.count>0)
            {
                var found = 0
                for item in profiles
                {
                   // print("\(item.loginID) \(item.userType) \(item.password)")
                    if(item.loginID != nil)
                    { if(item.loginID == input.loginID)
                    {
                        found = found + 1
                        if(found >= 2)
                        {
                            print("found it here \(item.loginID) \(item.userType) \(item.password)")
                            return true
                            
                        }
                    }
                    }
                }
                //if(
            }
       
        }
        catch{
            print("Error Occured at Checking exisitng user: \(error) ")
        }
        
        return false
    }
    func pendingInventoryReq() -> [Db_InventoryRequest]
    {
        let dth = DBHandler()
      let allRequests =   dth.fetchInventoryRequests()
        var FilterData = allRequests.filter { (req: Db_InventoryRequest) -> Bool in
             do {
                 
                return req.isApproved != true
             }}
         if(FilterData.count > 1)
         {
             print("filter get value")
         }
        return FilterData
    }
    func upcomingAppointments() -> [DB_Appoinment]
    {
        let dth = DBHandler()
        print(AppDelegate.CurrentProvider?.addressLine1)
        let allApoinments =   dth.fetchProviderAppoinmentRequests(AppDelegate.CurrentProvider!)
        let FilterData = allApoinments.filter { (req: DB_Appoinment) -> Bool in
             do {
                 let currentdattime = Date()
                return req.appointmentDate! > currentdattime
             }}
         if(FilterData.count > 1)
         {
             print("filter get value")
         }
        return FilterData
    }
   // (_ selectedReq: Db_InventoryRequest , _ id:Int16, _ inventoryItem:String, _ itemQuantity : String ,_ provider :DB_Hospital)
    func ApproveRequestInventory(_ selectedReq: Db_InventoryRequest , _ provider :DB_Hospital) -> Bool
    {
           
       
        let dth = DBHandler()
        
        if( dth.AddInventoryItem(provider, selectedReq.item!, selectedReq.quantity)
        )
       {
        selectedReq.isApproved = true
        selectedReq.approvedData = Date()
          //  newsession.sessionID = 1
            saveContext()
            return true
       }
        else
       {
        return false
       }
      //  return false
    }
    
    func RejectRequestInventory(_ selectedReq: Db_InventoryRequest , _ provider :DB_Hospital) -> Bool
    {
       //let dbh = DBHandler()
    
      /*  let reqs = pendingInventoryReq()
        var filterreq = reqs.filter { (DBreq: Db_InventoryRequest) -> Bool in
            do {
                
                return DBreq.provider?.hospitalName == provider.hospitalName && DBreq.requestID == id
            }}
        if(filterreq.count > 1)
        { */
           
        selectedReq.isApproved = false
        selectedReq.approvedData = Date()
          //  newsession.sessionID = 1
            saveContext()
            return true
        
      //  return false
    }
    // MARK: UISceneSession Lifecycle
    func RequestInventory(_ inventoryItem:String, _ itemQuantity : String ) -> Bool
    {
        do {
        let input =   Db_InventoryRequest(context:persistentContainer.viewContext)
        let today = Date()
        input.requestDate = today
        input.item = inventoryItem
        input.quantity = Int32(itemQuantity)!
        input.provider = AppDelegate.CurrentProvider
        let dth = DBHandler()
        input.requestID = Int16(dth.fetchInventoryRequests().count + 1)
        
             saveContext()
            return true
        }
        catch{
            return false
        }
       // loginSession = newsession
        
    }
    
    func BookAppointment(_ aptDate:Date, _ patient:DB_Patient, _ provider : DB_Hospital ) -> Bool
    {
        do {
            let dth = DBHandler()
            let allApoinments =   dth.fetchAllAppoinmentRequest()
            let FilterData = allApoinments.filter { (req: DB_Appoinment) -> Bool in
                 do {
                    // let currentdattime = Date()
                    print("\(String(describing: req.patient?.patientID)) + \(patient.patientID) ")
                    return req.patient?.patientID == patient.patientID
                 }}
             if(FilterData.count >= 1)
             {
                 print("Already taken appoinment")
                return false
             }
            
            let input =   DB_Appoinment(context:persistentContainer.viewContext)
            input.patient = AppDelegate.CurrentPatient
            input.provider = provider
          
            input.appointmentDate = aptDate
            input.appointmentID = Int16(dth.fetchAllAppoinmentRequest().count + 1)
            
             saveContext()
             return true
            }
            catch{
                return false
            }
       // loginSession = newsession
        
    }
    func CreateLoginSession(_ id:String, _ psd : String , _ userType:String)->DB_LoginSession
    {
        var loginSession : DB_LoginSession?
        let dbh = DBHandler()
        let input = DB_Login(context:persistentContainer.viewContext)
        input.loginID = id; input.password = psd; input.userType = userType
        // var loginSession : DB_LoginSession?
        let profiles = dbh.fetchLoginUsers()
        var filterdprofiles = profiles.filter { (profile: DB_Login) -> Bool in
            do {
                
                return profile.loginID == input.loginID && profile.userType == profile.userType && profile.password == input.password
            }}
        if(filterdprofiles.count > 1)
        {
            print("filter get value")
            
            let loginSessions = dbh.fetchLoginSessions()
            for session in loginSessions
            {
                if(session.loginUserR == filterdprofiles.first)
                {
                    if(session.isLogin == false)
                    {
                        session.isLogin = true
                        saveContext()
                    }
                    loginSession = session
                    return loginSession!
                }
            }
            if(loginSession == nil)
            {
                let newsession = DB_LoginSession(context:persistentContainer.viewContext)
                newsession.isLogin = true
                newsession.loginUserR = input
                newsession.sessionID = 1
                saveContext()
                loginSession = newsession
                AppDelegate.loginUser = filterdprofiles.first
                AppDelegate.loginSession = loginSession
                //var newsession = DB_LoginSession(context:context)
                //dbh.AddLoginSession(input)
            }
        }
        return loginSession!
    }
    
    
    
    func LoginUser(_ id:String, _ psd : String , _ userType:String)->Bool
    {
        let input = DB_Login(context:persistentContainer.viewContext)
      //  let input:DB
        input.loginID = id; input.password = psd; input.userType = userType
       // var loginSession : DB_LoginSession?
        do
        {
          
            let dbh = DBHandler()
            let profiles = dbh.fetchLoginUsers()
            if(profiles.count>0)
            {
              //  let prodToOrderList = fetchProdToOrderRecords()
               var filterdprofiles = profiles.filter { (profile: DB_Login) -> Bool in
                    do {
                        
                        return profile == input
                    }}
                if(filterdprofiles.count > 1)
                {
                    print("profile found in profiles")
                }
                var found = 0
                for item in profiles
                {
                    //print("\(item.loginID) \(item.userType) \(item.password)")
                    if(item.loginID != nil)
                    { if(item.loginID == input.loginID && item.userType == input.userType && item.password == input.password  )
                    {
                        found = found + 1
                        if(found >= 2)
                        {
                           // print("found it here \(item.loginID) \(item.userType) \(item.password)")
                           
                           
                             return true
                            
                        }
                    }
                    }
                }
            }
       
        }
        catch{
            print("Error Occured at Checking exisitng user: \(error) ")
        }
       return false
    }
    

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

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "FinalProject_Phase2")
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

