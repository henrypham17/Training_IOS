//
//  HomeCell.swift
//  Lession7
//
//  Created by Quang Phạm on 23/6/24.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var imgURL: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var listenLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configuareModel(music: Musicc){
        titleLabel.text = "\(music.title)"
        artistLabel.text = "\(music.artist)"
        downloadLabel.text = "\(music.download)"
        listenLabel.text = "\(music.listen)"
        
//        if let url = music.imageURL, let imageUrl = URL(string: url) {
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: imageUrl) {
//                    DispatchQueue.main.async {
//                        imgURL.image = UIImage(data: data)
//                    }
//                }
//            }
//        } else {
//            imgURL.image = UIImage(named: "default_thumbnail")
//        }
    }
}

