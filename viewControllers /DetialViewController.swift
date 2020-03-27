//
//  DetialViewController.swift
//  coll
//
//  Created by iris on 12/07/1441 AH.
//  Copyright © 1441 iris. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController {

   
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    var name = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        lbl.text = name
        img.image = UIImage(named: name)
        

        // Do any additional setup after loading the view.
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
