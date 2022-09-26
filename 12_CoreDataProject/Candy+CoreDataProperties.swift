//
//  Candy+CoreDataProperties.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Uknown candy"
    }
}

extension Candy : Identifiable {

}
