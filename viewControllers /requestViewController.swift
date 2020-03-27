//
//  requestViewController.swift
//  TALAQI1
//
//  Created by Dua Almahyani on 10/07/1441 AH.
//  Copyright © 1441 Dua Almahyani. All rights reserved.
//

import UIKit

class requestViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var sideNameTextField: UITextField!
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements()
    {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(sideNameTextField)
        Utilities.styleTextField(areaTextField)
        Utilities.styleTextField(phonenumberTextField)
        Utilities.styleFilledButton(sendButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sendTapped(_ sender: Any) {
    }
}
