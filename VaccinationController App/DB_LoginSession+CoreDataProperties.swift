//
//  DB_LoginSession+CoreDataProperties.swift
//  FinalProject_Phase2
//
//  Created by Samarth chaturvedi on 12/13/20.
//
//

import Foundation
import CoreData


extension DB_LoginSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DB_LoginSession> {
        return NSFetchRequest<DB_LoginSession>(entityName: "DB_LoginSession")
    }

    @NSManaged public var isLogin: Bool
    @NSManaged public var sessionID: Int16
    @NSManaged public var loginUserR: DB_Login?

}

extension DB_LoginSession : Identifiable {

}
