//
//  PostPageViewController.swift
//  TALAQI9
//
//  Created by iris on 28/07/1441 AH.
//  Copyright © 1441 Talaqi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class PostPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var  ref:DatabaseReference!
    var dataHandle:DatabaseHandle!
   var users = [UserDTO]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellT = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! FeedCell
        let getinfo:UserDTO
        
        //getting the info of selected position
        
        //adding values to labels
        cellT.name.text = getinfo.Name
        cellT.last.text = getinfo.lastP
        cellT.skin.text = getinfo.skinColor
        cellT.num.text = getinfo.num
        
        //returning cel
        cellT.imgUser.image = UIImage(named:"jen")
         return cellT
        
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
}
func getdata(){
   dataHandle = ref?.child("info").child("key").observe(.value, with: {(snapshot)in
        
        //read single user's data
    
         
    self.users.append(UserDTO)
//
//
          })
        
          
       
        //read various users' data
            
            
                
            }
            
           
                        
            
            
   
     
    
    
    
    
    
    
    









        //ref = Database.database().reference().child("info");
        
        //ref .child("info").observe(DataEventType.value) { (snapshot) in
            
           /* if snapshot.childrenCount > 0 {
            
            //clearing the list
            self.infoData.removeAll()
            
            //iterating through all the values
                for getInfo in snapshot.children.allObjects as! [DataSnapshot]{
                    let infoObject = getInfo.value as? [String: AnyObject]
                    let missingName  = infoObject?["Name"]
                                    let missinglastP = infoObject?["lastP"]
                                    let missingSkin = infoObject?["skinColor"]
                    let missingnum = infoObject?["num"]
                    
                                    
                                    //creating artist object with model and fetched values
                    let miss = post(Name: "missingName", skinColor: "missingSkin", num: "missingnum " ,lastP:" missinglastP"  )
                                    
                                    //appending it to list
                    self.infoData.append(miss)
                    
                                }
                                
                                //reloading the tableview
                                self.tableView.reloadData()
                            }
                        }
                        
                    }
                }
        
            */
        
      
        // Do any additional setup after loading the view.
    
    
   /*}}func getDataFromFirestore(){
        
    
      let fireStoreDatabase = Firestore.firestore()
        let settings = fireStoreDatabase.settings
        settings.areTimestampsInSnapshotsEnabled = true
        fireStoreDatabase.settings = settings
        
    ref .child("info").observeSingleEvent(of:.value) { (snapshot) in
        
    }
       fireStoreDatabase.collection("posts") .addSnapshotListener { (snapshot, error) in
            if  error != nil {
               print(error?.localizedDescription)
                
           }
            else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    for document in snapshot!.documents{
                        let documentID = document.documentID
                        print(documentID)
                    }
                }
            }
            
        }
        
    }
        //}
   // }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellT = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! FeedCell
       // cellT.name1.text = "iris"
       // cellT.age.text = "22"
        cellT.imgUser.image = UIImage(named:"jen")
         return cellT
       
 
    
    
*/
 
}
