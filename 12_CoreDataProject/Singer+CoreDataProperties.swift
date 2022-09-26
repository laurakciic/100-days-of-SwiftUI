//
//  Singer+CoreDataProperties.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Uknown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Uknown"
    }
}

extension Singer : Identifiable {

}
