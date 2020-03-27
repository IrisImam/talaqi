//
//  ViewController.swift
//  TALAQI
//
//  Created by Hanan on 26/02/2020.
//  Copyright © 2020 Talaqi. All rights reserved.
//
import Firebase

import UIKit

class ReportMissingVC: UIViewController, UITextFieldDelegate{
    
    var info:DatabaseReference!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var eyeTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var skinTextField: UITextField!
    @IBOutlet weak var hairTextField: UITextField!
    @IBOutlet weak var lastSeenTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var reportedTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //info = DatabaseReference.database().reference()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        addressTextField.delegate = self
        ageTextField.delegate = self
        heightTextField.delegate = self
        eyeTextField.delegate = self
        weightTextField.delegate = self
        skinTextField.delegate = self
        hairTextField.delegate = self
        lastSeenTextField.delegate = self
        emailTextField.delegate = self
        notesTextField.delegate = self
        reportedTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        addressTextField.endEditing(true)
        ageTextField.endEditing(true)
        heightTextField.endEditing(true)
        eyeTextField.endEditing(true)
        weightTextField.endEditing(true)
        skinTextField.endEditing(true)
        hairTextField.endEditing(true)
        lastSeenTextField.endEditing(true)
        emailTextField.endEditing(true)
        notesTextField.endEditing(true)
        reportedTextField.endEditing(true)
        return true
    }
}

