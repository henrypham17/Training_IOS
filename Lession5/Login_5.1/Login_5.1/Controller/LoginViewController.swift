//
//  ViewController.swift
//  Login_5.1
//
//  Created by Quang Phạm on 12/6/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userName.text = username
        passWord.text = password
    }

    @IBAction func btnLogin(_ sender: UIButton){
        let username = userName.text
        let password = passWord.text
        
        let newUsername = UserDefaults.standard.string(forKey: "username")
        let newPassword = UserDefaults.standard.string(forKey: "password")

                if username == newUsername && password == newPassword {
                    addEventToHistory(event: "User \(username ?? "") logged in on \(Date())")
                    performSegue(withIdentifier: "showInfo", sender: self)
                } else {
                    let alert = UIAlertController(title: "Login Failed", message: "Please enter correct username and password", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
    }

    @IBAction func btnRegister(_ sender: UIButton){
        let alert = UIAlertController(title: "Đăng kí", message: "Bạn có muốn đăng kí tài khoản?", preferredStyle: .alert)
        
        let signUpAction = UIAlertAction(title: "Đồng ý", style: .destructive){_ in self.performSegue(withIdentifier: "signUp", sender: self)}
        let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(signUpAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            if let tabBarController = segue.destination as? UITabBarController,
               let viewControllers = tabBarController.viewControllers {
                for viewController in viewControllers {
                    if let navController = viewController as? UINavigationController,
                       let data = navController.topViewController as? InfoViewController {
                        data.username = userName.text
                        data.password = passWord.text
                        data.name = UserDefaults.standard.string(forKey: "name")
                    }
                }
            }
        }
    }
    
    private func addEventToHistory(event: String) {
            var history = UserDefaults.standard.array(forKey: "history") as? [String] ?? [String]()
            history.append(event)
            UserDefaults.standard.set(history, forKey: "history")
        }
    
}

