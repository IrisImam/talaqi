//
//  profileViewController.swift
//  TALAQI1
//
//  Created by Dua Almahyani on 10/07/1441 AH.
//  Copyright © 1441 Dua Almahyani. All rights reserved.
//
import UIKit
import FirebaseFirestore
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

extension UIView {
    func setGradientBackground(colorOne: UIColor, colortwo: UIColor)
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors =  [colorOne.cgColor, colortwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
class profileViewController: UIViewController {
    
    
    var imagePicker:UIView!
    // MARK: - Properties
        
            lazy var containerView: UIView = {
                
                let gradient = CAGradientLayer()
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 450, height: 330))

                gradient.frame = view.bounds
                gradient.colors = [Colors.blue, Colors.brightRed]

                view.layer.insertSublayer(gradient, at: 0)
                
                view.setGradientBackground(colorOne: Colors.blue, colortwo: Colors.brightRed)
                
                view.addSubview(profileImageView)
                profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                profileImageView.anchor(top: view.topAnchor, paddingTop: 88,
                                        width: 120, height: 120)
                profileImageView.layer.cornerRadius = 120 / 2
                
                view.addSubview(goBack)
                goBack.anchor(top: view.topAnchor, left: view.leftAnchor,
                                     paddingTop: 64, paddingLeft: 32, width: 32, height: 32)
                
                view.addSubview(goToSettings)
                goToSettings.anchor(top: view.topAnchor, right: view.rightAnchor,
                                     paddingTop: 64, paddingRight: 32, width: 32, height: 32)
                
                view.addSubview(nameLabel)
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)
                
                view.addSubview(emailLabel)
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                emailLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 4)
                
                return view
            }()
    
            
            let profileImageView: UIImageView = {
                let iv = UIImageView()
                iv.image = #imageLiteral(resourceName: "profilepic")
                iv.contentMode = .scaleAspectFill
                iv.clipsToBounds = true
                iv.layer.borderWidth = 3
                iv.layer.borderColor = UIColor.white.cgColor
                return iv
            }()
            
            let goBack: UIButton = {
                let button = UIButton(type: .system)
                button.setImage(#imageLiteral(resourceName: "Vector 17").withRenderingMode(.alwaysOriginal), for: .normal)
                button.addTarget( self, action: #selector(handleMessageUser), for: .touchUpInside)
                return button
            }()
            
            let goToSettings: UIButton = {
                let button = UIButton(type: .system)
                button.setImage(#imageLiteral(resourceName: "settingsIcon").withRenderingMode(.alwaysOriginal), for: .normal)
                button.addTarget(self, action: #selector(transitionToSettings), for: .touchUpInside)
                return button
            }()
            
            /*let nameLabel: UILabel = {
                var fullName = UILabel()
                let db = Firestore.firestore()
                let uid = Auth.auth().currentUser?.uid
                Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value) { (snapshot) in
                        if let dict = snapshot.value as? [String: AnyObject]
                        {
                            fullName.text = "-"
                            fullName.text = ""
                        }
                    }
                fullName.textAlignment = .center
                fullName.font = UIFont.boldSystemFont(ofSize: 26)
                fullName.textColor = .white
                return fullName
            }()*/
            
            let nameLabel:UILabel =
            {
                let label = UILabel()
                if let user = Auth.auth().currentUser
                {
                    let providerID: String = user.providerID
                    let uid: String = user.uid
                    let displayEmail: String? = user.displayName
                    label.text = displayEmail
                }
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                label.textColor = .white
                return label
            }()
    
    
            let emailLabel: UILabel = {
                let label = UILabel()
                if let user = Auth.auth().currentUser
                {
                    let providerID: String = user.providerID
                    let uid: String = user.uid
                    let displayEmail: String? = user.email
                    label.text = displayEmail
                }
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 18)
                label.textColor = .white
                return label
            }()
            
            // MARK: - Lifecycle
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                view.backgroundColor = .white
                
                view.addSubview(containerView)
                containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                                     right: view.rightAnchor, height: 300)
                
               /* imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = self8*/
                
                
                
            }
            
            override var preferredStatusBarStyle: UIStatusBarStyle {
                return .lightContent
            }
            
            // MARK: - Selectors
            
            @objc func handleMessageUser() {
                print("Message user here..")
                
            }
   
        @objc func transitionToSettings()
        {
           
            let SettingsViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.settingsViewController) as? settingsViewController
           
            view.window?.rootViewController = SettingsViewController
            view.window?.makeKeyAndVisible()
            
            print("settings button clicked..")
        }
    
    func getDataFromFirestore()
    {
        let fireStoreDatabase = Firestore.firestore()
        /*let settings = fireStoreDatabase.settings
        settings.areTimestampsInSnapshotsEnabled
        fireStoreDatabase.settings = settings*/
        
        fireStoreDatabase.collection("users").addSnapshotListener { (snapshot, error) in
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                if snapshot?.isEmpty != true && snapshot != nil
                {
                    for document in snapshot!.documents
                    {
                        let documentID = document.documentID
                        print(documentID)
                        
                    }
                    
                }
            }
        }
    }
    
}

        extension UIColor {
            static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
                return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
            }
            
            static let mainBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
        }
