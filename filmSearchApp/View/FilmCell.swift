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
    var currentCellId: Int?
    var currentFilmList: PopFovPick?
    
    
    //to do add for .sorted
    @IBAction func favoriteBtnPressed(_ sender: Any) {
        if currentFilmList == .favorite {
            let film = DataServise.instance.favoriteList[currentCellId!]
            film.relationship1?.isFavorite = !(film.relationship1?.isFavorite)!
            DataServise.instance.favoriteList.remove(at: currentCellId!)
        } else {
            let film = DataServise.instance.popList[currentCellId!]
            film.relationship1?.isFavorite = !(film.relationship1?.isFavorite)!
            if (film.relationship1?.isFavorite)! {
                DataServise.instance.favoriteList.append(film)
            } else {
                let id = DataServise.instance.favoriteList.index(of: film)
                DataServise.instance.favoriteList.remove(at: id!)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
        
    }
    
    func configureCell(film: Movie, cellId: Int, list: PopFovPick){
        filmTitle.text = film.title
        overview.text = film.overview
        id.text = "\(cellId)"
        currentCellId = cellId
        currentFilmList = list
        
        if let tempImg = film.image as? UIImage {
            filmImg.image = tempImg
        }
        
        let isFov = film.relationship1?.isFavorite
        if isFov! {
            favoriteBtn.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        } else {
            favoriteBtn.backgroundColor = UIColor.clear
        }
    }
}
