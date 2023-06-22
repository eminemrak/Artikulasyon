//
//  hwDetailsViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 11.11.2022.
//

import UIKit
import Firebase


class hwDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    

    @IBOutlet weak var tableView: UITableView!

    var selectedFriendPhone : String?

    var selectedHW : String? // hangi başlığa tıkladığı
    var selectedFriend : String? // hangi veliye tıkladığı
    var ödevListesi : [String : Any] = [:] // etkileşime girdiği örnekler
    var ödevListesiArray1 = [String]() // örnekler
    var ödevListesiArray2 = [String]() // yıldızlı / yıldızlı değil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        

        tableView.delegate = self
        tableView.dataSource = self
        veriCek()
    }
    
    func veriCek() {
      
        
        Firestore.firestore().collection("Posts").document(selectedFriendPhone!).collection("Stars").addSnapshotListener { snapshot, error in
            if error != nil {print("hw veri cek error")}
            else{
                self.ödevListesi.removeAll()
                self.ödevListesiArray1.removeAll()
                self.ödevListesiArray2.removeAll()
                for document in snapshot!.documents {
                    if document.documentID == self.selectedHW{
                        print("selektedHW çalıştı.")
                        self.ödevListesi = document.data()
                        
                    }
                }
                for i in self.ödevListesi.keys{self.ödevListesiArray1.append(i)}
                for i in self.ödevListesi.values{self.ödevListesiArray2.append("\(i)")}

                self.tableView.reloadData()
            }
        }
   
    }
            
            
                    
                    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ödevListesiArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hwDetailsTableViewCell") as! hwDetailsTableViewCell
        cell.label.text = ödevListesiArray1[indexPath.row] + " : " + ödevListesiArray2[indexPath.row]
        
        cell.view.layer.cornerRadius = 20
        return cell
    }
    

 

}


