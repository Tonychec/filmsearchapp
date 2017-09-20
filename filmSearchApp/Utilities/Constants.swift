//
//  Constants.swift
//  filmSearchApp
//
//  Created by Nomad on 9/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let API_KEY = "api_key=1b082cd796d65577bbf0a6819ea5055a"
let URL_BASE = "https://api.themoviedb.org/3/"
let URL_GENRE = "\(URL_BASE)genre/movie/list?\(API_KEY)"
let URL_FOVARITE = "\(URL_BASE)discover/movie?\(API_KEY)"
let URL_SEARCH = "\(URL_BASE)search/movie?\(API_KEY)&query="
let URL_FILM_INFO = "\(URL_BASE)movie/"

