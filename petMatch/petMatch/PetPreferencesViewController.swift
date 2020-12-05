//
//  PetPreferencesViewController.swift
//  petMatch
//
//  Created by Elaine Duh on 11/27/20.
//

import UIKit
import Parse

class PetPreferencesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var petTextField: UITextField!
    @IBOutlet weak var petBreedField: UITextField!
    @IBOutlet weak var petColorField: UITextField!
    @IBOutlet weak var petAgeField: UITextField!
    @IBOutlet weak var ZIPCodeField: UITextField!
    @IBOutlet weak var petDistanceField: UITextField!
    
    let petTypes = ["Dog", "Cat", "Rabbit", "Small & Furry", "Scales, Fins, & Other", "Birds", "Horses", "Barnyard"]
    let breedTypes = ["Any", "Calico", "Ocicat", "Tabby"]
    let colorTypes = ["Any", "Black", "Smoke", "Tabby (Orange/Red)"]
    let ages = ["Any", "Kitten", "Young", "Adult", "Senior"]
    let distances = ["Anywhere", "10 miles", "25 miles", "50 miles", "100 miles"]
    
    var petPickerView = UIPickerView()
    var breedPickerView = UIPickerView()
    var colorPickerView = UIPickerView()
    var agePickerView = UIPickerView()
    var distancePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        petTextField.inputView = petPickerView
        petBreedField.inputView = breedPickerView
        petColorField.inputView = colorPickerView
        petAgeField.inputView = agePickerView
        petDistanceField.inputView = distancePickerView
        
        
        petPickerView.delegate = self
        breedPickerView.delegate = self
        colorPickerView.delegate = self
        agePickerView.delegate = self
        distancePickerView.delegate = self
        
        petPickerView.dataSource = self
        breedPickerView.dataSource = self
        colorPickerView.dataSource = self
        agePickerView.dataSource = self
        distancePickerView.dataSource = self
        
        petPickerView.tag = 1
        breedPickerView.tag = 2
        colorPickerView.tag = 3
        agePickerView.tag = 4
        distancePickerView.tag = 5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginViewController
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        //add save action
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 1:
                return petTypes.count
            case 2:
                return breedTypes.count
            case 3:
                return colorTypes.count
            case 4:
                return ages.count
            case 5:
                return distances.count
            default:
                return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 1:
                return petTypes[row]
            case 2:
                return breedTypes[row]
            case 3:
                return colorTypes[row]
            case 4:
                return ages[row]
            case 5:
                return distances[row]
            default:
                return "Data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 1:
                petTextField.text = petTypes[row]
                petTextField.resignFirstResponder()
            case 2:
                petBreedField.text = breedTypes[row]
                petBreedField.resignFirstResponder()
            case 3:
                petColorField.text = colorTypes[row]
                petColorField.resignFirstResponder()
            case 4:
                petAgeField.text = ages[row]
                petAgeField.resignFirstResponder()
            case 5:
                petDistanceField.text = distances[row]
                petDistanceField.resignFirstResponder()
            default:
                return
        }
    }
}

