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
import MagicalRecord

class DataServise {
    static let instance = DataServise()
    
    public var popList = [Movie]()
    public var favoriteList = [Movie]()
    public var genreList = [FilmGenre]()
    public var tempSortedList = [Movie]()
    
    
    func sortList(list: [Movie], genre: Int) {
        var tempList = [Movie]()
        for element in list {
            if let filmGenres = element.relationship?.allObjects {
                for filmGenre in filmGenres {
                    let currentFilmGenre = filmGenre as! FilmGenre
                        if currentFilmGenre.id == genre {
                        tempList.append(element)
                    }
                }
            }
        }
        tempSortedList = tempList
    }
    
    func setDef() {
        
        var film: Movie = Movie.mr_createEntity()!
        var movDet: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr.id = 0
        
        film.relationship1 = movDet
        film.addToRelationship(filmGenr)
        
        film.title = "First Film"
        film.id = 42
        film.image = UIImage(named: "comingSoon")
        film.overview = " filmGenr - 0 "
        film.relationship1!.isFavorite = false
        
        popList.append(film)
        
        
        var film2: Movie = Movie.mr_createEntity()!
        var movDet2: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr2: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr2.id = 1
        
        film2.relationship1 = movDet2
        film2.addToRelationship(filmGenr2)
        
        film2.title = "second Film"
        film2.id = 4221
        film2.image = UIImage(named: "comingSoon")
        film2.overview = " filmGenr - 1 "
        film2.relationship1?.isFavorite = true
        
        popList.append(film2)
        favoriteList.append(film2)
        
        var film3: Movie = Movie.mr_createEntity()!
        var movDet3: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr3: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr3.id = 2
        
        film3.relationship1 = movDet3
        film3.addToRelationship(filmGenr)
        film3.addToRelationship(filmGenr3)
        
        film3.title = "second Film"
        film3.id = 4221
        film3.image = UIImage(named: "comingSoon")
        film3.overview = " filmGenr - 0, 2 "
        film3.relationship1?.isFavorite = true
        
        popList.append(film3)
        favoriteList.append(film3)
        
        var film4: Movie = Movie.mr_createEntity()!
        var movDet4: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr4: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr4.id = 3
        
        film4.relationship1 = movDet4
        film4.addToRelationship(filmGenr4)
        
        film4.title = "second Film"
        film4.id = 4221
        film4.image = UIImage(named: "comingSoon")
        film4.overview = " filmGenr - 3 "
        film4.relationship1?.isFavorite = false
        
        popList.append(film4)
        
        
        var genre1: FilmGenre = FilmGenre.mr_createEntity()!
        var genre2: FilmGenre = FilmGenre.mr_createEntity()!
        var genre3: FilmGenre = FilmGenre.mr_createEntity()!
        var genre4: FilmGenre = FilmGenre.mr_createEntity()!
        
        genre1.id = 0
        genre1.name = "first"
        genre2.id = 1
        genre2.name = "new on"
        genre3.id = 2
        genre3.name = "one more"
        genre4.id = 3
        genre4.name = "and some one"
        
        genreList.append(genre1)
        genreList.append(genre2)
        genreList.append(genre3)
        genreList.append(genre4)
        
    }
}
