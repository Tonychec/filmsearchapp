//
//  Movie+CoreDataProperties.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var overview: String?
    @NSManaged public var title: String?
    @NSManaged public var relationship: NSSet?
    @NSManaged public var relationship1: MovieDetails?

}

// MARK: Generated accessors for relationship
extension Movie {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: FilmGenre)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: FilmGenre)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}
