//
//  MatchPetsViewController.swift
//  petMatch
//
//  Created by Elaine Duh on 11/27/20.
//

import UIKit

class PetMatchViewController: UIViewController {

    var petResultsArray: [[String:Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        PetFinderAPICaller.getPetResults(petType: "Cat", petBreed: "American Shorthair", petSize: "Medium", petGender: "", petAge: "Young", petColor: "", petLocation: "95008", petDistance: 100, completion: { (petResults) in
//            guard let petResults = petResults else {
//                return
//            }
//            self.petResultsArray = petResults
//            print(self.petResultsArray)
//        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
