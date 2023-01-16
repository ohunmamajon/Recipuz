//
//  Recipes.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/31.
//

import Foundation
import UIKit


struct Ingredients{
    var name: String
    var amount: String
}

struct CookingGuide{
    var step: Int
    var guide: String
}

struct Recipe{
    let title: String
    let imageName: String
    let serving : Int
    let preparationTime : Int
    let info: String
    let ingredients: [Ingredients]
    let cookingGuide: [CookingGuide]
}
struct Recipes{
    
    static let shared = Recipes()

    func findRecipe(recipeName: String) -> Recipe {
        var item : Recipe?
        for recipe in uzbekMeals {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in westernMeals {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in desserts {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in cakes {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        return item!
    }
    
    let uzbekMeals: [Recipe] = [
   Recipe(title: "Palov", imageName:"palov", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
   Recipe(title: "Mastava", imageName:"mastava", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
   Recipe(title: "Lagman", imageName:"lagman", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]
    


   let westernMeals : [Recipe] = [
       Recipe(title: "Pizza", imageName: "pizza", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
       Recipe(title: "Hamburger", imageName:"hamburger", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]


   let desserts: [Recipe] = [
       Recipe(title: "Egg tart", imageName: "eggtart", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
       Recipe(title: "Pudding", imageName: "pudding", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]


   let cakes: [Recipe] = [
       Recipe(title: "Chocolate cake", imageName: "chocolatecake", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
       Recipe(title: "Strawberry Cake", imageName: "strawberrycake", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]

}

 
