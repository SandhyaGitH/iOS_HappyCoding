//
//  DBHandler.swift
//  FinalProject_Phase1
//


import Foundation
import  UIKit

class DBHandler {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   
    func  fetchInventoryRequests()->[Db_InventoryRequest]
      {
      var InventoryRequests:[Db_InventoryRequest]?
          do
          {
            InventoryRequests = try context.fetch(Db_InventoryRequest.fetchRequest())
          }
          catch
          {
              
          }
      return InventoryRequests!
    }
    
    // fetch dbhospital purticular object first
    func  fetchProviderAppoinmentRequests(_ input : DB_Hospital)->[DB_Appoinment]
      {
      var AllApointments:[DB_Appoinment]?
          do
          {
            
           //var provider = try context.fetch(DB_Hospital.fetchRequest())
            AllApointments = fetchAllAppoinmentRequest()
            let today = Date()
            print(today)
            AllApointments = AllApointments?.filter { (appointment: DB_Appoinment) -> Bool in
                 do {
                     //let today = Date()
                    return appointment.appointmentDate! > today
                 }
            }
            
          }
          catch
          {
              
          }
      return AllApointments!
    }
    
    func  fetchMyAppoinmentRequest(_ input : DB_Patient)->DB_Appoinment?
      {
      // let inputpat:DB_Patient? = input
        var myApointment:DB_Appoinment? //()
          do
          {
            if let app =   input.appointment
                   { myApointment = app
                    return myApointment
                
            }
          else{
             let allapointments = fetchAllAppoinmentRequest()
            for a in allapointments {
                print( a.patient?.name )
            }
            let filterapp = allapointments.filter { (app: DB_Appoinment) -> Bool in
                do {
                    
                    return app.patient?.patientID == AppDelegate.CurrentPatient?.patientID
                }}
            if(filterapp.count > 0)
            {
                myApointment = filterapp.last!
            }
            
           }
          }
          catch
          {
              
          }
        return myApointment
    }
    
    func  fetchAllAppoinmentRequest()->[DB_Appoinment]
      {
      var appoinments:[DB_Appoinment]?
          do
          {
            appoinments = try context.fetch(DB_Appoinment.fetchRequest())
           
          }
          catch
          {
              
          }
      return appoinments!
    }
    
  func  fetchLoginUsers()->[DB_Login]
    {
    var LoginUser:[DB_Login]?
        do
        {
            LoginUser = try context.fetch(DB_Login.fetchRequest())
        }
        catch
        {
            
        }
    return LoginUser!
  }
    
    func  fetchLoginSessions()->[DB_LoginSession]
      {
      var LoginSessions:[DB_LoginSession]?
          do
          {
            LoginSessions = try context.fetch(DB_LoginSession.fetchRequest())
          }
          catch
          {
              
          }
      return LoginSessions!
    }
    
    func  fetchProviderss()->[DB_Hospital]
      {
      var Providers:[DB_Hospital]?
          do
          {
            Providers = try context.fetch(DB_Hospital.fetchRequest())
          }
          catch
          {
              
          }
      return Providers!
    }
    
    func  fetchproviderInformation(_ input:DB_Hospital)->DB_Hospital
      {
      var Provider:DB_Hospital?
          do
          {
            let  Providers = fetchProviderss()
            
            let filterprovider = Providers.filter { (p: DB_Hospital) -> Bool in
                do {
                    
                    return p.id == input.id
                }}
            
            if(filterprovider.count > 0)
            {
                Provider = filterprovider.last
            }
          }
          catch
          {
              
          }
      return Provider!
    }
    
    func  fetchPatientInformation(_ input:DB_Login)->DB_Patient?
      {
      var patient:DB_Patient?
          do
          {
            let  patients = fetchPatients()
            
            let filterprovider = patients.filter { (p: DB_Patient) -> Bool in
                do {
                    
                    return p.loginUserR?.loginID == input.loginID
                }}
            
            if(filterprovider.count > 0)
            {
                patient = filterprovider.last
            }
          }
          catch
          {
              
          }
     /*  if(patient == nil)
        {
            patient = DB_Patient()
        } */
      return patient
    }
    
