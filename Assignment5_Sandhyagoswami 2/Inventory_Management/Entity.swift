//
//  Entity.swift
//  Inventory_Management
//
//  Created by Samarth chaturvedi on 10/22/20.
//

import Cocoa

protocol Entity {
   // <#requirements#>
    
    func Add(_ inventObj:Inventory)
    func Delete(_ inventObj:Inventory)
    func Update(_ inventObj:Inventory)
    func ViewAll(_ inventObj:Inventory)
}
