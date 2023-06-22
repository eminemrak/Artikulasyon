//
//  veliHarfEkleViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 14.11.2022.
//

import UIKit
import Firebase


class veliHarfEkleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let bTekText = Data().bTekText
    let bTwoText = Data().bTwoText
    let bMoreText = Data().bMoreText
    
    var cTekText = Data().cTekText
    var cTwoText = Data().cTwoText
    var cMoreText = Data().cMoreText
    
    var çTekText = Data().çTekText
    var çTwoText = Data().çTwoText
    var çMoreText = Data().çMoreText
    
    var dTekText = Data().dTekText
    var dTwoText = Data().dTwoText
    var dMoreText = Data().dMoreText
    
    var fTekText = Data().fTekText
    var fTwoText = Data().fTwoText
    var fMoreText = Data().fMoreText
    
    var gTekText = Data().gTekText
    var gTwoText = Data().gTwoText
    var gMoreText = Data().gMoreText
    
    var hTekText = Data().hTekText
    var hTwoText = Data().hTwoText
    var hMoreText = Data().hMoreText
    
    var jTekText = Data().jTekText
    var jTwoText = Data().jTwoText
    var jMoreText = Data().jMoreText
    
    var kTekText = Data().kTekText
    var kTwoText = Data().kTwoText
    var kMoreText = Data().kMoreText
    
    var lTekText = Data().lTekText
    var lTwoText = Data().lTwoText
    var lMoreText = Data().lMoreText
    
    var mTekText = Data().mTekText
    var mTwoText = Data().mTwoText
    var mMoreText = Data().mMoreText
    
    var nTekText = Data().nTekText
    var nTwoText = Data().nTwoText
    var nMoreText = Data().nMoreText
    
    var pTekText = Data().pTekText
    var pTwoText = Data().pTwoText
    var pMoreText = Data().pMoreText
    
    var rTekText = Data().rTekText
    var rTwoText = Data().rTwoText
    var rMoreText = Data().rMoreText
    
    var sTekText = Data().sTekText
    var sTwoText = Data().sTwoText
    var sMoreText = Data().sMoreText
    
    var şTekText = Data().şTekText
    var şTwoText = Data().şTwoText
    var şMoreText = Data().şMoreText
    
    var tTekText = Data().tTekText
    var tTwoText = Data().tTwoText
    var tMoreText = Data().tMoreText
    
    var vTekText = Data().vTekText
    var vTwoText = Data().vTwoText
    var vMoreText = Data().vMoreText
    
    var yTekText = Data().yTekText
    var yTwoText = Data().yTwoText
    var yMoreText = Data().yMoreText
    
    var zTekText = Data().zTekText
    var zTwoText = Data().zTwoText
    var zMoreText = Data().zMoreText

    
    
    var Dataa1 = [String : Any]()
    var Dataa2 = [String : Any]()
    var Dataa3 = [String : Any]()
    
    
    
    var harfArray = ["B Harfi","C Harfi","Ç Harfi","D Harfi","F Harfi","G Harfi",
                     "H Harfi","J Harfi","K Harfi","L Harfi","M Harfi","N Harfi",
                     "P Harfi","R Harfi","S Harfi","Ş Harfi","T Harfi","V Harfi","Y Harfi","Z Harfi"]
    
    var eklenenHarfArray = [String]()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("süper çalıştı")
        print(eklenenHarfArray)
        deneme()
        print(eklenenHarfArray)

        tableView.delegate = self
        tableView.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        
        print(eklenenHarfArray)

        
        setDataForEklenen()

        
        
        
        
    }
    
    func deneme() {
        print("deneme çalıştı")
        Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Eklenenler").addSnapshotListener { snapshot, error in
            if error != nil {
                print("harf ekle veri çek error")
            }else{
                self.eklenenHarfArray.removeAll()
                for document in snapshot!.documents{
                    self.eklenenHarfArray.append(document.documentID)
                }
                self.tableView.reloadData()
                self.tableView2.reloadData()
                self.setDataForEklenen()
            }
        }
    }
    
    func setDataForEklenen() {
        for harf in eklenenHarfArray{
            
            if harf == "B Harfi"{
                for i in bTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in bTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in bMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("B'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("B'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("B'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            if harf == "C Harfi"{
                for i in cTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in cTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in cMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("C'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("C'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("C'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            
            if harf == "Ç Harfi"{
                for i in çTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in çTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in çMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ç'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ç'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ç'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            if harf == "D Harfi"{
                for i in dTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in dTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in dMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("D'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("D'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("D'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            
            
            if harf == "F Harfi"{
                for i in fTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in fTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in fMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("F'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("F'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("F'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            
            if harf == "G Harfi"{
                for i in gTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in gTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in gMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("G'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("G'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("G'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }



            if harf == "H Harfi"{
                for i in hTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in hTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in hMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("H'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("H'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("H'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "J Harfi"{
                for i in jTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in jTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in jMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("J'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("J'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("J'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "K Harfi"{
                for i in kTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in kTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in kMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("K'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("K'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("K'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            
            if harf == "L Harfi"{
                for i in lTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in lTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in lMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("L'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("L'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("L'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "M Harfi"{
                for i in mTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in mTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in mMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("M'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("M'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("M'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "N Harfi"{
                for i in nTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in nTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in nMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("N'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("N'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("N'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            
            if harf == "P Harfi"{
                for i in pTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in pTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in pMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("P'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("P'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("P'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }


            if harf == "R Harfi"{
                for i in rTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in rTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in rMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("R'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("R'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("R'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            if harf == "S Harfi"{
                for i in sTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in sTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in sMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("S'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("S'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("S'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            if harf == "Ş Harfi"{
                for i in şTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in şTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in şMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ş'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ş'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Ş'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "T Harfi"{
                for i in tTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in tTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in tMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("T'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("T'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("T'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            if harf == "V Harfi"{
                for i in vTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in vTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in vMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("V'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("V'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("V'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }

            
            if harf == "Y Harfi"{
                for i in yTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in yTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in yMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Y'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Y'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Y'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }
            
            
            if harf == "Z Harfi"{
                for i in zTekText{
                    Dataa1["\(i)"] = "yıldızlı değil"
                }
                for i in zTwoText{
                    Dataa2["\(i)"] = "yıldızlı değil"
                    
                }
                for i in zMoreText{
                    Dataa3["\(i)"] = "yıldızlı değil"
                    
                }
                
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Z'nin Tek Heceli").setData(Dataa1)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Z'nin İki Heceli").setData(Dataa2)
                Firestore.firestore().collection("Posts").document((Auth.auth().currentUser?.phoneNumber)!).collection("Stars").document("Z'nin Çok Heceli").setData(Dataa3)
                Dataa1.removeAll()
                Dataa2.removeAll()
                Dataa3.removeAll()
            }


            
            
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number çalıştı")
        
        
        var x = 0
        
        //Tüm harflerin listelendiği tableView için işlem yapıyoruz
        if tableView == self.tableView {
            x =  harfArray.count
        }
        //Seçilen harflerin listelendiği tableView2 için işlem yapıyoruz
        else{
            x = eklenenHarfArray.count
        }
        
        return x
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row çalıştı")
        let cell = UITableViewCell()
        if tableView == self.tableView {
            
            cell.textLabel?.text = harfArray[indexPath.row]
            for eklenenler in eklenenHarfArray{
                if cell.textLabel?.text == eklenenler {
                    cell.backgroundColor = UIColor.systemGray
                    cell.isUserInteractionEnabled = false
                }
            }
        }else{
            cell.textLabel?.text = eklenenHarfArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select çalıştı")
        
        if tableView == self.tableView {

            Firestore.firestore().collection("Posts")
                .document((Auth.auth().currentUser?.phoneNumber)!)
                .collection("Eklenenler").document(harfArray[indexPath.row])
                .setData([harfArray[indexPath.row]: "Eklendi"])
 
            deneme()
        }
        else{
            Firestore.firestore().collection("Posts")
                .document((Auth.auth().currentUser?.phoneNumber)!)
                .collection("Eklenenler")
                .document(eklenenHarfArray[indexPath.row]).delete()
            deneme()
        }
    }
}
    
    

    
 


