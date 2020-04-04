//
//  ViewController.swift
//  Testing in Xcode
//
//  Created by Elshad Karimov on 3/19/20.
//  Copyright © 2020 Elshad Karimov. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTextFieldsDelegate()
    }
    
    private func setupTextFieldsDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        checkTetFields()
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        createUser()
    }

    private func createUser() {
        let user = User()
        
        if let email = emailTextField.text {
            user.email = email
        }
        
        if let password = passwordTextField.text {
            user.password = password
        }
        
        if let yearText = yearTextField.text {
            user.yearOfBirth = yearText
        }
        
        user.terms = switchButton.isOn
        
        errorLabel.text = user.checkForm() != nil ? user.checkForm() : "You have been successfully registered"
    }
    
    fileprivate func checkTetFields() {
        guard emailTextField.text != "", passwordTextField.text != "", yearTextField.text != "", switchButton.isOn  else {
            registerButton.isEnabled = false
            return
        }
        
        registerButton.isEnabled = true
        
    }
}

extension RootViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkTetFields()
    }
}
