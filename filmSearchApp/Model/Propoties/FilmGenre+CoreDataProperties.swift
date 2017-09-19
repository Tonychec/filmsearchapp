//
//  FilmGenre+CoreDataProperties.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//
//

import Foundation
import CoreData


extension FilmGenre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FilmGenre> {
        return NSFetchRequest<FilmGenre>(entityName: "FilmGenre")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension FilmGenre {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Movie)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Movie)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}
