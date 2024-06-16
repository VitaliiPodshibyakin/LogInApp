//
//  AboutMeVC.swift
//  LogInApp
//
//  Created by Виталий Подшибякин on 16.06.2024.
//

import UIKit

class AboutMeVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = user.person.about
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageVC else { return }
        imageVC.user = user
    }
}
