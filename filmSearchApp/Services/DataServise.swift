//
//  DataServise.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataServise {
    static let instance = DataServise()
    
    public var popList = [Movie]()
    public var favoriteList = [Movie]()
    public var genreList = [FilmGenre]()
    
    func setDefFilm() {
        var film: Movie = Movie.mr_createEntity()!
        var movDet: MovieDetails = MovieDetails.mr_createEntity()!
        
        film.relationship1 = movDet
        
        film.title = "First Film"
        film.id = 42
        film.image = UIImage(named: "comingSoon")
        film.overview = "Add some film plz"
        film.relationship1?.isFavorite = true
        
        popList.append(film)
        favoriteList.append(film)
    }
}
