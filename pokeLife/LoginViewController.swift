//
//  ViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var PasswordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didLoginPress(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    @IBAction func didSignUpPress(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    @IBAction func didForgotPswPress(_ sender: Any) {
        self.performSegue(withIdentifier: "ForgotPswSegue", sender: self) 
    }
    
    
}

