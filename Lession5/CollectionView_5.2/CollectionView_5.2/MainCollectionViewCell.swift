//
//  MainCollectionViewCell.swift
//  CollectionView_5.2
//
//  Created by Quang Phạm on 17/6/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbCmt: UILabel!
    @IBOutlet weak var lblike: UILabel!
    @IBOutlet weak var lbView: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setUI()
        
    }
    
    func cofiguareModel(model: Model){
        imageView.image = UIImage(named: model.thumbnail)
        lbView.text = "\(model.viewCount)"
        lblike.text = "\(model.likeCount)"
        lbCmt.text = "\(model.commentsCount)"
        nameLabel.text = model.models
    }

    func setUI(){
        layer.cornerRadius =  10.0
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
