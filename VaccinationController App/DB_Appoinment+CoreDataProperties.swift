//
//  DB_Appoinment+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_Appoinment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Appoinment> {
        return NSFetchRequest<DB_Appoinment>(entityName: "DB_Appoinment")
    }

    @NSManaged public var appointmentDate: Date?
    @NSManaged public var appointmentID: Int16
    @NSManaged public var patient: DB_Patient?
    @NSManaged public var provider: DB_Hospital?

}

extension DB_Appoinment : Identifiable {

}
