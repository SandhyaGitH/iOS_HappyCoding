//
//  Entity.swift
//  EmptyApp
//
//  Created by Samarth chaturvedi on 11/1/20.
//  Copyright © 2020 rab. All rights reserved.
//

import Foundation
protocol Entity {
   // <#requirements#>
    
    func Add(_ inventObj:Inventory)
    func Delete(_ inventObj:Inventory)
    func Update(_ inventObj:Inventory)
    func ViewAll(_ inventObj:Inventory)
}
