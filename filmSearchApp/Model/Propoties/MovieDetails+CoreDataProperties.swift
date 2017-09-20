//
//  MovieDetails+CoreDataProperties.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//
//

import Foundation
import CoreData


extension MovieDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDetails> {
        return NSFetchRequest<MovieDetails>(entityName: "MovieDetails")
    }

    @NSManaged public var addDate: NSDate?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var releaseDate: String?
    @NSManaged public var tagline: String?
    @NSManaged public var relationship: Movie?

}
