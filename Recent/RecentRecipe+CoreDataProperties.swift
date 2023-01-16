//
//  RecentRecipe+CoreDataProperties.swift
//  My app
//
//  Created by Sarvar on 2023/01/16.
//
//

import Foundation
import CoreData


extension RecentRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentRecipe> {
        return NSFetchRequest<RecentRecipe>(entityName: "RecentRecipe")
    }

    @NSManaged public var recipeName: String?
    @NSManaged public var imageName: String?
    @NSManaged public var date: Date?
    @NSManaged public var isRecent: Bool

}

extension RecentRecipe : Identifiable {

}
