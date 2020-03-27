//
//  SearchViewController.swift
//  TALAQI9
//
//  Created by iris on 25/07/1441 AH.
//  Copyright © 1441 Talaqi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate  {

    @IBOutlet weak var tblSearchResults: UITableView!
    @IBOutlet weak var txtSearchBar: UITextField!
    
    var fruitsArray:[String] = Array()
    var searchedArray:[String] = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsArray.append("Apple")
            fruitsArray.append("Orange")
            fruitsArray.append("Litchi")
            fruitsArray.append("PineApple")
            
            for str in fruitsArray {
                searchedArray.append(str)
            }
            
            tblSearchResults.dataSource = self
            txtSearchBar.delegate = self
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return searchedArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            cell?.textLabel?.text = searchedArray[indexPath.row]
            return cell!
        }
        
        //MARK:- UItextFieldDelegates
        
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            txtSearchBar.resignFirstResponder()
            txtSearchBar.text = ""
            self.searchedArray.removeAll()
            for str in fruitsArray {
                searchedArray.append(str)
            }
            tblSearchResults.reloadData()
            return false
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if (txtSearchBar.text?.count)! != 0 {
                self.searchedArray.removeAll()
                for str in fruitsArray {
                    let range = str.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        self.searchedArray.append(str)
                    }
                }
            }
            tblSearchResults.reloadData()
            return true
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


