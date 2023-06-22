//
//  SettingsViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 22.10.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var kullanıcıLabel: UILabel!
    
    @IBOutlet weak var telefonLabel: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var terapistimLabel: UILabel!
    var denemeArray = [String]()
    var bilgilerArray = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kullanıcıLabel.layer.masksToBounds = true
        kullanıcıLabel.layer.cornerRadius = 20
        
        telefonLabel.layer.masksToBounds = true
        telefonLabel.layer.cornerRadius = 20
        
        labelText.layer.masksToBounds = true
        labelText.layer.cornerRadius = 20
        
        terapistimLabel.layer.masksToBounds = true
        terapistimLabel.layer.cornerRadius = 20
        
        logoutButton.layer.cornerRadius = 30
        
        
     
         
        
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("settings error")}
            else{
                for document in snapshot!.documents{
                    
                    
                    if document.documentID == Auth.auth().currentUser?.phoneNumber{
                        
                        if document.get("Rol") as! String == "Veli" {
                            if document.get("Terapistim") as! String != nil {
                                self.terapistimLabel.text = "Terapistiniz: \(document.get("Terapistim") as! String)"
                            }else{
                                self.terapistimLabel.text = "Terapistiniz Bulunmamaktadır"
                            }
                        }
                        else{
                            self.terapistimLabel.text = document.get("Rol") as! String

                        }
                    }
                    if document.documentID == Auth.auth().currentUser?.phoneNumber {
                        
                        var kullanıcı = document.get("Kullanıcı") as! String
                        var telefon = document.get("Phone Number") as! String
                        telefon.insert(" ", at: telefon.index(telefon.firstIndex(of: "+")!, offsetBy: 3))
                        telefon.insert(" ", at: telefon.index(telefon.firstIndex(of: "+")!, offsetBy: 7))
                        telefon.insert(" ", at: telefon.index(telefon.firstIndex(of: "+")!, offsetBy: 11))
                        var password = document.get("Password") as! String
                    
                        self.kullanıcıLabel.text = kullanıcı
                        self.telefonLabel.text = telefon
                        self.labelText.text = "Şifre: \(password)"
                        
                        
                       
                    }
                    
                }
            }
        }
                    
                    
                 
                    
               
           

    }
    
    
   

    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
           // performSegue(withIdentifier: "toLoginPage", sender: nil)
        }catch{
            print("ee")
        }
        
        
        
    }
    
}
