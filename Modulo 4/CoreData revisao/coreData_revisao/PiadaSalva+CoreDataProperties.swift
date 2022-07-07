//
//  PiadaSalva+CoreDataProperties.swift
//  
//
//  Created by Jessica Santana on 06/07/22.
//
//

import Foundation
import CoreData


extension PiadaSalva {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PiadaSalva> {
        return NSFetchRequest<PiadaSalva>(entityName: "PiadaSalva")
    }

    @NSManaged public var categoria: String?
    @NSManaged public var tipo: String?
    @NSManaged public var joke: String?
    @NSManaged public var setup: String?
    @NSManaged public var delivery: String?
    @NSManaged public var id: Int16

}
