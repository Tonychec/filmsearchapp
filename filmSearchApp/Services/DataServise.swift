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
    
    // to do - check error in favoriteList sort
    func sortList(list: [Movie], genre: String) {
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
    
    func updateGenreList(newList: [FilmGenre]) {
        var tmpList = [FilmGenre]()
        let noneGenre = FilmGenre.mr_createEntity()!
        noneGenre.id = ""
        noneGenre.name = "Chouse Genre"
        
        tmpList.append(noneGenre)
        tmpList.append(contentsOf: newList)
        self.genreList = tmpList
    }
    
    //to do add for .sorted
    func favoriteSet (currentList: PopFovPick, currentCellId: Int) {
        if currentList == .favorite {
            let film = DataServise.instance.favoriteList[currentCellId]
            film.relationship1?.isFavorite = !(film.relationship1?.isFavorite)!
            DataServise.instance.favoriteList.remove(at: currentCellId)
        } else {
            let film = DataServise.instance.popList[currentCellId]
            film.relationship1?.isFavorite = !(film.relationship1?.isFavorite)!
            if (film.relationship1?.isFavorite)! {
                DataServise.instance.favoriteList.append(film)
            } else {
                let id = DataServise.instance.favoriteList.index(of: film)
                DataServise.instance.favoriteList.remove(at: id!)
            }
        }
    }
    
    func createFilm(id: String, image: String, overview: String, title: String) -> Movie {
        let newFilm = Movie.mr_createEntity()!

        newFilm.id = id
        newFilm.image = image
        newFilm.overview = overview
        newFilm.title = title
        return newFilm
    }
    
    func createGenre(id: String) -> FilmGenre {
        let filmGenre = FilmGenre.mr_createEntity()!
        
        filmGenre.id = id
        return filmGenre
    }
    
    func createDetails(releaseDate: String) -> MovieDetails {
        let filmDetails = MovieDetails.mr_createEntity()!
        
        filmDetails.isFavorite = false
        filmDetails.releaseDate = releaseDate
        
        return filmDetails
    }
    
    func setDef() {
        
        var film: Movie = Movie.mr_createEntity()!
        var movDet: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr.id = "0"
        
        film.relationship1 = movDet
        film.addToRelationship(filmGenr)
        
        film.title = "First Film"
        film.id = "42"
        film.image = "comingSoon"
        film.overview = " filmGenr - 0 "
        film.relationship1!.isFavorite = false
        
        popList.append(film)
        
        
        var film2: Movie = Movie.mr_createEntity()!
        var movDet2: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr2: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr2.id = "1"
        
        film2.relationship1 = movDet2
        film2.addToRelationship(filmGenr2)
        
        film2.title = "second Film"
        film2.id = "4221"
        film2.image = "comingSoon"
        film2.overview = " filmGenr - 1 "
        film2.relationship1?.isFavorite = true
        
        popList.append(film2)
        favoriteList.append(film2)
        
        var film3: Movie = Movie.mr_createEntity()!
        var movDet3: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr3: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr3.id = "2"
        
        film3.relationship1 = movDet3
        film3.addToRelationship(filmGenr)
        film3.addToRelationship(filmGenr3)
        
        film3.title = "third Film"
        film3.id = "4221"
        film3.image = "comingSoon"
        film3.overview = " filmGenr - 0, 2 "
        film3.relationship1?.isFavorite = true
        
        popList.append(film3)
        favoriteList.append(film3)
        
        var film4: Movie = Movie.mr_createEntity()!
        var movDet4: MovieDetails = MovieDetails.mr_createEntity()!
        var filmGenr4: FilmGenre = FilmGenre.mr_createEntity()!
        filmGenr4.id = "3"
        
        film4.relationship1 = movDet4
        film4.addToRelationship(filmGenr4)
        
        film4.title = "fourth Film"
        film4.id = "4221"
        film4.image = "comingSoon"
        film4.overview = " filmGenr - 3 "
        film4.relationship1?.isFavorite = false
        
        popList.append(film4)
        
        
        var genre1: FilmGenre = FilmGenre.mr_createEntity()!
        var genre2: FilmGenre = FilmGenre.mr_createEntity()!
        var genre3: FilmGenre = FilmGenre.mr_createEntity()!
        var genre4: FilmGenre = FilmGenre.mr_createEntity()!
        
        genre1.id = "0"
        genre1.name = "first"
        genre2.id = "1"
        genre2.name = "new on"
        genre3.id = "2"
        genre3.name = "one more"
        genre4.id = "3"
        genre4.name = "and some one"
        
        genreList.append(genre1)
        genreList.append(genre2)
        genreList.append(genre3)
        genreList.append(genre4)
        
    }
}
