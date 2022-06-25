//
//  Pessoa+CoreDataProperties.swift
//  aula_CoreData
//
//  Created by Jessica Santana on 24/06/22.
//
//

import Foundation
import CoreData


extension Pessoa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pessoa> {
        return NSFetchRequest<Pessoa>(entityName: "Pessoa")
    }

    @NSManaged public var nome: String?
    @NSManaged public var idade: Int16

}

extension Pessoa : Identifiable {

}
