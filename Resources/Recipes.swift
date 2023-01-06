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
    var amount: String }
//["Guruch": "600 gram"],["Go'sht": "300gram"], ["Yog': 250gram"], ["Sabzi": "2-3 dona"], ["Piyoz": "1.5 dona"], ["No'xat": "250gram"], ["Sarimsoq": "1 dona"], ["Zira": "30-40 gram"]

struct CookingGuide{
    var step: Int
    var guide: String
}

struct Recipes  {
    let plov: Plov
}
struct Plov{
     let image = UIImage(named: "palov")
     let title = "Palov"
     let serving = 4
     let preparationTime = 60
     let info = "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi"
     let ingredients = [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )]
     let cookingGuide = [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]
}
