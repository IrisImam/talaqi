

import UIKit
import WebKit

class DetailView2Controller: UIViewController {

    var page_title: String = ""
    var image_name: String = ""
    var video_key: String = ""
    
    var text1_value: String = ""
    var text2_value: String = ""
    var text3_value: String = ""
    
    @IBOutlet var page_title_text: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var video: WKWebView!
    
    @IBOutlet var text1: UITextView!
    @IBOutlet var text2: UITextView!
    @IBOutlet var text3: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide text view before loading it from file
        self.text1.isHidden = true
        self.text2.isHidden = true
        self.text3.isHidden = true
        
        
        page_title_text.text = page_title
        let image = UIImage(named: image_name)
        img.image = image

         DispatchQueue.main.async {
            // Do any additional setup after loading the view.
            
             let url = URL(string: "https://www.youtube-nocookie.com/embed/\(self.video_key)")
            let request = URLRequest(url: url!)
            self.video.load(request)
            
            // load text 1
            if let filepath = Bundle.main.path(forResource: self.text1_value, ofType: "txt") {
                do {
                    let contents = try String(contentsOfFile: filepath)
              
                    
                    self.text1.text = contents
                    self.text1.isHidden = false
              

                    
                } catch {
                    // contents could not be loaded
                }
            } else {
                // example.txt not found!
            }
            
            // load text2
            if let filepath = Bundle.main.path(forResource: self.text2_value, ofType: "txt") {
                do {
                    let contents = try String(contentsOfFile: filepath)
                
                    self.text2.text = contents

                    self.text2.isHidden = false
                    
                } catch {
                    // contents could not be loaded
                }
            } else {
                // example.txt not found!
            }
            
            
            // load text3
            if let filepath = Bundle.main.path(forResource: self.text3_value, ofType: "txt") {
                do {
                    
                    let contents = try String(contentsOfFile: filepath)
                    self.text3.text = contents
                    self.text3.isHidden = false
                    
                } catch {
                    // contents could not be loaded
                }
            } else {
                // example.txt not found!
            }
            
            
        }
        
        
    }
    

}
