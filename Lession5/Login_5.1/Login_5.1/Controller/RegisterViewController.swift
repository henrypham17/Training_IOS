//
//  RegisterViewController.swift
//  Login_5.1
//
//  Created by Quang Phạm on 12/6/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var namePerson: UITextField!
    @IBOutlet weak var ageCurrent: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: UIButton){
        if let username = userName.text, !username.isEmpty,
           let password = passWord.text, !password.isEmpty,
           let name = namePerson.text, !name.isEmpty,
           let age = ageCurrent.text, !age.isEmpty {
            
            // luu tru du lieu nguoi dung
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            UserDefaults.standard.set(name, forKey: "name")
            
            addEventToHistory(event: "User \(username) registered on \(Date())")
            
            let alert = UIAlertController(title: "Thành công", message: "Đăng kí thành công", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.performSegue(withIdentifier: "loginView", sender: self)}))
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Lỗi", message: "Vui lòng điền đầy đủ thông tin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func btnBack(_ sender: UIButton){
        let alert = UIAlertController(title: "Xác nhận", message: "Bạn muốn huỷ đăng kí?", preferredStyle: .alert)
        
        let backAction = UIAlertAction(title: "Đồng ý", style: .destructive){_ in self.performSegue(withIdentifier: "loginView", sender: self)}
        
        let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(backAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
 
    // truyen data sang login
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginView" {
            if let data = segue.destination as? LoginViewController {
                data.username = userName.text
                data.password = passWord.text
            }
        }
    }
    
    private func addEventToHistory(event: String) {
            var history = UserDefaults.standard.array(forKey: "history") as? [String] ?? [String]()
            history.append(event)
            UserDefaults.standard.set(history, forKey: "history")
        }
    
}
