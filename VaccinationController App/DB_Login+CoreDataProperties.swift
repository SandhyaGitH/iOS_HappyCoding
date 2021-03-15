//
//  DB_Login+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Login> {
        return NSFetchRequest<DB_Login>(entityName: "DB_Login")
    }

    @NSManaged public var loginID: String?
    @NSManaged public var password: String?
    @NSManaged public var userType: String?
    @NSManaged public var loginSession: DB_LoginSession?
    @NSManaged public var patient: DB_Patient?
    @NSManaged public var provider: DB_Hospital?

}

extension DB_Login : Identifiable {

}
