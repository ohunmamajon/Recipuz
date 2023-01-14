//
//  FavoriteRecipeDataPerManager.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/15.
//

import Foundation
import UIKit
import CoreData
struct FavoriteRecipeDataPerManager {
    
    static var shared = FavoriteRecipeDataPerManager()
    var recipeList = [FavoriteRecipe]()
    
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

     

    
    mutating func getAllRecipes(){
        
        let sort = NSSortDescriptor(key: "date", ascending: false)
        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        request.sortDescriptors = [sort]
        
        do {
            recipeList = try context.fetch(request)

        } catch {
            print(error.localizedDescription)
        }
    }

    mutating func createRecipe(imageName: String, recipeName: String){
        let newRecipe = FavoriteRecipe(context: context)
        newRecipe.imageName = imageName
        newRecipe.recipeName = recipeName
        newRecipe.isLiked = true
        newRecipe.date = Date()
        do {
           try context.save()
            getAllRecipes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
   
    
    mutating func deleteRecipe(recipeName: String){
        
        for recipe in recipeList {
            if recipeName == recipe.recipeName {
                context.delete(recipe)
                do {
                    try context.save()
                    getAllRecipes()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
     func CheckIfLiked(recipeName: String) -> Bool {
        var isLiked = false
        for recipe in recipeList {
            if recipeName == recipe.recipeName {
                isLiked = recipe.isLiked
            }
        }
        return isLiked
    }

}
