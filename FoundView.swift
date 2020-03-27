//
//  FoundView.swift
//  test3
//
//  Created by iris on 10/07/1441 AH.
//  Copyright © 1441 iris. All rights reserved.
//

import UIKit

class FoundView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
             // Dispose of any resources that can be recreated.
         }
    @IBAction func found(_ sender: Any) {
        let popOverVC = UIStoryboard (name: "Main" , bundle:.main).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
                      self.addChild(popOverVC)
                      popOverVC.view.frame = self.view.frame
                             self.view.addSubview(popOverVC.view)
                      popOverVC.didMove(toParent: self)
        
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
