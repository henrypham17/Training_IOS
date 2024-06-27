//
//  HistoryViewController.swift
//  Login_5.1
//
//  Created by Quang Phạm on 12/6/24.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var history: [String] = []

       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.dataSource = self
           
           history = UserDefaults.standard.array(forKey: "history") as? [String] ?? [String]()
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return history.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
           cell.textLabel?.text = history[indexPath.row]
           return cell
       }
   }
