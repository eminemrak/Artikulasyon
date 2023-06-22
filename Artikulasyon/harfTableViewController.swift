//
//  harfTableViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 24.07.2022.
//

import UIKit
import Firebase
// Harfler listelenecek. Hangi harfin seçildiği Seçenekler view'ına aktarılacak.


class harfTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var harfTableView: UITableView!
    
//    yeni struct oluşturmadan direkt harfleri listeledim
    var harfArray = ["B Harfi","C Harfi","Ç Harfi","D Harfi","F Harfi","G Harfi",
                     "H Harfi","J Harfi","K Harfi","L Harfi","M Harfi","N Harfi",
                     "P Harfi","R Harfi","S Harfi","Ş Harfi","T Harfi","V Harfi","Y Harfi","Z Harfi"]

//    hangi harfin seçildiğini aktarabilmek için yeni değişken oluşturdum
    var selectedHarf : String?
    
    var rol : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        harfTableView.separatorStyle = .none
        harfTableView.showsVerticalScrollIndicator = false
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("error scene")}
            else {
                for document in snapshot!.documents {
                    if document.documentID == Auth.auth().currentUser?.phoneNumber {
                        if document.get("Rol") as! String == "Terapist"{
                            self.rol = "Terapist"
                        }else {
                            self.rol = "Veli"
                        }
                    }
                }
            }
        }
        harfTableView.dataSource = self
        harfTableView.delegate = self
        
        deneme()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Harf sayısı kadar satırımız olsun listede
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var x = 0
   
        if rol == "Terapist" {
            x = harfArray.count
        }
        
        if rol == "Veli" {
            x = eklenenHarfArray.count
        }
 
        return x
    }
    
    
//    prototypeCell oluşturdum ancak şu an sadece Label var içinde.
//    Bunun içinde HarfTableViewCell diye yeni dosya oluşturdum
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = harfTableView.dequeueReusableCell(withIdentifier: "proCell") as! HarfTableViewCell
        
        
        if rol == "Terapist" {
            cell.label.text! = self.harfArray[indexPath.row]

        }
        if rol == "Veli" {
            cell.label.text! = self.eklenenHarfArray[indexPath.row]

        }


        
        cell.view.layer.cornerRadius = cell.view.frame.height / 2
     

    
        return cell
    }
    
    
    
    //Seçilen satırdaki harfi direkt yeni bir nesneye çeviriyor, diğer fonksiyonda, seçildiğinde oluşturulan harf nesnesini diğer view'a gönderiyor.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if rol == "Terapist" {
            selectedHarf = harfArray[indexPath.row]

        }
        
        if rol == "Veli" {
            selectedHarf = eklenenHarfArray[indexPath.row]

        }
        
        
        
        
        
   
        
        self.performSegue(withIdentifier: "harfToSecenek", sender: nil)
    }

//    diğer sayfadaki değişken içeriğini; bu sayfada ki değişken ile eşitliyor.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "harfToSecenek" {
            let destinationVC = segue.destination as! SecenekViewController
            destinationVC.selectedHarf = selectedHarf
        }
    }
    
    var eklenenHarfArray = [String]()
    func deneme() {
        print("deneme çalıştı")
        Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Eklenenler").addSnapshotListener { snapshot, error in
            if error != nil {
                print("harf ekle veri çek error")
            }else{
                for document in snapshot!.documents{
                    self.eklenenHarfArray.append(document.documentID)
                }
              self.harfTableView.reloadData()
              
            }
        }
    }

    
  
        
    }
    
    
    