    func  fetchproviderInformation(_ input:DB_Login)->DB_Hospital?
      {
      var Provider:DB_Hospital?
          do
          {
            let  Providers = fetchProviderss()
            
            let filterprovider = Providers.filter { (p: DB_Hospital) -> Bool in
                do {
                    
                    return p.loginUserR?.loginID == input.loginID
                }}
            
            if(filterprovider.count > 0)
            {
                Provider = filterprovider.last
            }
          }
          catch
          {
              
          }
      return Provider
    }
    
    
    func  fetchPatients()->[DB_Patient]
      {
      var Patients:[DB_Patient]?
          do
          {
            Patients = try context.fetch(DB_Patient.fetchRequest())
          }
          catch
          {
              
          }
      return Patients!
    }
    
    
    func  fetchIventory()->[DB_Inventory]
      {
      var InventoryItems:[DB_Inventory]?
          do
          {
            InventoryItems = try context.fetch(DB_Inventory.fetchRequest())
          }
          catch
          {
              
          }
      return InventoryItems!
    }
    
    func  AddLoginUsers(_ input:DB_Login)->DB_LoginSession
      {
      var LoginSession:DB_LoginSession?
          do
          {
           // let newUser = DB_Login(context: self.context)
          //  newUser.loginID = input.loginID
           // newUser.password = input.password
           // newUser.userType = input.userType
            try self.context.save()
            // prepare login session
            LoginSession = CreateLoginSession(input)
           // LoginSession = CreateLoginSession(newUser)
          }
          catch
          {
            print("Unexpected error: \(error).")
          }
      return LoginSession!
    }
    func  CreateLoginSession(_ input:DB_Login)->DB_LoginSession
      {
      var LoginSessions:DB_LoginSession?
          do
          {
            let newSession = DB_LoginSession(context: self.context)
            newSession.isLogin = true
           // newSession.user = input
            newSession.loginUserR = input
            try self.context.save()
            LoginSessions = newSession
          }
          catch
          {
              
          }
      return LoginSessions!
    }
    
    func  AddLoginSession(_ input:DB_LoginSession)->[DB_LoginSession]
      {
      var LoginSessions:[DB_LoginSession]?
          do
          {
            let newSession = DB_LoginSession(context: self.context)
            newSession.isLogin = input.isLogin
           // newSession.user = input.user
            try self.context.save()
            LoginSessions = try context.fetch(DB_LoginSession.fetchRequest())
          }
          catch
          {
              
          }
      return LoginSessions!
    }
    
    func  AddProvider(_ input:DB_Hospital)->[DB_Hospital]
      {
      var Providers:[DB_Hospital]?
          do
          {
           /* let newProvider = DB_Hospital(context: self.context)
            newProvider.hospitalName = input.hospitalName
            newProvider.aKa = input.aKa
            newProvider.addressLine1 = input.addressLine1
            newProvider.state = input.state
            newProvider.city = input.city
            newProvider.zipCode = input.zipCode
            newProvider.hospitalLocation = input.hospitalLocation
         //   newProvider.inventory = input.inventory
            newProvider.inventoryR = input.inventoryR
            newProvider.image = input.image
            newProvider.lattitude = input.lattitude
            newProvider.longitude = input.longitude
            // fetch all providers nd count
            newProvider.providerID =  Int16(fetchProviderss().count + 1)
            newProvider.loginUserR = AppDelegate.loginUser */
            try self.context.save()
            Providers = try context.fetch(DB_Hospital.fetchRequest())
          }
          catch
          {
              
          }
      return Providers!
    }
    
