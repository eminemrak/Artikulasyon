//
//  homeworkViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 6.11.2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class homeworkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mesajButton: UIButton!
    var selectedFriendPhone : String?
    var myUserName = ""
    var selectedHW : String?
    var bStars = [Int]()
    var selectedFriend : String?
    var dökümanlar = [String]()
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        label.text = selectedFriend
        label.layer.cornerRadius = 20
        
        mesajButton.layer.cornerRadius = 20
        
       
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("veliHomeError")}
            else{
                for document in snapshot!.documents{
                    if document.documentID == Auth.auth().currentUser?.phoneNumber{
                        self.myUserName = document.get("Kullanıcı") as! String
                    }
                  }
                }
              }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        friendVeriCek()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    var cekilenveriDic : [String : Any] = [:]
    
    func friendVeriCek() {
        
        Firestore.firestore().collection("Posts").document(selectedFriendPhone!).collection("Stars").addSnapshotListener { snapshot, error in
            if error != nil {print("friendVeriCek Error Verdi")}
            else{
                self.dökümanlar.removeAll()
                for document in snapshot!.documents{
                    if let döküman = document.documentID as? String {self.dökümanlar.append(döküman)}
                }
                self.tableView.reloadData()
              }
            }
          }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dökümanlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hwTableViewCell") as! hwTableViewCell
        cell.label.text = "\(dökümanlar[indexPath.row])"
        
        cell.view.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedHW = dökümanlar[indexPath.row]
        self.performSegue(withIdentifier: "hwToDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hwToDetails" {
            let destinationVC = segue.destination as! hwDetailsViewController
            destinationVC.selectedHW = selectedHW
            destinationVC.selectedFriend = selectedFriend
            destinationVC.selectedFriendPhone = selectedFriendPhone
        }
        
        if segue.identifier == "hwToMessage"{
            let destinationVC = segue.destination as! MessageViewController
            destinationVC.selectedFriend = selectedFriend
            destinationVC.selectedFriendPhone = selectedFriendPhone
            destinationVC.myUserName = myUserName
            
        }
      }
    
    
    @IBAction func messageButton(_ sender: Any) {
        self.performSegue(withIdentifier: "hwToMessage", sender: nil)

    }
    


}
