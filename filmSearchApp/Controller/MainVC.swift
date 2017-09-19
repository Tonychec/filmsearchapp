//
//  MainVC.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {

    //Outlets
    @IBOutlet weak var popularFilmsTable: UITableView!
    @IBOutlet weak var popFovPicker: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Variables
    var currentPickerState = PopFovPick.popular
    var currentGenreSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
DataServise.instance.setDef()//debug call
        
        popularFilmsTable.dataSource = self
        popularFilmsTable.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentPickerState == .popular {
            return DataServise.instance.popList.count
        } else if currentPickerState == .favorite {
            return DataServise.instance.favoriteList.count
        } else {
            return DataServise.instance.tempSortedList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmCell {
            if currentPickerState == .popular {
                let film = DataServise.instance.popList[indexPath.row]
                cell.configureCell(film: film, cellId: indexPath.row, list: currentPickerState)
                return cell
            } else if currentPickerState == .favorite  {
                let film = DataServise.instance.favoriteList[indexPath.row]
                cell.configureCell(film: film, cellId: indexPath.row, list: currentPickerState)
                return cell
            }  else if currentPickerState == .sorted  {
                print(indexPath.row)
                let film: Movie = DataServise.instance.tempSortedList[indexPath.row]
                    cell.configureCell(film: film, cellId: indexPath.row, list: currentPickerState)
                    return cell
            } else {
                return FilmCell()
            }
        } else {
            return FilmCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let filmScreen = FilmVC()
//        filmScreen.modalPresentationStyle = .custom
//        present(filmScreen, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataServise.instance.genreList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataServise.instance.genreList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentGenreSelected = pickerView.selectedRow(inComponent: 0)
        if currentPickerState == .favorite {
            DataServise.instance.sortList(list: DataServise.instance.favoriteList, genre: currentGenreSelected!)
            currentPickerState = .sorted
        } else {
            DataServise.instance.sortList(list: DataServise.instance.popList, genre: currentGenreSelected!)
            currentPickerState = .sorted
        }
        popularFilmsTable.reloadData()
    }
    
    @IBAction func fovBtnPressed(_ sender: Any) {
        popularFilmsTable.reloadData()
    }
    
    @IBAction func searchBtnPressed(_ sender: Any) {
    }
    
    @IBAction func segmentControllChenged(_ sender: Any) {
        switch popFovPicker.selectedSegmentIndex {
        case 1:
            currentPickerState = .favorite
        default:
            currentPickerState = .popular
        }
        popularFilmsTable.reloadData()
    }
}

