//
//  WordModelView.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 23.10.23.
//

import Foundation

class WordModelView {
    
    func addData(model: WordModel) {
        CoreDataService().addDataToCoreData(model: model)
        NotificationCenter.default.post(name: NSNotification.Name("new data added"), object: nil)
    }
    
    func fetchData() -> [WordModel] {
        let words = CoreDataService().fetchDataFromCoreData()
        return words
    }
    
    func fetchItem(id: UUID) -> WordModel {
        let wordModel = CoreDataService().fetchItemFromCoreData(id: id)
        return wordModel
    }
    
}
