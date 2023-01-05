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
    var amount: Int }
//["Guruch": "600 gram"],["Go'sht": "300gram"], ["Yog': 250gram"], ["Sabzi": "2-3 dona"], ["Piyoz": "1.5 dona"], ["No'xat": "250gram"], ["Sarimsoq": "1 dona"], ["Zira": "30-40 gram"]

struct CookingGuide{
    var step: Int
    var guide: String
}

struct Recipes  {
    struct Plov{
        static let image = UIImage(named: "palov")
        static let title = "Palov"
        static let serving = 4
        static let preparationTime = 60
        static let info = "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi"
        static let ingredients = [Ingredients(name: "Guruch", amount: 600 ),Ingredients(name: "Go`sht", amount: 300 ),Ingredients(name: "Yog", amount: 250 ), Ingredients(name: "Sabzi", amount: 2 ),Ingredients(name: "Piyoz", amount: 1 ), Ingredients(name: "No`xat", amount: 250 ), Ingredients(name: "Sarimsoq", amount: 1 ), Ingredients(name: "Zira", amount: 40 )]
        static let cookingGuide = [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]
    }
    
}
