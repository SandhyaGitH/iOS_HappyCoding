//
//  DB_Inventory+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_Inventory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_Inventory> {
        return NSFetchRequest<DB_Inventory>(entityName: "DB_Inventory")
    }

    @NSManaged public var covidVaccine: Int32
    @NSManaged public var inventoryID: Int16
    @NSManaged public var n95Masks: Int32
    @NSManaged public var ppeKit: Int32
    @NSManaged public var testKit: Int32
    @NSManaged public var provider: DB_Hospital?

}

extension DB_Inventory : Identifiable {

}
