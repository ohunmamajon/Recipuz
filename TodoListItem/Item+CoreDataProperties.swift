//
//  Item+CoreDataProperties.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/09.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }


    @NSManaged public var createdDate: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var name: String?


}

extension Item : Identifiable {

}
