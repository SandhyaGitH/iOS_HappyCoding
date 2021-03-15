//
//  DB_Hospital+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_Hospital {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Hospital> {
        return NSFetchRequest<DB_Hospital>(entityName: "DB_Hospital")
    }

    @NSManaged public var addressLine1: String?
    @NSManaged public var aKa: String?
    @NSManaged public var city: String?
    @NSManaged public var hospitalLocation: String?
    @NSManaged public var hospitalName: String?
    @NSManaged public var image: Data?
    @NSManaged public var lattitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var providerID: Int16
    @NSManaged public var state: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var appointments: NSSet?
    @NSManaged public var inventoryR: DB_Inventory?
    @NSManaged public var inventoryRequests: Db_InventoryRequest?
    @NSManaged public var loginUserR: DB_Login?

}

// MARK: Generated accessors for appointments
extension DB_Hospital {

    @objc(addAppointmentsObject:)
    @NSManaged public func addToAppointments(_ value: DB_Appoinment)

    @objc(removeAppointmentsObject:)
    @NSManaged public func removeFromAppointments(_ value: DB_Appoinment)

    @objc(addAppointments:)
    @NSManaged public func addToAppointments(_ values: NSSet)

    @objc(removeAppointments:)
    @NSManaged public func removeFromAppointments(_ values: NSSet)

}

extension DB_Hospital : Identifiable {

}
