//
//  MainViewController.swift
//  SectionCollection
//
//  Created by Quang Phạm on 17/6/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageLoad: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = imageLoad
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
