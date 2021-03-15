//
//  DB_Patient+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_Patient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Patient> {
        return NSFetchRequest<DB_Patient>(entityName: "DB_Patient")
    }

    @NSManaged public var addressLine1: String?
    @NSManaged public var age: Int16
    @NSManaged public var city: String?
    @NSManaged public var completeAddress: String?
    @NSManaged public var image: Data?
    @NSManaged public var isVaccined: Bool
    @NSManaged public var lattitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var patientID: Int16
    @NSManaged public var phoneNo: String?
    @NSManaged public var state: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var appointment: DB_Appoinment?
    @NSManaged public var loginUserR: DB_Login?

}

extension DB_Patient : Identifiable {

}
