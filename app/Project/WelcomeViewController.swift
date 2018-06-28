//
//  WelcomeViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  This class represents the view and actions on the welcome screen.

import UIKit
import Firebase
import FirebaseAuth

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    // MARK: - Functions
    
    /// Function for if the create account button is tapped.
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
        // Check if email an password textfield is not empthy.
        if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
                // Perform Segue if firebase create account is successfull.
                if let _ = user {
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            
                // Show UI alert if firebase gives error.
                if let firebaseError = error {
                    let alertController = UIAlertController(title: "Something went wrong", message: firebaseError.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
            }
        }
        
        // UI Alert if email of password field is empthy.
        else {
            let alertController = UIAlertController(title: "Something went wrong", message: "Email and password required.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    /// Function if login button is tapped.
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let _ = user {
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
                
                // UI Alert for firebase error.
                if let firebaseError = error {
                    let alertController = UIAlertController(title: "Something went wrong", message: firebaseError.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
            }
        }
            
        // UI Alert if email of password field is empthy.
        else {
            let alertController = UIAlertController(title: "Something went wrong", message: "Email and password required.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
    }
    
    /// Function for unwind segue after tapped on the logout button on the AddressViewController.
    @IBAction func unwindToWelcomeViewController(segue: UIStoryboardSegue){
        
    }
}
