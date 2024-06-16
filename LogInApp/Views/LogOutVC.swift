//
//  ViewController.swift
//  LogInApp
//
//  Created by Виталий Подшибякин on 12.06.2024.
//

import UIKit

class LogOutVC: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userLabel: UILabel!
    
    // MARK: - Public properties
    var user: User!
    
    // MARK: - Private properties
    private let primaryColor = UIColor(
        red: 250/255,
        green: 109/255,
        blue: 30/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 149/255,
        blue: 160/255,
        alpha: 1
    )
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "Hello, \(user.person.fullName)"
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
  
}
// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
