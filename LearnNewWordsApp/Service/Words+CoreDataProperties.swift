//
//  Words+CoreDataProperties.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 23.10.23.
//
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var inForeignLanguage: String?
    @NSManaged public var meaning: String?

}

extension Words : Identifiable {

}
