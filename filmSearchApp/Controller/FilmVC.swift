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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favoriteBtnPressed(_ sender: Any) {
    }
    
    
    func setupView() {
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(FilmVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ revognizer : UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
