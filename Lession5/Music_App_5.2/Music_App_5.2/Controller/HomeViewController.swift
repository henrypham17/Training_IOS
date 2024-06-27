//
//  HomeViewController.swift
//  Lession7
//
//  Created by Quang Phạm on 23/6/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var btnXemThem: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var musicc: [Musicc] = []
    private var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        LoadData()
    }
    
    private func LoadData() {
        if let url = Bundle.main.url(forResource: "model", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let result = try JSONDecoder().decode([Section].self, from: data)
                sections = result
            } catch {
                print("Failed")
            }
        }
    }



}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(4, sections[section].musics.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        
        cell.configuareModel(music: sections[indexPath.section].musics[indexPath.row])
        
        return cell
    }
    
    
}
