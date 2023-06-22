//
//  SecenekViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 25.07.2022.
//

import UIKit
import Firebase

class SecenekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var secenekler = ["Tek Heceli", "İki Heceli","Çok Heceli" ] //her harf için 3 seçenek mevcut.
    var selectedHarf : String? //Bir önce ki sayfada hangi harfin seçildiğini bu nesneye aktarıyoruz.
    var selectedSecenek : String? // Bir sonra ki sayfada hangi harfin seçildiğini aktarmak için oluşturdum.
    var starTotalSayısı = [0,0,0] //bu array değişkenleri sabit olucak zaten uygulamada en son kaç adet örnek olduğunu belirticek.
    
    
    
    var starSayısı = [0,0,0] //tek iki çok heceli seçenekler için totalde ne kadar yıldız toplandığını görmek için array oluşturdum.
    
    
    var tek = 0
    var two = 0
    var more = 0
    
    var toplananStarr = 0
    
    var secenekDetaylı = ["B'nin Tek Heceli", "B'nin İki Heceli", "B'nin Çok Heceli", "CCC"]
    var denemeDic : [String : Int] = [:]
    
   
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
          
         var toplananStar = 0
          
          
          
          Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").addSnapshotListener { snapshot, error in
              if error != nil {print("toplanan star sayısı çekilirken sorun oluştu")}
              else{
                  for document in snapshot!.documents {
                      toplananStar = 0
                      for keys in document.data().keys {
                          if document[keys] as? String == "yıldızlı" {
                              toplananStar += 1
                              
                          }
                          
                      }
                      
                      self.denemeDic[document.documentID] = toplananStar
                      
                  }
                  
                  Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Total Stars").document("Total Stars").setData(self.denemeDic)
                  
                  
                  if self.selectedHarf == "B Harfi" {
                    self.tek = self.denemeDic["B'nin Tek Heceli"]!
                    self.two = self.denemeDic["B'nin İki Heceli"]!
                    self.more = self.denemeDic["B'nin Çok Heceli"]!
                      self.starTotalSayısı = [18,37,30]
                  }
                  
                  if self.selectedHarf == "C Harfi" {
                    self.tek = self.denemeDic["C'nin Tek Heceli"]!
                    self.two = self.denemeDic["C'nin İki Heceli"]!
                    self.more = self.denemeDic["C'nin Çok Heceli"]!
                      self.starTotalSayısı = [11,28,18]

                  }
                  
                  if self.selectedHarf == "Ç Harfi" {
                    self.tek = self.denemeDic["Ç'nin Tek Heceli"]!
                    self.two = self.denemeDic["Ç'nin İki Heceli"]!
                    self.more = self.denemeDic["Ç'nin Çok Heceli"]!
                      self.starTotalSayısı = [29,51,24]

                  }
                  
                  if self.selectedHarf == "D Harfi" {
                    self.tek = self.denemeDic["D'nin Tek Heceli"]!
                    self.two = self.denemeDic["D'nin İki Heceli"]!
                    self.more = self.denemeDic["D'nin Çok Heceli"]!
                      self.starTotalSayısı = [21,40,36]

                  }
                  
                  if self.selectedHarf == "F Harfi" {
                    self.tek = self.denemeDic["F'nin Tek Heceli"]!
                    self.two = self.denemeDic["F'nin İki Heceli"]!
                    self.more = self.denemeDic["F'nin Çok Heceli"]!
                      self.starTotalSayısı = [16,43,24]

                  }
                  
                  if self.selectedHarf == "G Harfi" {
                    self.tek = self.denemeDic["G'nin Tek Heceli"]!
                    self.two = self.denemeDic["G'nin İki Heceli"]!
                    self.more = self.denemeDic["G'nin Çok Heceli"]!
                      self.starTotalSayısı = [18,40,24]

                  }
                  
                  if self.selectedHarf == "H Harfi" {
                    self.tek = self.denemeDic["H'nin Tek Heceli"]!
                    self.two = self.denemeDic["H'nin İki Heceli"]!
                    self.more = self.denemeDic["H'nin Çok Heceli"]!
                      self.starTotalSayısı = [11,38,25]

                  }
                  
                  if self.selectedHarf == "J Harfi" {
                    self.tek = self.denemeDic["J'nin Tek Heceli"]!
                    self.two = self.denemeDic["J'nin İki Heceli"]!
                    self.more = self.denemeDic["J'nin Çok Heceli"]!
                      self.starTotalSayısı = [5,13,13]

                  }
                  
                  if self.selectedHarf == "K Harfi" {
                    self.tek = self.denemeDic["K'nin Tek Heceli"]!
                    self.two = self.denemeDic["K'nin İki Heceli"]!
                    self.more = self.denemeDic["K'nin Çok Heceli"]!
                      self.starTotalSayısı = [58,60,54]

                  }
                  
                  if self.selectedHarf == "L Harfi" {
                    self.tek = self.denemeDic["L'nin Tek Heceli"]!
                    self.two = self.denemeDic["L'nin İki Heceli"]!
                    self.more = self.denemeDic["L'nin Çok Heceli"]!
                      self.starTotalSayısı = [28,49,35]

                  }
                  
                  if self.selectedHarf == "M Harfi" {
                    self.tek = self.denemeDic["M'nin Tek Heceli"]!
                    self.two = self.denemeDic["M'nin İki Heceli"]!
                    self.more = self.denemeDic["M'nin Çok Heceli"]!
                      self.starTotalSayısı = [16,48,39]

                  }
                  
                  if self.selectedHarf == "N Harfi" {
                    self.tek = self.denemeDic["N'nin Tek Heceli"]!
                    self.two = self.denemeDic["N'nin İki Heceli"]!
                    self.more = self.denemeDic["N'nin Çok Heceli"]!
                      self.starTotalSayısı = [17,53,42]

                  }
                  
                  if self.selectedHarf == "P Harfi" {
                    self.tek = self.denemeDic["P'nin Tek Heceli"]!
                    self.two = self.denemeDic["P'nin İki Heceli"]!
                    self.more = self.denemeDic["P'nin Çok Heceli"]!
                      self.starTotalSayısı = [28,49,41]

                  }
                  
                  if self.selectedHarf == "R Harfi" {
                    self.tek = self.denemeDic["R'nin Tek Heceli"]!
                    self.two = self.denemeDic["R'nin İki Heceli"]!
                    self.more = self.denemeDic["R'nin Çok Heceli"]!
                      self.starTotalSayısı = [21,48,32]

                  }
                  
                  if self.selectedHarf == "S Harfi" {
                    self.tek = self.denemeDic["S'nin Tek Heceli"]!
                    self.two = self.denemeDic["S'nin İki Heceli"]!
                    self.more = self.denemeDic["S'nin Çok Heceli"]!
                      self.starTotalSayısı = [30,59,59]

                  }
                  
                  if self.selectedHarf == "Ş Harfi" {
                    self.tek = self.denemeDic["Ş'nin Tek Heceli"]!
                    self.two = self.denemeDic["Ş'nin İki Heceli"]!
                    self.more = self.denemeDic["Ş'nin Çok Heceli"]!
                      self.starTotalSayısı = [24,45,31]

                  }
                  
                  if self.selectedHarf == "T Harfi" {
                    self.tek = self.denemeDic["T'nin Tek Heceli"]!
                    self.two = self.denemeDic["T'nin İki Heceli"]!
                    self.more = self.denemeDic["T'nin Çok Heceli"]!
                      self.starTotalSayısı = [48,56,42]

                  }
                  
                  if self.selectedHarf == "V Harfi" {
                    self.tek = self.denemeDic["V'nin Tek Heceli"]!
                    self.two = self.denemeDic["V'nin İki Heceli"]!
                    self.more = self.denemeDic["V'nin Çok Heceli"]!
                      self.starTotalSayısı = [6,39,19]

                  }
                  
                  if self.selectedHarf == "Y Harfi" {
                    self.tek = self.denemeDic["Y'nin Tek Heceli"]!
                    self.two = self.denemeDic["Y'nin İki Heceli"]!
                    self.more = self.denemeDic["Y'nin Çok Heceli"]!
                      self.starTotalSayısı = [23,50,20]

                  }
                  
                  if self.selectedHarf == "Z Harfi" {
                    self.tek = self.denemeDic["Z'nin Tek Heceli"]!
                    self.two = self.denemeDic["Z'nin İki Heceli"]!
                    self.more = self.denemeDic["Z'nin Çok Heceli"]!
                      self.starTotalSayısı = [21,46,17]

                  }
                  
                  
                  self.starSayısı[0] = self.tek
                  self.starSayısı[1] = self.two
                  self.starSayısı[2] = self.more
                  self.tableView.reloadData()
   
                    }
                }
        
        
        
            }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return secenekler.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "secenekProCell") as! secenekTableViewCell
        
        cell.secenekTextLabel.text = secenekler[indexPath.row]
        cell.starTextLabel.text = String(starSayısı[indexPath.row])
        cell.totalTextLabel.text = String(starTotalSayısı[indexPath.row])
        cell.view.layer.cornerRadius = cell.view.frame.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedSecenek = secenekler[indexPath.row]
        
        
        self.performSegue(withIdentifier: "secenekToSlides", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secenekToSlides" {
            let destinationVC = segue.destination as! SlidesViewController
            destinationVC.selectedSecenek = selectedSecenek
            destinationVC.selectedHarf = selectedHarf
            
        }
    }
    
}

 

