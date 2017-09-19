//
//  MainVC.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Outlets
    @IBOutlet weak var popularFilmsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularFilmsTable.dataSource = self
        popularFilmsTable.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmCell {
            DataServise.instance.setDefFilm()
            let film = DataServise.instance.popList[indexPath.row]
            cell.configureCell(film: film, cellId: indexPath.row)
            return cell
        } else {
            return FilmCell()
        }
    }

}

