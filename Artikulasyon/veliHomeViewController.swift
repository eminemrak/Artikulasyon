//
//  veliHomeViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 12.11.2022.
//

import UIKit
import Firebase


class veliHomeViewController: UIViewController {
    
    var selectedFriend = ""
    var selectedFriendPhone = ""
    var myUserName = ""

    @IBOutlet weak var mesajButton: UIButton!
    @IBOutlet weak var harfEkleButton: UIButton!
    @IBOutlet weak var harflerButton: UIButton!
    @IBOutlet weak var profilButton: UIButton!
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilButton.layer.cornerRadius = 20
        mesajButton.layer.cornerRadius = 20
        harflerButton.layer.cornerRadius = 20
        harfEkleButton.layer.cornerRadius = 20
        
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("veliHomeError")}
            else{
                for document in snapshot!.documents{
                    if document.documentID == Auth.auth().currentUser?.phoneNumber{
                        if document.get("Terapistim") != nil{
                            self.selectedFriend = document.get("Terapistim") as! String
                            self.selectedFriendPhone = document.get("TerapistimPhone") as! String
                        }else{
                                self.selectedFriend = "Terapistiniz bulunmamaktadır"
                            self.selectedFriendPhone = "Terapistiniz bulunmamaktadır"
                            }
                        
                        self.myUserName = document.get("Kullanıcı") as! String
                    }
                }
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "veliToChat" {
            let destinationVC = segue.destination as! MessageViewController
            destinationVC.selectedFriend = selectedFriend
            destinationVC.selectedFriendPhone = selectedFriendPhone
            destinationVC.myUserName = myUserName
        }
    }
    
    @IBAction func chatButton(_ sender: Any) {
        performSegue(withIdentifier: "veliToChat", sender: nil)
        
    }
    
}
