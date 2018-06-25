//
//  WelcomeViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class WelcomeViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                if let firebaseError = error {
                    let alertController = UIAlertController(title: "Something went wrong", message: "Incorrect email or password.", preferredStyle: .alert)

                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)

                    self.present(alertController, animated: true, completion: nil)
                    print(firebaseError.localizedDescription)
                    print(error)
                    return
                }
                print("succes")
                self.performSegue(withIdentifier: "LoginSegue", sender: self)

            }
        }
        
        let alertController = UIAlertController(title: "Something went wrong", message: "Fill in password and email", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

//        if emailTextField.text! == "" || passwordTextField.text == "" {
//            let alertController = UIAlertController(title: "Something went wrong", message: "Email and password required", preferredStyle: .alert)
//
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//
//            present(alertController, animated: true, completion: nil)
//        }
//        else {
//            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//
//                if error == nil {
//                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
//
//                }
//                else {
//                    let alertController = UIAlertController(title: "Something went wrong", message: error?.localizedDescription, preferredStyle: .alert)
//
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//
//                    self.present(alertController, animated: true, completion: nil)
//                    print(error)
//                }
//            }
//        }
    
    
        
//        if let email = emailTextField.text, let password = passwordTextField.text {
//            Auth.auth().createUser(withEmail: email, password: password) { user, error in
//                if let firebaseError = error {
//
//                    let alertController = UIAlertController(title: "Something went wrong", message: "Try Again", preferredStyle: .alert)
//
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//
//                    self.present(alertController, animated: true, completion: nil)
//                    return
//                }
//                print("succes")
//                self.performSegue(withIdentifier: "LoginSegue", sender: self)
//            }
//        }




    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let firebaseError = error {
                    
                    let alertController = UIAlertController(title: "Something went wrong", message: "Incorrect email or password", preferredStyle: .alert)

                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)

                    self.present(alertController, animated: true, completion: nil)
                    return
                    print(firebaseError.localizedDescription)
                    print(error)
                    
                    
                }
                print("succes")
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
            }
            
        }
        let alertController = UIAlertController(title: "Something went wrong", message: "Fill in email and password.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        return
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
