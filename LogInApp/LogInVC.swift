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
    private let userName = "u"
    private let password = "p"
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logoutVC = segue.destination as? LogOutVC else { return }
        logoutVC.userName = userName
    }
    
    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(with: "Oops", and: "Wrong User name or Password")
        }
    }

    @IBAction func forgotName(_ sender: Any) {
        showAlert(with: "", and: "Your User Name is 'name'")
    }
    @IBAction func forgotPassword(_ sender: Any) {
        showAlert(with: "", and: "Your Password is 'password'")
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
