//
//  SearchFilmCell.swift
//  filmSearchApp
//
//  Created by Nomad on 9/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class SearchFilmCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var celTitleTxt: UILabel!
    
    func configureCell(film: Movie) {
        cellImg.image = (film.image as! UIImage)
        celTitleTxt.text = film.title
    }
}
