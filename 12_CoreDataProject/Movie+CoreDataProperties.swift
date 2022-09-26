//
//  Movie+CoreDataProperties.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Uknown title"
    }
}

extension Movie : Identifiable {

}
