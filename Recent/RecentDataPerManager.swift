//
//  RecenntDataPerManager.swift
//  My app
//
//  Created by Sarvar on 2023/01/16.
//

import Foundation
import CoreData
import UIKit
struct RecentDataPerManager{
    
    static var shared = RecentDataPerManager()
    var recentList = [RecentRecipe]()
    
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

     

    
    mutating func getRecentList(){
        
        let sort = NSSortDescriptor(key: "date", ascending: false)
        let request : NSFetchRequest<RecentRecipe> = RecentRecipe.fetchRequest()
        request.sortDescriptors = [sort]
        
        do {
            recentList = try context.fetch(request)

        } catch {
            print(error.localizedDescription)
        }
    }

    mutating func createRecent(imageName: String, recipeName: String){
        let newRecipe = RecentRecipe(context: context)
        newRecipe.recipeName = recipeName
        newRecipe.imageName = imageName
        newRecipe.date = Date()
        newRecipe.isRecent = true
        do {
           try context.save()
            getRecentList()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    mutating func makeMostRecent(recipeName: String){
        for recent in recentList {
            if recipeName == recent.recipeName {
                recent.date = Date()
            }
        }
    }
    func checkIfRecent(recipeName: String) -> Bool {
        var isRecent = false
        for recent in recentList {
            if recipeName == recent.recipeName {
               isRecent = true
            }
        }
        return isRecent
    }
    
    
    mutating func deleteRecent(recipeName: String){
        
        for recent in recentList {
            if recent.recipeName == recipeName {
                context.delete(recent)
                do {
                    try context.save()
                    getRecentList()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
