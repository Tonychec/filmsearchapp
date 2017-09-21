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
    public var searchList = [Movie]()
    public var tempSortedList = [Movie]()
    
    //to do saving data
    //dont work(((
//    MagicalRecord.saveWithBlock {
//    (localContext) in
//    let movie = Movie.MR_importFromObject(favoriteList, inContext: localContext)
//    }
    
    func sortList(list: [Movie], genre: String) {
        var tempList = [Movie]()
        for element in list {
            for filmGenre in element.relationship! {
                if (filmGenre as! FilmGenre).id == genre {
                    tempList.append(element)
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
    
    func favoriteSet(currentList: PopFovPick, currentCellId: Int) {
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
    
    func createFilm(id: String, imageAdress: String, overview: String, title: String) -> Movie {
        let newFilm = Movie.mr_createEntity()!

        newFilm.id = id
        newFilm.overview = overview
        newFilm.title = title
        newFilm.image = UIImage(named: "comingSoon")

        let url = URL(string: "\(URL_IMG)\(imageAdress)")!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    newFilm.image = UIImage(data: data)
                }
            } catch {
                //handele the error
            }
        }

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
}

