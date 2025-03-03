//
//  ElementoLista+CoreDataProperties.swift
//  testCoreData
//
//  Created by Eduard Alexis Cardona Grajales on 28/2/25.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
