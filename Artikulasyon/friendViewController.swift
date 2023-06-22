//
//  friendViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 6.11.2022.
//

import UIKit
import Firebase

class friendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedFriend : String?
    var selectedFriendPhone : String?
    
    var friendArray = [String]()
    var friendPhoneArray = [String]()
    
    @IBOutlet weak var ekleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextField!
    var Kullanıcı = ""
    var kullanıcı = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        friendCek()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
     
       
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 20
        
        ekleButton.layer.cornerRadius = 25
        
        
        
        
        
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print("terapistim ekleme error verdi")
            }
            else{
                for document in snapshot!.documents{
                    if document.get("Rol") as! String == "Terapist"{
                        
                        var data = ["Terapistim" : document.get("Kullanıcı") as! String,"TerapistimPhone": document.get("Phone Number") as! String] as! [String : Any]
                        var data2 = ["Terapistim", "TerapistimPhone"]
                        Firestore.firestore().collection("Posts").document(document.get("Phone Number") as! String).collection("Friend").addSnapshotListener { snapshot2, error in
                            if error != nil {print("terapistim ekleme error2")}
                            else{
                                for document2 in snapshot2!.documents {
                                    if document2.exists == true{
                                        Firestore.firestore().collection("Posts").document(document2.get("friendPhone") as! String).setData(data , mergeFields: data2)
                                         }
                                        }
                                       }
                                      }
                                     }
                                    }
                                   }
                                  }
        
        
    }
    
    func makeAlert (title: String, message: String, okTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
    
  
    var phoneNumber : String?
    
    
    @IBAction func ekleButton(_ sender: Any) {
        
        var data = ["friendName":textView.text!, "friendPhone":""] as [String:Any]
        var friend = ["friend":textView.text!] as [String:Any]
        
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("Ekle Butonunda error oldu")}
            else {
                if snapshot?.isEmpty != true && snapshot != nil {
                var x = 0
                    for document in snapshot!.documents{

                        if self.textView.text! == document.get("Kullanıcı") as! String{
                            x = 1

                            data["friendPhone"] = document.get("Phone Number")
                            
                            Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Friend").document(self.textView.text!).setData(data)
                            self.friendArray.removeAll()
                            
                        }
                    }
                    if x == 0{
                        let string = """
                       Kullanıcı Bulunamadı!
                       Büyük/Küçük Harf ve Boşlukları doğru girdiğinizden emin olun!
                       """
                        self.makeAlert(title: "Kullanıcı Bulunamadı", message: string, okTitle: "Anladım")
                    }
                  }
                }
              }
            }
    
    func friendCek() {
        Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Friend").addSnapshotListener { snapshot, error in
            if error != nil {print("error111friendCek")}
            else{
                for document in snapshot!.documents {
                    if let friendName = document.documentID as? String {

                            self.friendArray.append(friendName)
                            if document.get("friendPhone") != nil{
                                self.friendPhoneArray.append(document.get("friendPhone") as! String)
                            }
                        }
                    }
                self.tableView.reloadData()
            }
          }
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendProCell") as! friendTableViewCell
        cell.friendLabel.text = friendArray[indexPath.row]
        cell.view.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedFriendPhone = friendPhoneArray[indexPath.row]
        selectedFriend = friendArray[indexPath.row]
        
        self.performSegue(withIdentifier: "friendToHW", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendToHW" {
            let destinationVC = segue.destination as! homeworkViewController
            destinationVC.selectedFriend = selectedFriend
            destinationVC.selectedFriendPhone = selectedFriendPhone
            
          
            
            
        }
    }
}
