//
//  settingsViewController.swift
//  TALAQI1
//
//  Created by Dua Almahyani on 18/07/1441 AH.
//  Copyright © 1441 Dua Almahyani. All rights reserved.
//

import UIKit
import Firebase

class settingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        do
        {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }
        catch
        {
            print("error")
        }
        
    }
    
    
}
