//
//  FoundView.swift
//  test3
//
//  Created by iris on 10/07/1441 AH.
//  Copyright © 1441 iris. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage

class FoundView: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    var refInfoFound:DatabaseReference!
    @IBOutlet weak var not: UITextView!
    @IBOutlet weak var emailF: UITextField!
    @IBOutlet weak var eyeF: UITextField!
    @IBOutlet weak var skinF: UITextField!
    @IBOutlet weak var wightF: UITextField!
    @IBOutlet weak var ageFound: UITextField!
    @IBOutlet weak var nameFound: UITextField!
    @IBOutlet weak var tallF: UITextField!
    @IBOutlet weak var hairF: UITextField!
    @IBOutlet weak var cityF: UITextField!
    @IBOutlet weak var numF: UITextField!
    
    @IBOutlet weak var photo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refInfoFound = Database.database().reference().child("infoFound");

        // Do any additional setup after loading the view.
    }
    @IBAction func sendFound(_ sender: Any) {
        addInfoFound()
        
        let storage = Storage.storage()
              let storageRefereance = storage.reference()
              let postFolder = storageRefereance.child("foundPosts")
              if let data = photo.image?.jpegData(compressionQuality: 0.5){
                  let imageReference = postFolder.child("gs://talaqi-619.appspot.com")
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
    func addInfoFound(){
        
          let key = refInfoFound.childByAutoId().key
             
             let addInfo = ["id":key,
             "nameFound": nameFound.text! as String,
             "ageFound": ageFound.text! as String,
                 "emailF": emailF.text! as String,
                 "numF": numF.text! as String,
                 "cityF": cityF.text! as String,
                 "tallF": tallF.text! as String,
                 "not": not.text! as String,
                 "skinF": skinF.text! as String,
                 "wightF": wightF.text! as String,
                 "eyeF": eyeF.text! as String,
                   "hair": hairF.text! as String,
                 
                 
             ]
             self.refInfoFound.child("key").childByAutoId().setValue(addInfoFound)
        
        
        
    }
    
    @IBAction func uploadFound(_ sender: Any) {
        let imageF = UIImagePickerController()
               imageF.delegate = self
               imageF.sourceType = UIImagePickerController.SourceType.photoLibrary
               
               imageF.allowsEditing = false
               
               self.present(imageF, animated: true){
                   
               }
               
           }
           
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
               {
                   photo.image = image
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