    func  UpdateProviderInformation(_ input:DB_Hospital)->[DB_Hospital]
      {
      var Providers:[DB_Hospital]?
          do
          {
            
           // fetchProviderss()
          //  let newProvider = DB_Hospital(context: self.context)
            AppDelegate.CurrentProvider!.hospitalName = input.hospitalName
            AppDelegate.CurrentProvider!.aKa = input.aKa
            AppDelegate.CurrentProvider!.addressLine1 = input.addressLine1
            AppDelegate.CurrentProvider!.state = input.state
            AppDelegate.CurrentProvider!.city = input.city
            AppDelegate.CurrentProvider!.zipCode = input.zipCode
            AppDelegate.CurrentProvider!.hospitalLocation = input.hospitalLocation
         //   newProvider.inventory = input.inventory
            AppDelegate.CurrentProvider!.inventoryR = input.inventoryR
            AppDelegate.CurrentProvider!.image = input.image
            AppDelegate.CurrentProvider!.lattitude = input.lattitude
            AppDelegate.CurrentProvider!.longitude = input.longitude
            // fetch all providers nd count
            AppDelegate.CurrentProvider!.providerID =  Int16(fetchProviderss().count + 1)
            AppDelegate.CurrentProvider!.loginUserR = AppDelegate.loginUser
            try self.context.save()
            Providers = try context.fetch(DB_Hospital.fetchRequest())
          }
          catch
          {
              
          }
      return Providers!
    }
    
    
    func  AddPatients(_ input:DB_Patient)->[DB_Patient]
      {
      var Patients:[DB_Patient]?
          do
          {
          /*  let newPatient = DB_Patient(context: self.context)
            newPatient.name = input.name
            newPatient.age = input.age
            newPatient.addressLine1 = input.addressLine1
            newPatient.state = input.state
            newPatient.city = input.city
            newPatient.zipCode = input.zipCode
            newPatient.phoneNo = input.phoneNo
            newPatient.isVaccined = input.isVaccined
            newPatient.image = input.image
            newPatient.lattitude = input.lattitude
            newPatient.longitude = input.longitude
            newPatient.patientID =  Int16(fetchPatients().count + 1) */
            try self.context.save()
            Patients = try context.fetch(DB_Patient.fetchRequest())
          }
          catch
          {
              
          }
      return Patients!
    }
    
    
    func  AddInventoryItem(_ input:DB_Inventory)->[DB_Inventory]
      {
      var InventoryItems:[DB_Inventory]?
          do
          {
          /* let newInventoryItem = DB_Inventory(context: self.context)
            newInventoryItem.covidVaccine = input.covidVaccine
            newInventoryItem.ppeKit = input.ppeKit
            newInventoryItem.testKit = input.testKit
            newInventoryItem.n95Masks = input.n95Masks
            newInventoryItem.inventoryID =  Int16(fetchIventory().count + 1)
            */
            InventoryItems = try context.fetch(DB_Inventory.fetchRequest())
          }
          catch
          {
              
          }
      return InventoryItems!
    }
    
    
    func  AddInventoryItem( _ provider: DB_Hospital,_ type:String, _ Quant:Int32)->Bool
      {
        var result = false;
          do
          {
            /*let inventories = dth.fetchIventory()
            
            let FilterData = inventories.filter { (invent: DB_Inventory) -> Bool in
                 do {
                    
                    return invent.provider?.providerID == AppDelegate.CurrentProvider?.providerID
                 }}
             if(FilterData.count > 1)
             {
                
             } */
            
         //   "Covid19 Vaccine","PPE  Kit","N95Masks", "Covid19 Test Kit"]
            if let existingInventories = provider.inventoryR {
            let newInventoryItem = DB_Inventory(context: self.context)
            if(type == "Covid19 Vaccine")
            { newInventoryItem.covidVaccine = existingInventories.covidVaccine + Quant}
            else if(type == "PPE  Kit")
            {  newInventoryItem.ppeKit = existingInventories.ppeKit + Quant}
            
            else if(type == "Covid19 Test Kit")
            {  newInventoryItem.testKit = existingInventories.testKit + Quant
            }
            else if(type == "N95Masks")
            {  newInventoryItem.n95Masks = existingInventories.n95Masks + Quant
            }
                newInventoryItem.inventoryID =   (existingInventories.inventoryID)
            provider.inventoryR = newInventoryItem
         
            }
            else{
                
                let newInventoryItem = DB_Inventory(context: self.context)
                newInventoryItem.covidVaccine =  0
                newInventoryItem.ppeKit =  0
                newInventoryItem.testKit =  0
                newInventoryItem.n95Masks =  0
                if(type == "Covid19 Vaccine")
                {
                    newInventoryItem.covidVaccine =  Quant
                }
                else if(type == "PPE  Kit")
                {
                    newInventoryItem.ppeKit =  Quant
                }
                else if(type == "Covid19 Test Kit")
                {
                    newInventoryItem.testKit =  Quant
                }
                else if(type == "N95Masks")
                {
                    newInventoryItem.n95Masks =  Quant
                }
                newInventoryItem.inventoryID =   provider.providerID
                provider.inventoryR = newInventoryItem
            }
            try context.save()
            result = true
           // InventoryItems = try context.fetch(DB_Inventory.fetchRequest())
          }
          catch
          {
            
          }
      return result
    }
    
