//
//  ViewController.swift
//  SectionCollection
//
//  Created by Quang Phạm on 16/6/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let sectionOneImages: [String] = (1...10).map { "\($0)" }
    let sectionTwoImages: [String] = (11...22).map { "\($0)" }
    
    @IBOutlet weak var mainView: UICollectionView!
    
    let insetsSession = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    let itemPerRow = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
        mainView.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
                    return sectionOneImages.count
                } else {
                    return sectionTwoImages.count
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
                
        let imageName: String
                
        if indexPath.section == 0 {
            imageName = sectionOneImages[indexPath.item]
        } else {
            imageName = sectionTwoImages[indexPath.item]
                }
                
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding = CGFloat((itemPerRow + 1)) * insetsSession.left
//           
//        let availabelWidth = view.frame.width - padding
//        let width = availabelWidth / itemPerRow
//        return CGSize(width: width, height: width)
//        }
//        
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
//        insetsSession
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        insetsSession.left
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let imageName: String
                
        if indexPath.section == 0 {
            imageName = sectionOneImages[indexPath.item]
        } else {
            imageName = sectionTwoImages[indexPath.item]
                }
        vc.imageLoad = UIImage(named: imageName)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

