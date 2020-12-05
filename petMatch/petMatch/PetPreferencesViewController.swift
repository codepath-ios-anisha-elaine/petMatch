//
//  PetPreferencesViewController.swift
//  petMatch
//
//  Created by Elaine Duh on 11/27/20.
//

import UIKit
import Parse

class PetPreferencesViewController: UIViewController {
    var petTypeArray: [[String:Any?]] = []
    var petBreedArray: [[String:Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("pet preferences view")
        // Do any additional setup after loading the view.
        getPetTypes()
        getPetBreeds(petType: "cat")
    }
    
    // Get pet types
    func getPetTypes() {
        PetFinderAPICaller.getPetTypes{ (petTypes) in
            guard let petTypes = petTypes else {
                return
            }
            self.petTypeArray = petTypes
            
            // Reload data
            //self.tableView.reloadData()
        }
    }
    
    func getPetBreeds(petType: String) {
        PetFinderAPICaller.getPetBreeds(petType: petType, completion: { (petTypes) in
            guard let petTypes = petTypes else {
                return
            }
            self.petBreedArray = petTypes
            
            // Reload data
            //self.tableView.reloadData()
        })
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
    
}
