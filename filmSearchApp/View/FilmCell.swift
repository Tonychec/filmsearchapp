//
//  FilmCell.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

enum PopFovPick {
    case popular
    case favorite
    case sorted
}

class FilmCell: UITableViewCell {

    //outlets
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var filmImg: UIImageView!
    @IBOutlet weak var favoriteBtn: CircleBtn!
    
    
    //Variables
    var currentCell: Int!
    var currentFilmList: PopFovPick!
    var isFov: Bool!
    
    @IBAction func favoriteBtnPressed(_ sender: Any) {
        DataServise.instance.favoriteSet(currentList: currentFilmList, currentCellId: currentCell)
        isFov = !isFov
        checkBtnColor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
        checkBtnColor()
    }
    
    func configureCell(film: Movie, cellId: Int, list: PopFovPick){
        filmTitle.text = film.title
        overview.text = film.overview
        id.text = "\(cellId)"
        currentCell = cellId
        currentFilmList = list
        
        if let tempImg = film.image as? UIImage {
            filmImg.image = tempImg
        }
        
        isFov = film.relationship1?.isFavorite
        checkBtnColor()
    }
    
    func checkBtnColor () {
        if isFov! {
            favoriteBtn.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        } else {
            favoriteBtn.backgroundColor = UIColor.clear
        }
    }
}
