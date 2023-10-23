//
//  CoreDataService.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 23.10.23.
//

import Foundation
import UIKit
import CoreData


class CoreDataService {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        .viewContext
    
    func addDataToCoreData(model: WordModel) {
        
        let newWord = Words(context: context)
        newWord.inForeignLanguage = model.inForeignLanguage
        newWord.meaning = model.meaning
        newWord.id = model.id
        
        do {
            try context.save()
        } catch {
            print("add data error")
        }
        
    }
    
    func fetchDataFromCoreData() -> [WordModel] {
        
        let request = Words.fetchRequest()
        var words = [WordModel]()
        
        do {
            let results = try context.fetch(request)
            for result in results as [NSManagedObject] {
                let inForeignLanguage = result.value(forKey: "inForeignLanguage") as! String
                let meaning = result.value(forKey: "meaning") as! String
                let id = result.value(forKey: "id") as! UUID
                
                let wordModel = WordModel(inForeignLanguage: inForeignLanguage, meaning: meaning, id: id)
                words.append(wordModel)
            }
        } catch {
            print("fetch error")
        }
        
        return words
        
    }
    
    func fetchItemFromCoreData(id: UUID) -> WordModel {
        
        var wordModel = WordModel(inForeignLanguage: "", meaning: "", id: UUID())
        
        let request = Words.fetchRequest()
        let stringID = id.uuidString
        request.predicate = NSPredicate(format: "id = %@", stringID)
        
        do {
            let result = try context.fetch(request)
            for resultItem in result as [NSManagedObject] {
                wordModel.inForeignLanguage = resultItem.value(forKey: "inForeignLanguage") as! String
                wordModel.meaning = resultItem.value(forKey: "meaning") as! String
                wordModel.id = resultItem.value(forKey: "id") as! UUID
            }
        } catch {
            print("fetch item error")
        }
        
        return wordModel
        
    }
    
}
