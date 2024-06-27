//
//  InfoViewController.swift
//  Login_5.1
//
//  Created by Quang Phạm on 12/6/24.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var nameCurrent: UITextField!
    
    var username: String?
    var password: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load du lieu len textfield
        userName.text = UserDefaults.standard.string(forKey: "username")
        passWord.text = UserDefaults.standard.string(forKey: "password")
        nameCurrent.text = name
    }
    
    @IBAction func btnLogOut(_ sender: UIButton) {
        let alert = UIAlertController(title: "Log out", message: "Bạn muốn đăng xuất khỏi hệ thống?", preferredStyle: .alert)
        
        let logOutAction = UIAlertAction(title: "Đồng ý", style: .destructive, handler: {_ in
              
               if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
                   loginVC.modalPresentationStyle = .fullScreen
                   self.present(loginVC, animated: true, completion: nil)
               }
           })
        let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(logOutAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnChange(_ sender: UIButton) {
        
    }

}
