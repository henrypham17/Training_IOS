//
//  ChangeViewController.swift
//  Login_5.1
//
//  Created by Quang Phạm on 12/6/24.
//

import UIKit

class ChangeViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var passConfirm: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        userName.text = UserDefaults.standard.string(forKey: "username")
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        if let username = userName.text, !username.isEmpty,
           let password = passWord.text, !password.isEmpty,
           let passconfirm = passConfirm.text, !passconfirm.isEmpty, password == passconfirm {
            
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            UserDefaults.standard.set(passconfirm, forKey: "passconfirm")
            
            addEventToHistory(event: "User \(username) registered on \(Date())")
            
            let alert = UIAlertController(title: "Thành công", message: "Đổi mật khẩu thành công", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Lỗi", message: "Vui lòng điền đầy đủ thông tin và xác nhận mật khẩu trùng khớp", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func addEventToHistory(event: String) {
            var history = UserDefaults.standard.array(forKey: "history") as? [String] ?? [String]()
            history.append(event)
            UserDefaults.standard.set(history, forKey: "history")
        }
}
