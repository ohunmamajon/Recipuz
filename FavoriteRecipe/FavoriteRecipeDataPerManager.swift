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

        do {
            recipeList = try context.fetch(FavoriteRecipe.fetchRequest())

        } catch {
            print(error.localizedDescription)
        }
    }

    mutating func createRecipe(imageName: String, recipeName: String){
        let newRecipe = FavoriteRecipe(context: context)
        newRecipe.imageName = imageName
        newRecipe.recipeName = recipeName
        newRecipe.isLiked = true
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
