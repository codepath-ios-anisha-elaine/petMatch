//
//  LoginViewController.swift
//  petMatch
//
//  Created by Elaine Duh on 11/26/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        // Go to next screen if succeedm otherwise show error
        user.signUpInBackground { (success, error) in
            if success {
                // self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Successful sign up")
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        print("sign in")
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            // Succesfully logged on
            if user != nil {
                //self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Successful sign in")
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
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

}
