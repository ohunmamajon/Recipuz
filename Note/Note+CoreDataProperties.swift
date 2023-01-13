//
//  Note+CoreDataProperties.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/13.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

extension Note : Identifiable {

}
