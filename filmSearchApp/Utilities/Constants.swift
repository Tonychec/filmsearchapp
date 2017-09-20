//
//  Constants.swift
//  filmSearchApp
//
//  Created by Nomad on 9/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Enums
enum PopFovPick {
    case popular
    case favorite
    case sorted
    case search
}

// URL Constants
let API_KEY = "api_key=1b082cd796d65577bbf0a6819ea5055a"
let URL_BASE = "https://api.themoviedb.org/3/"
let URL_GENRE = "\(URL_BASE)genre/movie/list?\(API_KEY)"
let URL_FOVARITE = "\(URL_BASE)discover/movie?\(API_KEY)"
let URL_SEARCH = "\(URL_BASE)search/movie?\(API_KEY)&query="
let URL_FILM_INFO = "\(URL_BASE)movie/"
let URL_IMG = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"

// Segue
let TO_SEARCH_VC = "toSearchVC"

//Strings
let EMPTY_SEARCH_LIST = "Write the name of the movie and click the search button"
let EMPTY_SEARCH_LABEL = "Ooops, it seems you have no idea for search"
let EMPTY_FOVARITE = "There are no favorite films yet."
let EMPTY_POPULAR = "It seems there is no internet connection, something went wrong."
let EMPTY_GENRE = "Looks like there are no movies in this category, choose a different genre."
