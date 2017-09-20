//
//  MyRequestServise.swift
//  filmSearchApp
//
//  Created by Nomad on 9/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MyRequestServise {
    static let  instance = MyRequestServise()
    
    func getGenre(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GENRE).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = JSON(data: data)
                var tmpList = [FilmGenre]()
                
                for object in json {
                    for obj in object.1 {
                        let genr = FilmGenre.mr_createEntity()!
                        genr.id = obj.1["id"].stringValue
                        genr.name = obj.1["name"].stringValue
                        tmpList.append(genr)
                    }
                }
                DataServise.instance.updateGenreList(newList: tmpList)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getFovariteList(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_FOVARITE).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = JSON(data: data)
                var newList = [Movie]()
                for object in json {
                    for obj in object.1 {
                        let newFilm = DataServise.instance.createFilm(id: obj.1["id"].stringValue, imageAdress: obj.1["poster_path"].stringValue, overview: obj.1["overview"].stringValue, title: obj.1["title"].stringValue)
                        let filmDetails = DataServise.instance.createDetails(releaseDate: obj.1["release_date"].stringValue)
                        newFilm.relationship1 = filmDetails
                        
                        for element in obj.1["genre_ids"] {
                            var flag = true
                            for elem in DataServise.instance.genreList {
                                if elem.id == element.1.stringValue {
                                    newFilm.addToRelationship(elem)
                                    flag = false
                                }
                            }
                            if flag {
                                let filmGenre = DataServise.instance.createGenre(id: element.1.stringValue)
                                DataServise.instance.genreList.append(filmGenre)
                                newFilm.addToRelationship(filmGenre)
                            }
                        }
                        newList.append(newFilm)
                    }
                }
                DataServise.instance.popList = newList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
