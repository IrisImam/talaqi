//
//  ViewController.swift
//  TALAQI
//
//  Created by Hanan on 26/02/2020.
//  Copyright © 2020 Talaqi. All rights reserved.
//

import UIKit
import Firebase
//import FireStore

class ViewController3: UIViewController {
    var FireStor = self
    
    @IBOutlet weak var collectionView: UICollectionView!
    let imageArray = ["jon","leo","jen","jensen","ian"]
    
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var addressTextField: UITextField!
//    @IBOutlet weak var ageTextField: UITextField!
//    @IBOutlet weak var heightTextField: UITextField!
//    @IBOutlet weak var eyeTextField: UITextField!
//    @IBOutlet weak var weightTextField: UITextField!
//    @IBOutlet weak var skinTextField: UITextField!
//    @IBOutlet weak var hairTextField: UITextField!
//    @IBOutlet weak var lastSeenTextField: UITextField!
//    @IBOutlet weak var emailTextField: UITextField!
//    @IBOutlet weak var notesTextField: UITextField!
//    @IBOutlet weak var reportedTextField: UITextField!
//
    override func viewDidLoad() {
       super.viewDidLoad()
        
       
//        // Do any additional setup after loading the view.
//        nameTextField.delegate = self
//        addressTextField.delegate = self
//        ageTextField.delegate = self
//        heightTextField.delegate = self
//        eyeTextField.delegate = self
//        weightTextField.delegate = self
//        skinTextField.delegate = self
//        hairTextField.delegate = self
//        lastSeenTextField.delegate = self
//        emailTextField.delegate = self
//        notesTextField.delegate = self
//        reportedTextField.delegate = self
    }
    func getDataFromFirestore(){}
    //let FireStoreDatabase = FireStore.FireStor()
    
}

//extension ViewController: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        nameTextField.endEditing(true)
//        addressTextField.endEditing(true)
//        ageTextField.endEditing(true)
//        heightTextField.endEditing(true)
//        eyeTextField.endEditing(true)
//        weightTextField.endEditing(true)
//        skinTextField.endEditing(true)
//        hairTextField.endEditing(true)
//        lastSeenTextField.endEditing(true)
//        emailTextField.endEditing(true)
//        notesTextField.endEditing(true)
//        reportedTextField.endEditing(true)
//        return true
//    }
//}


    
   
extension ViewController3 : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
    return imageArray.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as? PostCollectionViewCell
         cell?.image.image = UIImage(named: imageArray[indexPath.row])

        cell?.label.text = imageArray[indexPath.row]
        return cell!
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier:"DetialViewController") as? DetialViewController
        vc?.name = imageArray[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
        
}
extension ViewController3: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:0, left:0, bottom:0, right:0)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = collectionView.bounds
        
        return CGSize(width: bound.width/2-20, height: bound.height/4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    }
     
