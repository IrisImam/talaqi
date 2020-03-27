//
//  FeedCell.swift
//  
//
//  Created by iris on 28/07/1441 AH.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
   
    @IBOutlet weak var name: UILabel!
    

    
    @IBOutlet weak var skin: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var num: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
