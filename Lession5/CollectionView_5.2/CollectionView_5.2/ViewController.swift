//
//  ViewController.swift
//  CollectionView_5.2
//
//  Created by Quang Phạm on 17/6/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var mainCollection: UICollectionView!
    
    private var model: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainCollection.dataSource = self
        mainCollection.delegate = self
        
        register()
        LoadData()
    }
    
    private func register(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        mainCollection.collectionViewLayout = layout
        
        
         let cell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        mainCollection.register(cell, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }
    
    private func LoadData(){
        if let url = Bundle.main.url(forResource: "model", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let result = try JSONDecoder().decode([Model].self, from: data)
                model = result
            } catch {
                print("Failed")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cofiguareModel(model: model[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height - 20.0) / 2.0
        let width = (collectionView.frame.width - 10.0) / 2.0
        return CGSize(width: width, height: height)
    }
}


