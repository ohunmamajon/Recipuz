//
//  DataPersistenceManager.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/09.
//

import Foundation
import CoreData
import UIKit
struct ItemDataPersistenceManager{
    static var shared = ItemDataPersistenceManager()
    var models = [Item]()
    
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

    
    
    mutating func getAllItems(){
        let sort = NSSortDescriptor(key: "createdDate", ascending: false)
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [sort]

        do {
            models = try context.fetch(request)
            
        } catch {
            print(error.localizedDescription)
        }
    }

    mutating func createItem(name: String){
        let newItem = Item(context: context)
        newItem.name = name
        newItem.createdDate = Date()
        newItem.isDone = false

        do {
           try context.save()
            getAllItems()
        } catch {
            print(error.localizedDescription)
        }
    }
    mutating func deleteItem(item: Item){
        context.delete(item)
        do {
           try context.save()
            getAllItems()
        } catch {
            print(error.localizedDescription)
        }
    }
    mutating func updateItem(item: Item, newName: String){
        item.name = newName
        do {
           try context.save()
            getAllItems()
        } catch {
            print(error.localizedDescription)
        }
    }
    mutating func updateDone(item: Item){
        item.isDone.toggle()
        do {
           try context.save()
            getAllItems()
        } catch {
            print(error.localizedDescription)
        }
    }
    
   
}

