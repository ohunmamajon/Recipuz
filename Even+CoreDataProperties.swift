//
//  Even+CoreDataProperties.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/13.
//
//

import Foundation
import CoreData


extension Even {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Even> {
        return NSFetchRequest<Even>(entityName: "Even")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

extension Even : Identifiable {

}
