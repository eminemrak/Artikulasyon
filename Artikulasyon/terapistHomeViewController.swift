//
//  terapistHomeViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 12.11.2022.
//

import UIKit
import Firebase

class terapistHomeViewController: UIViewController {

    @IBOutlet weak var profilButton: UIButton!
    @IBOutlet weak var friendButton: UIButton!
    @IBOutlet weak var harflerButton: UIButton!
    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        profilButton.layer.cornerRadius = 20
        friendButton.layer.cornerRadius = 20
        harflerButton.layer.cornerRadius = 20
        
     
    }
    



}
