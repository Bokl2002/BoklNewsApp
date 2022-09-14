//
//  ViewController.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 12/09/2022.
//

import UIKit

class ChooseCountryViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countriesPickerView: UIPickerView!
    @IBOutlet weak var chooseCountryBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesPickerView.delegate = self
        countriesPickerView.dataSource = self
        chooseCountryBTN.layer.cornerRadius = 20
        // check if country was choosen
        if globalRow == -1{
            countryName.text = countries[0].name
        }else{
            countryName.text = countries[globalRow].name
        }
    }
    
    // actions
    @IBAction func chooseCountryBTN(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
}

// picker view
extension ChooseCountryViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dismiss(animated: true)
        globalRow = row
        countryName.text = countries[row].name
    }
}
