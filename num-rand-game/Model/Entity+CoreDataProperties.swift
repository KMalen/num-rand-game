//
//  Entity+CoreDataProperties.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 24.03.21.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var previous_score: Int16
    @NSManaged public var ref_firebase_id: String?

}

extension Entity : Identifiable {

}
