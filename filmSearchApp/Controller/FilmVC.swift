//
//  FilmVC.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class FilmVC: UIViewController {

    //Outlets
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var owerviewTxt: UILabel!
    @IBOutlet weak var taglineText: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var fovBtn: CircleBtn!
    
    //Variables
    var currentCell: Int!
    var currentFilmList: PopFovPick!
    var isFov: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favoriteBtnPressed(_ sender: Any) {
        DataServise.instance.favoriteSet(currentList: currentFilmList, currentCellId: currentCell)
        isFov = !isFov
        checkBtnColor()
    }
    
    
    func setupView() {
        titleTxt.text = "Download"
        filmImage.image = UIImage(named: "comingSoon")
        owerviewTxt.text = "no info"
        taglineText.text = "no info"
        releaseDate.text = "no info"
        
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(FilmVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    func setupFilmInfo (film: Movie, cellId: Int, list: PopFovPick) {
        currentCell = cellId
        currentFilmList = list
        
        if let titleTmp = film.title {
            titleTxt.text = titleTmp
        }
        
        if let owerviewTmp = film.overview {
            owerviewTxt.text = owerviewTmp
        }
        
        if let txt = film.relationship1?.tagline {
            taglineText.text = txt
        }
        
        
        // to do data release show
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MMM-yyyy"
//        if let dateTmp = formatter.string(from: film.relationship1?.releaseDate! as! Date) as? String {
//            releaseDate.text = dateTmp
//        }
        
        if let tempImg = film.image as? UIImage {
            filmImage.image = tempImg
        }
        isFov = film.relationship1?.isFavorite
        checkBtnColor()
    }
    
    func checkBtnColor () {
        if isFov! {
            fovBtn.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        } else {
            fovBtn.backgroundColor = UIColor.clear
        }
    }
    
    @objc func closeTap(_ revognizer : UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
