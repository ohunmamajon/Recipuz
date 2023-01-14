//
//  FavoriteRecipe+CoreDataProperties.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/15.
//
//

import Foundation
import CoreData


extension FavoriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteRecipe> {
        return NSFetchRequest<FavoriteRecipe>(entityName: "FavoriteRecipe")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var recipeName: String?
    @NSManaged public var isLiked: Bool
}

extension FavoriteRecipe : Identifiable {

}
