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

    var petTypeDict: [String: [[String:Any?]]] = Dictionary()
    var petBreedArray: [[String:Any?]] = []
    
    var petTypes = ["Dog", "Cat", "Rabbit", "Small & Furry", "Scales, Fins, & Other", "Birds", "Horses", "Barnyard"]
    var breedTypes: [String] = ["Select a pet type"]
    var colorTypes: [String] = ["Select a pet type"]
    let ages = ["Any", "Baby", "Young", "Adult", "Senior"]
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

        print("pet preferences view")
        // Do any additional setup after loading the view.
        getPetTypes()
        //getPetBreeds(petType: "cat")
        setPetTypeField()
    }
    
    // Get pet types
    func getPetTypes() {
        PetFinderAPICaller.getPetTypes{ (petTypes) in
            guard let petTypes = petTypes else {
                return
            }
            self.petTypeDict = Dictionary(grouping: petTypes, by: { $0["name"] as! String })
            // Reload data
            //self.tableView.reloadData()
        }
    }
    
    // Set pet type array
    func setPetTypeField() {
        PetFinderAPICaller.getPetTypes{ (petTypes) in
            guard let petTypes = petTypes else {
                return
            }
            self.petTypes = []
            petTypes.forEach { (petType) in
                self.petTypes.append(petType["name"] as! String)
            }
        }
    }
    
    // Set pet breed fields
    func setPetBreedField(breedURLPath: String) {
        PetFinderAPICaller.getPetBreeds(breedURLPath: breedURLPath, completion: { (petBreeds) in
            guard let petBreeds = petBreeds else {
                return
            }
            self.petBreedArray = petBreeds
            self.breedTypes = ["Any"]
            petBreeds.forEach { (petBreed) in
                self.breedTypes.append(petBreed["name"] as! String)
            }
        })
    }
    
    // Set pet colors array
    func setPetColorField(petType: String) {
        self.colorTypes = ["Any"]
        let petColors = petTypeDict[petType]![0]["colors"] as! [String]
        petColors.forEach { (color) in
            self.colorTypes.append(color)
        }
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
                let diffSelected = petTextField.text != petTypes[row]
                
                // Only switch breed/color to Any if something was already selected
                if (diffSelected && petBreedField.text!.count != 0) {
                    petBreedField.text = "Any"
                    petColorField.text = "Any"
                }
                petTextField.text = petTypes[row]
                
                // Set breed/color for selected pet type if pet type different than before
                if (diffSelected) {
                    let petLinks = petTypeDict[petTextField.text!]![0]["_links"] as! NSDictionary
                    let petBreedLink = petLinks["breeds"] as! NSDictionary
                    let urlPath = petBreedLink["href"] as! String
                    setPetBreedField(breedURLPath: urlPath)
                    setPetColorField(petType: petTextField.text!)
                }
                
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