    func  DeleteLoginUsers(_ input:DB_Login)->[DB_Login]
      {
      var LoginUsers:[DB_Login]?
          do
          {
            self.context.delete(input)
            try self.context.save()
            LoginUsers = try context.fetch(DB_Login.fetchRequest())
          }
          catch
          {
              
          }
      return LoginUsers!
    }
    
    func  DeleteLoginSession(_ input:DB_LoginSession)->[DB_LoginSession]
      {
      var LoginSessions:[DB_LoginSession]?
          do
          {
            self.context.delete(input)
            try self.context.save()
            LoginSessions = try context.fetch(DB_LoginSession.fetchRequest())
          }
          catch
          {
              
          }
      return LoginSessions!
    }
    
    func  DeleteProviderss(_ input:DB_Hospital)->[DB_Hospital]
      {
      var Providers:[DB_Hospital]?
          do
          {
            self.context.delete(input)
            try self.context.save()
            try self.context.save()
            Providers = try context.fetch(DB_Hospital.fetchRequest())
          }
          catch
          {
              
          }
      return Providers!
    }
    
    
    func  DeletePatients(_ input:DB_Patient)->[DB_Patient]
      {
      var Patients:[DB_Patient]?
          do
          {
            self.context.delete(input)
            try self.context.save()
            Patients = try context.fetch(DB_Patient.fetchRequest())
          }
          catch
          {
              
          }
      return Patients!
    }
    
    
    func  DeleteInventoryItem(_ input:DB_Inventory)->[DB_Inventory]
      {
      var InventoryItems:[DB_Inventory]?
          do
          {
            self.context.delete(input)
            try self.context.save()
            InventoryItems = try context.fetch(DB_Inventory.fetchRequest())
          }
          catch
          {
              
          }
      return InventoryItems!
    }
    
   /* func  AddProviderssInventory(_ input:DB_Hospital, _ inputInventory: DB_Inventory, _ itemName :String)->[DB_Hospital]
      {
      var Providers:[DB_Hospital]?
          do
          {
            let request = NSFetchRequest<DB_Hospital>(entityName: "DB_Hospital");
            // var request = DB_Hospital.fetchRequest() //as NSFetchRequest<DB_Hospital>
            let pred = NSPredicate(format: "providerID == %@", "\(input.providerID)" )
            request.predicate = pred
            let provider = context.fetch(request)
            let inventory = provider.inventoryR
            if(itemName == "CovidVaccine")
            {
                inventory.covidVaccine = inventory.covidVaccine + inputInventory.covidVaccine
            }
            if(itemName == "TestKit")
            {
                inventory.testKit =  inventory.testKit + inputInventory.testKit
            }
            if(itemName == "PPEKit")
            {
                inventory.ppeKit = inventory.ppeKit + inputInventory.ppeKit
            }
            if(itemName == "N95Masks")
            {
                inventory.n95Masks = inventory.n95Masks + inputInventory.n95Masks
            }
          //  let provider = DB_Hospital(context: self.context)
            provider.inventoryR = inventory
            try self.context.save()
            Providers = try context.fetch(DB_Hospital.fetchRequest())
          }
          catch
          {
              
          }
      return Providers!
    } */
    func  UpdateLoginUsers(_ input:DB_Login)->[DB_Login]
      {
      var LoginUsers:[DB_Login]?
          do
          {
            var updateUser = DB_Login(context: self.context)
            updateUser = input
            try self.context.save()
            LoginUsers = try context.fetch(DB_Login.fetchRequest())
          }
          catch
          {
              
          }
      return LoginUsers!
    }
    
    func  UpdateLoginSession(_ input:DB_LoginSession)->[DB_LoginSession]
      {
      var LoginSessions:[DB_LoginSession]?
          do
          {
           // let newSession = DB_LoginSession(context: self.context)
           
           // try self.context.save()
            LoginSessions = try context.fetch(DB_LoginSession.fetchRequest())
          }
          catch
          {
              
          }
      return LoginSessions!
    }
    
   
    
    
   
    
    
    
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    public func validaPhoneNumber() -> Bool {
        let phoneNumberRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = validatePhone.evaluate(with: trimmedString)
        return isValidPhone
     }
     public func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
     }
    
    var isPhoneNumber: Bool {
            do {
                let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
                let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
                if let res = matches.first {
                    return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
                } else {
                    return false
                }
            } catch {
                return false
            }
        }
    
}
