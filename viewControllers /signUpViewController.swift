//
//  signUpViewController.swift
//  TALAQI1
//
//  Created by Dua Almahyani on 10/07/1441 AH.
//  Copyright © 1441 Dua Almahyani. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements()
    {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(fullNameTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(confirmPasswordTextField)
        Utilities.styleFilledButton(signUpButton)
    }

    //check the field and check the data  is correct. if everything is correct, this method return nil. otherwise, it returns the error message
    func validateFields() -> String?
    {
        //check that all fields are filled in
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "الرجاء إكمال جميع الحقول"
        }
        
        //check if the password is secured
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "الرجاء التحقق من ان كلمة المرور تتكون من 8 خنات، وتتكون من احرف وارقام ورموز"
        }
        
        // check if the passwords match
        if passwordTextField != confirmPasswordTextField
        {
            return "الرجاء التحقق من ان كلمة المرور تتطابق مع تاكيد كلمة المرور"
        }

        return nil
    }

    @IBAction func signUpTapped(_ sender: Any)
    {
        
        if passwordTextField != confirmPasswordTextField
        {
            self.showError("الرجاء التحقق من ان كلمة المرور تتطابق مع تاكيد كلمة المرور")
        }
        
        //validate the fields
        let error = validateFields()
        
        if error != nil
        {
            //there is somthing wrong with the fields, show error message
            showError(error!)
        }
        else
        {
            // create cleaned version of the data
            let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let confirm = confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // check for errors

                if err != nil
                {
                    
                    // there is an error creating users
                    self.showError("خطأ في إنشاء الحساب")
                }
                else
                {
                    
                    // the user was created successfully, now store the fullname and user name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["fullName":fullName,"username":username,"uid":result!.user.uid])
                    {
                        (error) in
                        
                        if error != nil
                        {
                            //show error message
                            self.showError("خطأ في حفظ الحساب")
                        }
                    }
                    
                    // transition to home screen
                    self.transitionToProfile()
                }
            }
            
            
        }
        
    }
    
    func showError(_ message:String)
    {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    //send user to profile page
    func transitionToProfile()
    {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
