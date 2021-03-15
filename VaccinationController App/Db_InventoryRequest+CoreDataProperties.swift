//
//  Db_InventoryRequest+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension Db_InventoryRequest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Db_InventoryRequest> {
        return NSFetchRequest<Db_InventoryRequest>(entityName: "Db_InventoryRequest")
    }

    @NSManaged public var approvedData: Date?
    @NSManaged public var item: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var quantityApproved: Int32
    @NSManaged public var requestDate: Date?
    @NSManaged public var requestID: Int16
    @NSManaged public var isApproved: Bool
    @NSManaged public var provider: DB_Hospital?

}

extension Db_InventoryRequest : Identifiable {

}
