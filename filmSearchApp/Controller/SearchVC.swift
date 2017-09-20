//
//  SearchVC.swift
//  filmSearchApp
//
//  Created by Nomad on 9/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Outlets
    @IBOutlet weak var searchTitleTxt: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchBtnPressed(_ sender: Any) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServise.instance.searchList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchFilmCell", for: indexPath) as? SearchFilmCell{
            let film = DataServise.instance.searchList[indexPath.row]
            cell.configureCell(film: film)
            return cell
        } else {
            return SearchFilmCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColumns : CGFloat = 2
        if UIScreen.main.bounds.width > 320 {
            numberOfColumns = 3
        }
        let spaceBetweenCells : CGFloat = 2
        let padding : CGFloat = 5
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns

        return CGSize(width: cellDimension, height: cellDimension)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmScreen = FilmVC()
        filmScreen.modalPresentationStyle = .custom
        present(filmScreen, animated: true, completion: nil)
        let film = DataServise.instance.searchList[indexPath.item]
        filmScreen.setupFilmInfo(film: film, cellId: indexPath.item, list: .search)
    }
}

