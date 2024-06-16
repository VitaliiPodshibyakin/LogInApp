//
//  ViewController.swift
//  LogInApp
//
//  Created by Виталий Подшибякин on 12.06.2024.
//

import UIKit

class LogInVC: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    
    
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let logoutVC = segue.destination as? LogOutVC else { return }
//        logoutVC.userName = "\(user.person.firstName) \(user.person.secondName)"
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let logoutVC = viewController as? LogOutVC {
                logoutVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as! AboutMeVC
                aboutMeVC.user = user
            }
        }
        
    }
    
    
    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        if userNameTF.text != user.userName || passwordTF.text != user.password {
            showAlert(with: "Oops", and: "Wrong User name or Password")
        }
    }

    @IBAction func forgotName(_ sender: Any) {
        showAlert(with: "", and: "Your User Name is '\(user.userName)'")
    }
    @IBAction func forgotPassword(_ sender: Any) {
        showAlert(with: "", and: "Your Password is '\(user.password)'")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

// MARK: - Private Methods
extension LogInVC {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LogInVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showLogOutVC", sender: nil)
        }
        return true
    }
}
