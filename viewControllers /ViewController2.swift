
import UIKit

class ViewController2
: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    let titles = ["الاختطاف" , "التوحد" , "الاتجار بالاطفال" , "الهروب من المنزل" , "الزهايمر" , "اختطاف العائلي"]
    let images = ["1" , "2" , "3" , "4", "5" , "6"]
    let text1  = ["1" , "2" , "3" , "4", "5" , "6"]
    let text2  = ["11" , "22" , "33" , "44", "55" , "66" ]
    let text3  = ["111" , "222" , "333" , "444", "555" , "666" ]
    let videos = ["VdVqrTmqrnY" , "Rvz-WSRSGg4" , "3Om9c4Bk7Uc" , "Da-vBfJKTAA" , "UMLthcGjMao" , "KMpdo7SAGQ4"]

    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell3
        
        let image = UIImage(named: images[indexPath.row])
        cell.title.text = titles[indexPath.row]
        cell.image.image = image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailView2Controller
        nextViewController.page_title = titles[indexPath.row]
        nextViewController.image_name = images[indexPath.row]
        nextViewController.video_key  = videos[indexPath.row]
        
        nextViewController.text1_value = text1[indexPath.row]
        nextViewController.text2_value = text2[indexPath.row]
        nextViewController.text3_value = text3[indexPath.row]
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }


}

