//
//  ImageVC.swift
//  LogInApp
//
//  Created by Виталий Подшибякин on 16.06.2024.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        imageView.image = UIImage(named: user.person.image)
    }

}
