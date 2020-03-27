//
//  ViewController.swift
//  test3
//
//  Created by iris on 02/07/1441 AH.
//  Copyright © 1441 iris. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class MissingViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var refInfo :DatabaseReference!
   
    
    @IBOutlet weak var hairColor: UITextField!
    
   
    @IBOutlet weak var police: UITextField!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var num: UITextField!
    @IBOutlet weak var lastP: UITextField!
    @IBOutlet weak var neighborhood: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var skinColor: UITextField!
    @IBOutlet weak var eyeColor: UITextField!
    @IBOutlet weak var wight: UITextField!
   
    @IBOutlet weak var tall: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var uplodPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refInfo = Database.database().reference().child("info");
         
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(_ sender: Any) {
      addInfo()
        let storage = Storage.storage()
        let storageRefereance = storage.reference()
        let postFolder = storageRefereance.child("posts")
        if let data = uplodPhoto.image?.jpegData(compressionQuality: 0.5){
            let imageReference = postFolder.child("gs://talaqi-619.appspot.com/posts")
            imageReference.putData(data, metadata: nil) { (matadata, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                }
                else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil{
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                }
                
            }
        }
        
        
    }
    func addInfo(){
        
        
     let key = refInfo.childByAutoId().key
        let user = Auth.auth().currentUser
       
        let addInfo = ["id":user?.uid,
                       
        "Name": Name.text! as String,
        "Age": Age.text! as String,
            "email": email.text! as String,
            "num": num.text! as String,
            "police": police.text! as String,
            "lastP": lastP.text! as String,
            "city": city.text! as String,
            "tall": tall.text! as String,
            "notes": notes.text! as String,
            "skinColor": skinColor.text! as String,
            "hairColor": hairColor.text! as String,
            "neighborhood": neighborhood.text! as String,
            "eyeColor": eyeColor.text! as String,
            
        ]
        self.refInfo.child("key").childByAutoId().setValue(addInfo)
        
    }
    @IBAction func Uplod(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            uplodPhoto.image = image
        }
        else
        {
          self.dismiss(animated: true, completion: nil)  //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }


    @IBAction func showPopUp(_ sender: Any) {
        
        let popOverVC = UIStoryboard (name: "Main" , bundle:.main).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
               self.addChild(popOverVC)
               popOverVC.view.frame = self.view.frame
                      self.view.addSubview(popOverVC.view)
               popOverVC.didMove(toParent: self)

    }
    
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  
