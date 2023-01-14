//
//  EventDataPersistenceManager.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/13.
//

import Foundation
import UIKit
import CoreData
struct NoteDataPersistenceManager {
    static var shared = NoteDataPersistenceManager()
    var noteList = [Note]()
    
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

      func NotesForDate(date: Date) -> [Note] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
          let newDate = dateFormatter.string(from: date)
        var daysNotes = [Note]()
        for note in noteList {
            let updatedNoteDate = dateFormatter.string(from: note.date!)
            if (updatedNoteDate == newDate)
            {
                daysNotes.append(note)
            }
             
        }
        return daysNotes
    }

    
    mutating func getAllNotes(){
        let sort = NSSortDescriptor(key: "date", ascending: true)
        let request : NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [sort]
        do {
            noteList = try context.fetch(request)

        } catch {
            print(error.localizedDescription)
        }
    }

    mutating func createNote(name: String, date: Date){
        let newNote = Note(context: context)
        newNote.name = name
        newNote.date = date

        do {
           try context.save()
            getAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    mutating func deleteNote(note: Note){
        context.delete(note)
        do {
           try context.save()
            getAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    mutating func updateNote(note: Note, newName: String){
        note.name = newName
        do {
           try context.save()
            getAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    

}
