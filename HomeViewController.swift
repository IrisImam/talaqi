//
//  HomeViewController.swift
//  TALAQI
//
//  Created by Hanan on 26/02/2020.
//  Copyright © 2020 Talaqi. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var cv2: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    var imageArray = [UIImage (named: "jon"),UIImage (named: "jen"),UIImage (named: "leo"),UIImage (named: "ian"),UIImage (named: "jensen"),UIImage (named: "leo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.setRadiusWithShadow()
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        return imageArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.Image.image = imageArray[indexPath.row]
        
           // let cell2 = cv2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell2
        return  cell
       
        }
        
    }
    
extension UIView {
    func setRadiusWithShadow(_ radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }

}
